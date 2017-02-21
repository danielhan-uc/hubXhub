(* ll ir compilation -------------------------------------------------------- *)

open Ll
open X86


(* allocated llvmlite function bodies --------------------------------------- *)

(* Generating X86 assembly is tricky, and it helps to split the problem into
   two parts:

   1) Figuring out how to represent states of the LLVMlite machine as
      those of the X86lite machine, i.e. where should we store uid %x
      or global @foo, and

   2) Choosing the X86 instructions that will correspond to LLVMlite
      instructions while maintaining this relationship: For example,
      what sequence of X86 instructions will implement the
      "getelementptr" instruction, assuming that we know the arguments
      are in such and such X86 registers?

   To do this, we will introduce a slightly different representation
   of LLVMlite, where uids, globals, and labels have been replaced
   with their X86 counterparts.  Uids can be mapped onto X86
   registers, stack slots or, for instructions like "store" that do
   not assign to their uid, no storage. Additionally, since in
   LLVMlite labels and uids share a namespace, some uids correspond to
   code labels.

   Rather than working directly with the LLVMlite AST, we will be
   using a flattened "stream of instructions" representation like the
   one you saw in class. Once we have decided how we want to represent
   LLVMlite states in X86, we can convert programs to this
   representation. Then, we will have to choose X86 instructions to
   correspond to the "allocated" LLVMlite instruction stream.
*)
module Alloc = struct

(* X86 locations *)
type loc =
  | LVoid                       (* no storage *)
  | LReg of X86.reg             (* x86 register *)
  | LStk of int                 (* a stack offset from %rbp *)
  | LLbl of X86.lbl             (* an assembler label *)

type operand =
  | Null
  | Const of int64
  | Gid of X86.lbl
  | Loc of loc

type insn =
  | ILbl (* Label *)
  | Binop of bop * ty * operand * operand (* i64 x i64 → i64 *)
  | Alloca of ty (*	- → S *)
  | Load of ty * operand (* S* → S *)
  | Store of ty * operand * operand (* S x S* → void *)
  | Icmp of Ll.cnd * ty * operand * operand (* S x S → i1 *)
  | Call of ty * operand * (ty * operand) list (* S1(S2, ..., SN)* x S2 x ... x SN → S1 *)
  | Bitcast of ty * operand * ty (* T1* → T2* *)
  | Gep of ty * operand * operand list (* T1* x i64 x ... x i64 -> GEPTY(T1, OP1, ..., OPN) *)
  | Ret of ty * operand option (* terminator *)
  | Br of loc (* terminator *)
  | Cbr of operand * loc * loc (* terminator *)

(* An allocated function body is just a flattened list of instructions,
   labels, and terminators. All uids, labels, and gids are replaced with the
   associated parts of the x86 machine *)
type fbody = (loc * insn) list

(* Converting between Ll function bodies and allocate function bodies given
   two functions
   f : uid -> loc
   g : gid -> X86.lbl *)
let map_operand f g : Ll.operand -> operand = function
  | Null -> Null
  | Const i -> Const i
  | Gid x -> Gid (g x)
  | Id u -> Loc (f u)

let map_insn f g : Ll.insn -> insn =
  let mo = map_operand f g in function
  | Binop (b,t,o,o') -> Binop (b,t,mo o,mo o')
  | Alloca t         -> Alloca t
  | Load (t,o)       -> Load (t,mo o)
  | Store (t,o,o')   -> Store (t,mo o,mo o')
  | Icmp (c,t,o,o')  -> Icmp (c,t,mo o,mo o')
  | Call (t,o,args)  -> Call (t,mo o,List.map (fun (t,o) -> t, mo o) args)
  | Bitcast (t,o,t') -> Bitcast (t,mo o,t')
  | Gep (t,o,is)     -> Gep (t,mo o,List.map mo is)

let map_terminator f g : Ll.terminator -> insn =
  let mo = map_operand f g in function
  | Ret (t,None)   -> Ret (t, None)
  | Ret (t,Some o) -> Ret (t, Some (mo o))
  | Br l           -> Br (f l)
  | Cbr (o,l,l')   -> Cbr (mo o,f l,f l')

let of_block f g (b:Ll.block) : fbody =
  List.map (fun (u,i) -> f u, map_insn f g i) b.insns
  @ [LVoid, map_terminator f g b.terminator]

let of_lbl_block f g (l,b:Ll.lbl * Ll.block) : fbody =
  (LLbl (Platform.mangle l), ILbl)::of_block f g b

let of_cfg f g (e,bs:Ll.cfg) : fbody =
  List.(flatten @@ of_block f g e :: map (of_lbl_block f g) bs)

end

(* locals and layout -------------------------------------------------------- *)

(* One key problem in compiling the LLVM IR is how to map its local
   identifiers to X86 abstractions.  For the best performance, one
   would want to use an X86 register for each LLVM %uid that is assigned
   a value.  However, since there are an unlimited number of %uids and
   only 16 registers, doing so effectively is quite difficult. We will
   see later in the course how _register allocation_ algorithms can do a
   good job at this.

   A simpler, but less performant, implementation is to map each %uid
   in the LLVM source to a _stack slot_ (i.e. a region of memory in
   the stack). Since LLVMlite, unlike real LLVM, permits %uid locals
   to store only 64-bit data, each stack slot is an 8-byte value.

   [ NOTE: For compiling LLVMlite, even i1 data values should be
   represented as a 8-byte quad. This greatly simplifies code
   generation. ]

   We call the datastructure that maps each %uid to its stack slot a
   'stack layout'. A stack layout maps a uid to an Alloc.loc that represents
   where it will be stored. Recall that some uids identify instructions that
   do not assign a value, whereas others name code blocks. These are mapped to
   Alloc.LVoid, and Alloc.LLbl, respectively. For this compilation strategy,
   uids that are assigned values will always be assigned an offset from ebp
   (in bytes) that corresponds to a storage slot in the stack.
*)
type layout = (uid * Alloc.loc) list


(* Once we have a layout, it's simple to generate the allocated version of our
   LLVMlite program *)
let alloc_cfg (layout:layout) (g:Ll.cfg) : Alloc.fbody =
  Alloc.of_cfg (fun x -> List.assoc x layout)
               (fun l -> Platform.mangle l) g

(* streams of x86 instructions ---------------------------------------------- *)

type x86elt =
  | I of X86.ins
  | L of (X86.lbl * bool)

type x86stream = x86elt list

let lift : X86.ins list -> x86stream =
  List.rev_map (fun i -> I i)

let ( >@ ) x y = y @ x
let ( >:: ) x y = y :: x

let prog_of_x86stream : x86stream -> X86.prog =
  let rec loop p iis = function
    | [] -> (match iis with [] -> p | _ -> failwith "stream has no initial label")
    | (I i)::s' -> loop p (i::iis) s'
    | (L (l,global))::s' -> loop ({ lbl=l; global; asm=Text iis }::p) [] s'
  in loop [] []

(* compiling operands  ------------------------------------------------------ *)

(* LLVM IR instructions support several kinds of operands.

   LL local %uids live in stack slots, whereas global ids live at
   global addresses that must be computed from a label.  Constants are
   immediately available, and the operand Null is the 64-bit 0 value.

   You might find it useful to implement the following helper function,
   whose job is to generate the X86 operand corresponding to an allocated
   LLVMlite operand.
 *)
let compile_operand : Alloc.operand -> X86.operand =
  function
  | Null -> Imm Lit 0
  | Const i64 -> Imm Lit i64
  | Gid lbl -> Imm Lbl lbl
  | Loc loc ->
    begin match loc with
    | LReg reg -> Reg reg
    | LStk x -> Ind3 (Lit x, Rbp)
    | LLbl lbl -> Imm Lbl lbl (*Block Labels*)
    | LVoid -> Imm Lit 0
    end

(* compiling call  ---------------------------------------------------------- *)

(* You will probably find it helpful to implement a helper function that
   generates code for the LLVM IR call instruction.

   The code you generate should follow the x64 System V AMD64 ABI
   calling conventions, which places the first six 64-bit (or smaller)
   values in registers and pushes the rest onto the stack.  Note that,
   since all LLVM IR operands are 64-bit values, the first six
   operands will always be placed in registers.  (See the notes about
   compiling fdecl below.)

   [ NOTE: It is the caller's responsibility to clean up arguments
   pushed onto the stack, so you must free the stack space after the
   call returns. ]

   [ NOTE: Don't forget to preserve caller-save registers (only if
   needed). ]
*)



let compile_call (fo:Alloc.operand) (os:(ty * Alloc.operand) list) : x86stream =
failwith "compile_call unimplemented"

(* compiling getelementptr (gep)  ------------------------------------------- *)

(* The getelementptr instruction computes an address by indexing into
   a datastructure, following a path of offsets.  It computes the
   address based on the size of the data, which is dictated by the
   data's type.

   To compile getelmentptr, you must generate x86 code that performs
   the appropriate arithemetic calculations.
*)

(* [size_ty] maps an LLVMlite type to a size in bytes.
    (needed for getelementptr)

   - the size of a struct is the sum of the sizes of each component
   - the size of an array of t's with n elements is n * the size of t
   - all pointers, I1, and I64 are 8 bytes
   - the size of a named type is the size of its definition

   - Void, i8, and functions have undefined sizes according to LLVMlite.
     Your function should simply return 0 in those cases
*)
let rec size_ty tdecls t : int =
failwith "size_ty not implemented"

(* Generates code that computes a pointer value.

   1. o must be a pointer of type t=*t'

   2. the value of o is the base address of the calculation

   3. the first index in the path is treated as the index into an array
     of elements of type t' located at the base address

   4. subsequent indices are interpreted according to the type t':

     - if t' is a struct, the index must be a constant n and it
       picks out the n'th element of the struct. [ NOTE: the offset
       within the struct of the n'th element is determined by the
       sizes of the types of the previous elements ]

     - if t' is an array, the index can be any operand, and its
       value determines the offset within the array.

     - if t' is any other type, the path is invalid

     - make sure you can handle named types!

   5. if the index is valid, the remainder of the path is computed as
      in (4), but relative to the type f the sub-element picked out
      by the path so far
*)

let compile_getelementptr tdecls (t:Ll.ty)
                          (o:Alloc.operand) (os:Alloc.operand list) : x86stream =
failwith " unimplemented"

(* compiling instructions within function bodies ---------------------------- *)

(* An Alloc.fbody value is a list of LLVM lite labels, instructions,
   and terminators.  The compile_fbody function can process each of these
   in sequence, generating a corresponding stream of x86 instructions.

   The result of compiling a single LLVM instruction might be many x86
   instructions.  We have not determined the structure of this code
   for you. Some of the instructions require only a couple assembly
   instructions, while others require more.  We have suggested that
   you need at least compile_operand, compile_call, and compile_gep
   helpers; you may introduce more as you see fit.

   Here are a few tips:

   - The goal of this project is _not_ to produce efficient code. Emit
     extra moves liberally, using Rax and Rcx as scratch registers.
     You should aim for correctness first, making sure you don't
     violate restrictions of x86-64 assembly (e.g. the number of
     memory operands allowed for an instruction!)

   - The type of x86streams and their operations make appending to a
     stream efficient. You might find it useful to define a tail-
     recursive helper function that passes an output stream as an
     accumulator.

   - Icmp:  the Set instruction may be of use.  Depending on how you
     compile Cbr, you may want to ensure that the value produced by
     Icmp is exactly 0 or 1.

   - Load & Store: these need to dereference the pointers. Const and
     Null operands aren't valid pointers.  Don't forget to
     Platform.mangle the global identifier.

   - Alloca: needs to return a pointer into the stack

   - Bitcast: does nothing interesting at the assembly level

   Compiling block terminators is not too difficult:

   - Ret should properly exit the function: freeing stack space,
     restoring the value of %rbp, and putting the return value (if
     any) in %rax.

   - Br should jump

   - Cbr branch should treat its operand as a boolean conditional

   (* X86 locations *)
   type loc =
     | LVoid                       (* no storage *)
     | LReg of X86.reg             (* x86 register *)
     | LStk of int                 (* a stack offset from %rbp *)
     | LLbl of X86.lbl             (* an assembler label *)

   type operand =
     | Null
     | Const of int64
     | Gid of X86.lbl
     | Loc of loc

   type insn =
     | ILbl (* Label *)
     | Binop of bop * ty * operand * operand (* i64 x i64 → i64 *)
     | Alloca of ty (*	- → S *)
     | Load of ty * operand (* S* → S *)
     | Store of ty * operand * operand (* S x S* → void *)
     | Icmp of Ll.cnd * ty * operand * operand (* S x S → i1 *)
     | Call of ty * operand * (ty * operand) list (* S1(S2, ..., SN)* x S2 x ... x SN → S1 *)
     | Bitcast of ty * operand * ty (* T1* → T2* *)
     | Gep of ty * operand * operand list (* T1* x i64 x ... x i64 -> GEPTY(T1, OP1, ..., OPN) *)
     | Ret of ty * operand option (* terminator *)
     | Br of loc (* terminator *)
     | Cbr of operand * loc * loc (* terminator *)

   type fbody = (loc * insn) list
*)

let translate_binop (binop: bop) : X86.opcode =
  begin match binop with
  | Add -> Addq  | Sub -> Subq   | Mul -> IMulq
  | Shl -> Shlq  | Lshr -> Shrq  | Ashr -> Sarq
  | And -> Andq  | Or -> Orq     | Xor -> Xorq
  end

let translate_icmp (icmp: cnd) : X86.opcode =
  begin match icmp with
  | Eq -> Addq   | Ne -> Subq   | Slt -> IMulq
  | Sle -> Shlq  | Sgt -> Shrq  | Sge -> Sarq
  end

let compile_fbody tdecls (af:Alloc.fbody) : x86stream =
  let cur_stream = [] in
  let rec fbody_helper (cur_stream: x86stream) (af:Alloc.fbody) : x86stream =
  begin match af with
  | [] ->
  | h :: tl ->
    begin match snd h with
    | Binop (b,t,o,o') ->
        fbody_helper (cur_stream @ [I (translate_binop b, [compile_operand o, compile_operand o'])]) tl
    (* | Alloca t         ->  *)
    (* | Load (t,o)       ->  *)
    (* | Store (t,o,o')   ->  *)
    (* | Icmp (c,t,o,o')  -> *)
        (* fbody_helper (cur_stream @ [I (Cmpq, [compile_operand o, compile_operand o'])]) tl
    *)
    | Call (t,o,args)  ->
        fbody_helper (cur_stream @ [compile_call o args]) tl
    (* | Bitcast (t,o,t') ->  *)
    (* | Gep (t,o,is)     ->  *)
    | Ret (t,o)        ->
    (* Ret of ty * operand option  *)
      begin match o with
      | Some c -> c
      | None -> 0


    | Br (l)           ->
    | Cbr (o,l,l')     ->

(* compile_fdecl ------------------------------------------------------------ *)

(* We suggest that you create a helper function that computes the
   layout for a given function declaration.


     loc =
       | LVoid                       (* no storage *)
       | LReg of X86.reg             (* x86 register *)
       | LStk of int                 (* a stack offset from %rbp *)
       | LLbl of X86.lbl             (* an assembler label *)

     fdecl = { fty: fty; param: uid list; cfg: cfg }
     layout = (uid * Alloc.loc) list
     type uid = string                       (* Local identifiers  *)

     fty -> argument types and return type
     param -> arguemnts
     cfg -> control graph which is the program itself

     define i64 @program(i64 %argc, i8** %arcv) {
       // i64 -> return type
       // %argc, %arcv -> LLbl of X86.lbl
       %1 = mul i64 7, 7 -> LStk of int * insn
       %2 = add i64 42, %argc -> LStk of int * insn
       %3 = alloca i64 -> LStk of int * insn
       store i64 %1, i64* %3 -> LVoid * insn
       br label %l1 -> terminator
     l1: -> LLbl of X86.lbl
       %4 = icmp sle i64 64, %2 -> LStk of int * insn
       %5 = load i64, i64* %3 -> LStk of int * insn
       %6 = bitcast i64* %3 to i8* -> LStk of int * insn
       %7 = getelementptr i8, i8* %6, i32 0 -> LStk of int * insn
       %8 = sub i64 %5, 3 -> LStk of int * insn
       store i64 %8, i64* %3 -> LVoid * insn
       %9 = icmp sgt i64 %8, 0 -> LStk of int * insn
       br i1 %9, label %l1, label %l2 -> terminator
     l2: -> LLbl of X86.lbl
       %10 = load i64, i64* %3 -> LStk of int * insn
       ret i64 %10 -> terminator
     }

     (* LLVM IR types *)
     type ty =
       | Void                            (* mix of unit/bottom from C *)
       | I1 | I8 | I64                   (* integer types             *)
       | Ptr of ty                       (* t*                        *)
       | Struct of ty list               (* { t1, t2, ... , tn }      *)
       | Array of int * ty               (* [ NNN x t ]               *)
       | Fun of fty                      (* t1, ..., tn -> tr         *)
       | Namedt of tid                   (* named type aliases        *)

     (* Function type: argument types and return type *)
     and fty = ty list * ty

     (* Control Flow Graph: a pair of an entry block and a set labeled blocks *)
     type cfg = block * (lbl * block) list

     (* Basic blocks *)
     type block = { insns: (uid * insn) list; terminator: terminator }

     (* Block terminators *)
     type terminator =
       | Ret of ty * operand option   (* ret i64 %s                     *)
       | Br of lbl                    (* br label %lbl                  *)
       | Cbr of operand * lbl * lbl   (* br i1 %s, label %l1, label %l2 *)


          - each function argument should be copied into a stack slot
          - in this (inefficient) compilation strategy, each local id
            is also stored as a stack slot.
          - uids associated with instructions that do not assign a value,
            such as Store and a Call of a Void function should be associated
            with Alloc.LVoid
          - LLVMlite uids and labels share a namespace. Block labels you encounter
            should be associated with Alloc.Llbl

            layout = (uid * Alloc.loc) list
*)

let stack_layout (f:Ll.fdecl) : layout =
  let cur_layout = [] in
  (* f.param -> rdi, rsi, rdx, rcx, r09, r10, rbp에서 offset*)
  (* f.cfg -> rbp에서 offset
              call, store -> empty '_'
              block 돌고
              (lbl * block) list 돌고
  *)
  let rec param_helper (cur_layout: (uid * Alloc.loc) list) (l: uid list) (inx: int): (uid * Alloc.loc) list * int=
    begin match l with
    | [] -> (cur_layout, inx - 6)
    | h :: tl ->
      begin match inx with
      | 1 -> param_helper (cur_layout @ [(h, Alloc.LReg Rdi)]) tl 2
      | 2 -> param_helper (cur_layout @ [(h, Alloc.LReg Rsi)]) tl 3
      | 3 -> param_helper (cur_layout @ [(h, Alloc.LReg Rdx)]) tl 4
      | 4 -> param_helper (cur_layout @ [(h, Alloc.LReg Rcx)]) tl 5
      | 5 -> param_helper (cur_layout @ [(h, Alloc.LReg R09)]) tl 6
      | 6 -> param_helper (cur_layout @ [(h, Alloc.LReg R08)]) tl 7
      | x -> param_helper (cur_layout @ [(h, Alloc.LStk (x-6))]) tl (x+1)
      end
    end in
  let rec block_helper (cur_layout: (uid * Alloc.loc) list) (l: (uid * insn) list) (inx: int): (uid * Alloc.loc) list * int=
    begin match l with
    | [] -> (cur_layout, inx)
    | h :: tl ->
      begin match (fst h) with
      | "store" -> block_helper (cur_layout @ [("_", Alloc.LVoid) tl inx
      | "call" -> block_helper (cur_layout @ [("_", Alloc.LVoid) tl inx
      | u -> block_helper (cur_layout @ [(u, Alloc.LStk inx) tl (inx+1)
    end in
  let rec cfg_helper (cur_layout: (uid * Alloc.loc) list) (l: (lbl * block) list) (inx: int): (uid * Alloc.loc) list =
    begin match l with
    | [] -> cur_layout
    | h :: tl ->
      let block = block_helper [] ((snd h).insns) inx in
      cfg_helper (cur_layout @ [(fst h, Alloc.LLbl (fst h))] @ (fst block)) tl (snd block)
    end in
  let temp = param_helper cur_layout f.param 1 in
  cfg_helper (fst temp) (snd f.cfg) (snd temp)

(* The code for the entry-point of a function must do several things:

   - since our simple compiler maps local %uids to stack slots,
     compiling the control-flow-graph body of an fdecl requires us to
     compute the layout (see the discussion of locals and layout). Use
     the provided alloc_cfg function to produce an allocated function
     body.

   - the function code should also comply with the calling
     conventions, typically by moving arguments out of the parameter
     registers (or stack slots) into local storage space.  For our
     simple compilation strategy, that local storage space should be
     in the stack. (So the function parameters can also be accounted
     for in the layout.)

   - the function entry code should allocate the stack storage needed
     to hold all of the local stack slots.
*)

(* This helper function computes the location of the nth incoming
   function argument: either in a register or relative to %rbp,
   according to the calling conventions.  You might find it useful for
   compile_fdecl.

   [ NOTE: the first six arguments are numbered 0 .. 5 ]
*)

let arg_loc (n : int) : X86.operand =
  begin match n with
  | 0 -> Ind2 Rdi
  | 1 -> Ind2 Rsi
  | 2 -> Ind2 Rdx
  | 3 -> Ind2 Rcx
  | 4 -> Ind2 R09
  | 5 -> Ind2 R08
  | x -> Ind3 (x - 5, Rbp)
  end


let compile_fdecl tdecls (g:gid) (f:Ll.fdecl) : x86stream =
  let body = alloc_cfg (stack_layout f) f.cfg in
  compile_fbody tdecls body



(* compile_gdecl ------------------------------------------------------------ *)

(* Compile a global value into an X86 global data declaration and map
   a global uid to its associated X86 label.
*)
let rec compile_ginit = function
  | GNull      -> [Quad (Lit 0L)]
  | GGid gid   -> [Quad (Lbl (Platform.mangle gid))]
  | GInt c     -> [Quad (Lit c)]
  | GString s  -> [Asciz s]
  | GArray gs
  | GStruct gs -> List.map compile_gdecl gs |> List.flatten

and compile_gdecl (_, g) = compile_ginit g

(* compile_prog ------------------------------------------------------------- *)

let compile_prog {tdecls; gdecls; fdecls} : X86.prog =
  let g = fun (lbl, gdecl) -> Asm.data (Platform.mangle lbl) (compile_gdecl gdecl) in
  let f = fun (name, fdecl) -> prog_of_x86stream @@ compile_fdecl tdecls name fdecl in
  (List.map g gdecls) @ (List.map f fdecls |> List.flatten)
