open Ll
open Ast

(* instruction streams ------------------------------------------------------ *)

(* As in the last project, we'll be working with a flattened representation
   of LLVMlite programs to make emitting code easier. This version
   additionally makes it possible to emit elements will be gathered up and
   "hoisted" to specific parts of the constructed CFG
   - G of gid * Ll.gdecl: allows you to output global definitions in the middle
     of the instruction stream. You will find this useful for compiling string
     literals
   - E of uid * insn: allows you to emit an instruction that will be moved up
     to the entry block of the current function. This will be useful for
     compiling local variable declarations
*)

type elt =
  | L of Ll.lbl             (* block labels *)
  | I of uid * Ll.insn      (* instruction *)
  | T of Ll.terminator      (* block terminators *)
  | G of gid * Ll.gdecl     (* hoisted globals (usually strings) *)
  | E of uid * Ll.insn      (* hoisted entry block instructions *)

type stream = elt list
let ( >@ ) x y = y @ x
let ( >:: ) x y = y :: x
let lift : (uid * insn) list -> stream = List.rev_map (fun (x,i) -> I (x,i))

(* Build a CFG and collection of global variable definitions from a stream *)
let cfg_of_stream (code:stream) : Ll.cfg * (Ll.gid * Ll.gdecl) list  =
    let gs, einsns, insns, term_opt, blks = List.fold_left
      (fun (gs, einsns, insns, term_opt, blks) e ->
        match e with
        | L l ->
           begin match term_opt with
           | None ->
              if (List.length insns) = 0 then (gs, einsns, [], None, blks)
              else failwith @@ Printf.sprintf "build_cfg: block labeled %s has\
                                               no terminator" l
           | Some terminator ->
              (gs, einsns, [], None, (l, {insns; terminator})::blks)
           end
        | T t  -> (gs, einsns, [], Some t, blks)
        | I (uid,insn)  -> (gs, einsns, (uid,insn)::insns, term_opt, blks)
        | G (gid,gdecl) ->  ((gid,gdecl)::gs, einsns, insns, term_opt, blks)
        | E (uid,i) -> (gs, (uid, i)::einsns, insns, term_opt, blks)
      ) ([], [], [], None, []) code
    in
    match term_opt with
    | None -> failwith "build_cfg: entry block has no terminator"
    | Some terminator ->
       let insns = einsns @ insns in
       ({insns; terminator}, blks), gs


(* compilation contexts ----------------------------------------------------- *)

(* To compile OAT variables, we maintain a mapping of source identifiers to the
   corresponding LLVMlite operands. Bindings are added for global OAT variables
   and local variables that are in scope. *)

module Ctxt = struct

  type t = (Ast.id * (Ll.ty * Ll.operand)) list
  let empty = []

  (* Add a binding to the context *)
  let add (c:t) (id:id) (bnd:Ll.ty * Ll.operand) : t = (id,bnd)::c

  (* Lookup a binding in the context *)
  let lookup (id:Ast.id) (c:t) : Ll.ty * Ll.operand =
    List.assoc id c

  (* Lookup a function, fail otherwise *)
  let lookup_function (id:Ast.id) (c:t) : Ll.fty * Ll.operand =
    match List.assoc id c with
    | Fun ft, g -> ft, g
    | _ -> failwith @@ id ^ " not bound to a function"

end

(* compiling OAT types ------------------------------------------------------ *)

(* The mapping of source types onto LLVMlite is straightforward. Booleans and ints
   are represented as the the corresponding integer types. OAT strings are
   pointers to bytes (I8). Arrays are the most interesting type: they are
   represented as pointers to structs where the first component is the number
   of elements in the following array.

   The trickiest part of this project will be satisfying LLVM's rudimentary type
   system. Recall that global arrays in LLVMlite need to be declared with their
   length in the type to statically allocate the right amount of memory. The
   global strings and arrays you emit will therefore have a more specific type
   annotation than the output of cmp_rty. You will have to carefully bitcast
   gids to satisfy the type checker.
*)

let rec cmp_ty : Ast.ty -> Ll.ty = function
  | Ast.TVoid  -> Void
  | Ast.TBool  -> I1
  | Ast.TInt   -> I64
  | Ast.TRef r -> Ptr (cmp_rty r)
  | Ast.TFun f -> Fun (cmp_fty f)

and cmp_fty (ts,r:Ast.fty) : Ll.fty =
  List.map cmp_ty ts, cmp_ty r

and cmp_rty : Ast.rty -> Ll.ty = function
  | Ast.RString  -> I8
  | Ast.RArray u -> Struct [I64; Array(0, cmp_ty u)]

let typ_of_binop : Ast.binop -> Ast.ty * Ast.ty * Ast.ty = function
  | Add | Mul | Sub | Shl | Shr | Sar | IAnd | IOr -> (TInt, TInt, TInt)
  | Eq | Neq | Lt | Lte | Gt | Gte -> (TInt, TInt, TBool)
  | And | Or -> (TBool, TBool, TBool)

let typ_of_unop : Ast.unop -> Ast.ty * Ast.ty = function
  | Neg | Bitnot -> (TInt, TInt)
  | Lognot       -> (TBool, TBool)


(* Some useful helper functions *)

(* Generate a fresh temporary identifier. Since OAT identifiers cannot begin
   with an underscore, these should not clash with any source variables *)
let gensym : string -> string =
  let c = ref 0 in
  fun (s:string) -> incr c; Printf.sprintf "_%s%d" s (!c)

(* Generate code to allocate an array of source type TRef (RArray t) of the
   given size. Note "size" is an operand whose value can be computed at
   runtime *)
let oat_alloc_array (t:Ast.ty) (size:Ll.operand) : Ll.ty * operand * stream =
  let ans_id, arr_id = gensym "array", gensym "raw_array" in
  let ans_ty = cmp_ty @@ TRef (RArray t) in
  let arr_ty = cmp_ty @@ TRef (RArray TInt) in
  ans_ty, Id ans_id, lift
    [ arr_id, Call(arr_ty, Gid "oat_alloc_array", [I64, size])
    ; ans_id, Bitcast(arr_ty, Id arr_id, ans_ty) ]


let type_helper : Ast.exp -> Ll.ty = function
  | CNull t -> cmp_ty t
  | CBool b -> cmp_ty TBool
  | CInt i -> cmp_ty TInt
  | CStr s -> Array (String.length s + 1, I8)
  | CArr (t, l) -> Struct [I64; Array(List.length l, cmp_ty t)]
  | _ -> failwith "type not implemented"

let operand_helper : Ast.exp -> Ll.operand = function
  | CNull t -> Null
  | CBool b ->
    begin match b with
    | true -> Const (Int64.of_int 1)
    | false -> Const (Int64.of_int 0)
    end
  | CInt i -> Const i
  | Id id -> Id id
  | _ -> failwith "operand not implemented"


  type cmp_exp_return_value =
    { ty: Ll.ty
    ; operand: Ll.operand
    ; stream: stream
    }

  let get_ll_bop (bop: binop) : Ll.bop =
    begin match bop with
    | Add -> Ll.Add
    | Mul -> Ll.Mul
    | Sub -> Ll.Sub
    | Shl -> Ll.Shl
    | Shr -> Ll.Lshr
    | Sar -> Ll.Ashr
    | IAnd -> Ll.And
    | IOr -> Ll.Or
    | And -> Ll.And
    | Or -> Ll.Or
    | _ -> failwith "not a ll binary operator"
    end

  let get_ll_cnd (bop: binop) : Ll.cnd =
    begin match bop with
    | Eq -> Ll.Eq
    | Neq -> Ll.Ne
    | Lt -> Ll.Slt
    | Lte -> Ll.Sle
    | Gt -> Ll.Sgt
    | Gte -> Ll.Sge
    | _ -> failwith "not a ll conditional operator"
    end



(* Compile an expression exp in context c, outputting the Ll operand that will
   recieve the value of the expression, and the stream of instructions
   implementing the expression.

   Tips:
   - use the provided cmp_ty function!

   - string literals (CStr s) should be hoisted. You'll need to bitcast the
     resulting gid to (Ptr I8)

   - use the provided "oat_alloc_array" function to implement literal arrays
     (CArr) and the (NewArr) expressions

   - we found it useful to write a helper function
     cmp_exp_as_ty : Ctxt.t -> Ast.exp node -> Ll.ty -> Ll.operand * stream
     that compiles an expression and optionally inserts a bitcast to the
     desired Ll type. This is useful for dealing with OAT identifiers that
     correspond to gids that don't quite have the type you want
*)
let get_first (a,_,_) = a
let get_second (_,a,_) = a
let get_third (_,_,a) = a

let rec cmp_exp (c:Ctxt.t) (exp:Ast.exp node) : Ll.ty * Ll.operand * stream =
    begin match exp.elt with
    | CNull t -> cmp_ty t, Ll.Null, []
    | CBool b -> cmp_ty TBool, operand_helper (CBool b), []
    | CInt i -> cmp_ty TInt, operand_helper (CInt i), []
    | CStr s ->
      let gid = gensym "str" in
      let strptr = gensym "str" in
      (Ptr I8, Id strptr, [I (strptr, Bitcast (Ptr (Array (String.length s + 1, I8)), Gid gid, Ptr I8));
        G (gid, (Array (String.length s + 1, I8), GString s))])
    | CArr (t, l) -> (* ty * exp node list*)
      let init_array = oat_alloc_array t (Const (Int64.of_int (List.length l))) in
      let rec store_stream (l : exp node list) (i : int) : stream =
        begin match l with
        | [] -> []
        | h::tl ->
          let uid = gensym "elt" in
          let dummy = gensym "temp" in
          let compile = cmp_exp c h in
          (store_stream tl (i+1)) @ [I (dummy, Store (cmp_ty t, get_second compile, Id uid));
            I (uid, Gep (get_first init_array, get_second init_array, [Const Int64.zero; Const Int64.one; Const (Int64.of_int i)]))] @ (get_third compile)
        end in
        get_first init_array, get_second init_array, (store_stream l 0) @ (get_third init_array)
    | Id id ->
      let (ll_rtyp, ctxt_id) = Ctxt.lookup id c in
      let uid = gensym "id" in
      let uid2 = gensym "bitcast" in
      begin match ll_rtyp with
      | Array (i, t) ->
        begin match t with
        | I8 -> Ptr I8, Id uid2, [I (uid2, Bitcast (Ptr (Array (i, t)), ctxt_id, Ptr I8))]
        | t -> Ptr (Struct [I64; Array (0, t)]), Id uid2, [I (uid2, (Bitcast (Ptr (Array (i, t)), ctxt_id, Ptr (Struct [I64; Array (0, t)]))))]
        end
      | Struct [I64; Array(l, t)] -> Ptr (Struct [I64; Array (0, t)]), Id uid2, [I (uid2, (Bitcast (Ptr (Struct [I64; Array(l, t)]), ctxt_id, Ptr (Struct [I64; Array (0, t)]))))]
      | t -> t, Id uid, [I(uid, Load(Ptr t, ctxt_id))]
      end
    | NewArr (t, exp) ->
      let compile_exp = cmp_exp c exp in
      let init_array = oat_alloc_array t (get_second compile_exp) in
      get_first init_array, get_second init_array, (get_third init_array) @ (get_third compile_exp)
    | Index (exp1, exp2) ->
      let compile_exp1 = cmp_exp c exp1 in
      let compile_exp2 = cmp_exp c exp2 in
      let uid = gensym "ptr" in
      let loaded_id = gensym "load" in
      begin match exp1.elt with
      | CArr (t, l) -> cmp_ty t, Id loaded_id, [I (loaded_id, Load (Ptr (cmp_ty t), Id uid));
        I (uid, Gep (get_first compile_exp1, get_second compile_exp1, [Const Int64.zero; Const Int64.one; get_second compile_exp2]))]
        @ (get_third compile_exp2) @ (get_third compile_exp1)
      | NewArr (t, exp) -> cmp_ty t, Id loaded_id, [I (loaded_id, Load (Ptr (cmp_ty t), Id uid));
        I (uid, Gep (get_first compile_exp1, get_second compile_exp1, [Const Int64.zero; Const Int64.one; get_second compile_exp2]))]
        @ (get_third compile_exp2) @ (get_third compile_exp1)
      | Id id ->
        let (ll_rtyp, ctxt_id) = Ctxt.lookup id c in
        begin match ll_rtyp with
        | Array (i, t) ->
          t, Id loaded_id, [I (loaded_id, Load (Ptr t, Id uid));
          I (uid, Gep (get_first compile_exp1, get_second compile_exp1, [Const Int64.zero; Const Int64.one; get_second compile_exp2]))]
          @ (get_third compile_exp2) @ (get_third compile_exp1)
        | Struct [I64; Array(l, t)] ->
          t, Id loaded_id, [I (loaded_id, Load (Ptr t, Id uid));
          I (uid, Gep (get_first compile_exp1, get_second compile_exp1, [Const Int64.zero; Const Int64.one; get_second compile_exp2]))]
          @ (get_third compile_exp2) @ (get_third compile_exp1)
        | Ptr (Struct [I64; Array(l, t)]) ->
          t, Id loaded_id, [I (loaded_id, Load (Ptr t, Id uid));
          I (uid, Gep (get_first compile_exp1, get_second compile_exp1, [Const Int64.zero; Const Int64.one; get_second compile_exp2]))]
          @ (get_third compile_exp2) @ (get_third compile_exp1)
        | _ -> failwith "not yet implemented"
        end
      | Call (id,l) ->
        let (ll_rtyp, ctxt_id) = Ctxt.lookup_function id c in
        begin match ll_rtyp with
        | (_, Array (i, t)) ->
          t, Id loaded_id, [I (loaded_id, Load (Ptr t, Id uid));
          I (uid, Gep (get_first compile_exp1, get_second compile_exp1, [Const Int64.zero; Const Int64.one; get_second compile_exp2]))]
          @ (get_third compile_exp2) @ (get_third compile_exp1)
        | (_, Ptr (Struct [I64;Array(0, t)])) ->
          t, Id loaded_id, [I (loaded_id, Load (Ptr t, Id uid));
          I (uid, Gep (get_first compile_exp1, get_second compile_exp1, [Const Int64.zero; Const Int64.one; get_second compile_exp2]))]
          @ (get_third compile_exp2) @ (get_third compile_exp1)
        | _ -> failwith "not yet implemented"
        end
      | Index (e1, e2) ->
        begin match get_first compile_exp1 with
        | Array (i, ty) ->
        ty, Id loaded_id, [I (loaded_id, Load (Ptr ty, Id uid));
        I (uid, Gep (get_first compile_exp1, get_second compile_exp1, [Const Int64.zero; Const Int64.one; get_second compile_exp2]))]
        @ (get_third compile_exp2) @ (get_third compile_exp1)
        | Struct [I64; Array(l, ty)] ->
        ty, Id loaded_id, [I (loaded_id, Load (Ptr ty, Id uid));
        I (uid, Gep (get_first compile_exp1, get_second compile_exp1, [Const Int64.zero; Const Int64.one; get_second compile_exp2]))]
        @ (get_third compile_exp2) @ (get_third compile_exp1)
        | Ptr (Struct [I64; Array(l, ty)]) ->
        ty, Id loaded_id, [I (loaded_id, Load (Ptr ty, Id uid));
        I (uid, Gep (get_first compile_exp1, get_second compile_exp1, [Const Int64.zero; Const Int64.one; get_second compile_exp2]))]
        @ (get_third compile_exp2) @ (get_third compile_exp1)
        | _ -> failwith "nono"
        end
      | _ -> failwith "no"
      end
    | Call (id, l) ->
      let (ll_ftyp, ctxt_id) = Ctxt.lookup_function id c in
      let fid = gensym "fun" in
      let rec args_list (c:Ctxt.t) (tl: Ll.ty list) (el: exp node list): stream * (Ll.ty * operand) list =
        begin match (tl, el) with
        | [],[] -> [], []
        | h1::t1, h2::t2 ->
          let temp = (args_list c t1 t2) in
          let exp_comp = cmp_exp c h2 in
          (get_third exp_comp) @ (fst temp), (h1, get_second exp_comp) :: (snd temp)
        | _ -> failwith "not enough args"
        end in
      let args = args_list c (List.rev (fst ll_ftyp)) l in
      snd ll_ftyp, Id fid, [I(fid, Call (snd ll_ftyp, Gid id, snd args))] @ (fst args)
    | Bop (bop, exp1, exp2) ->
      let temp1 = cmp_exp c exp1 in
      let temp2 = cmp_exp c exp2 in
      let ll_rtyp = cmp_ty (get_third (typ_of_binop bop)) in
      let ll_optyp = cmp_ty (get_second (typ_of_binop bop)) in
      let uid = gensym "bop" in
      begin match bop with
      | Add | Sub | Mul | Shl | Shr | Sar | IAnd | IOr | And | Or ->
        (ll_rtyp, Id uid, [I (uid, Binop(get_ll_bop bop, ll_optyp, get_second temp1, get_second temp2))]
        @(get_third temp2) @ (get_third temp1))
      | Eq | Neq | Lt | Lte | Gt | Gte ->
        (ll_rtyp, Id uid, [I (uid, Icmp(get_ll_cnd bop, ll_optyp, get_second temp1, get_second temp2))]
        @(get_third temp2) @ (get_third temp1))
      end
    | Uop (uop, exp) ->
      let temp = cmp_exp c exp in
      let ll_rtyp = cmp_ty (snd (typ_of_unop uop)) in
      let uid = gensym "uop" in
      begin match uop with
      | Neg ->
        (ll_rtyp, Id uid, [I(uid, Binop(Sub, ll_rtyp, Const (Int64.of_int 0), get_second temp))] @ (get_third temp))
      | Bitnot ->
        (ll_rtyp, Id uid, [I(uid, Binop(Xor, ll_rtyp, Const (Int64.of_int (-1)), get_second temp))] @ (get_third temp))
      | Lognot ->
        (ll_rtyp, Id uid, [I(uid, Binop(Xor, ll_rtyp, Const (Int64.of_int 1), get_second temp))] @ (get_third temp))
      end
    end

(* Compile a statement in context c with return typ rt. Return a new context,
   possibly extended with new local bindings, and the instruction stream
   implementing the statement.

   Left-hand-sides of assignment statements must either be OAT identifiers,
   or an index into some arbitrary expression of array type. Otherwise, the
   program is not well-formed and your compiler may throw an error.

   Tips:
   - for local variable declarations, you will need to emit Allocas in the
     entry block of the current function using the E() constructor.

   - don't forget to add a bindings to the context for local variable
     declarations

   - you can avoid some work by translating For loops to the corresponding
     While loop, building the AST and recursively calling cmp_stmt

   - you might find it helpful to reuse the code you wrote for the Call
     expression to implement the SCall statement

   - compiling the left-hand-side of an assignment is almost exactly like
     compiling the Id or Index expression. Instead of loading the resulting
     pointer, you just need to store to it!

 *)
let rec cmp_stmt (c:Ctxt.t) (rt:Ll.ty) (stmt:Ast.stmt node) : Ctxt.t * stream =
  begin match stmt.elt with
  | Ret None -> (c, [T (Ret (Void, None))])
  | Ret (Some x) ->
    let x_compile = cmp_exp c x in
    (c, [T (Ret (get_first x_compile, Some (get_second x_compile)))] @ (get_third x_compile))
  | Assn (e1, e2) ->
    begin match e1.elt with
    | Id id ->
      let e2_compile = cmp_exp c e2 in
      let ptr = Ctxt.lookup id c in
      (c, [I (id, Store (get_first e2_compile, get_second e2_compile, snd ptr))] @ (get_third e2_compile))
    | Index (exp1, exp2) ->
      let e2_compile = cmp_exp c e2 in
      let (ll_type, ll_opnd, str1) = cmp_exp c exp1 in
      let (_,e2_opnd,str2) = cmp_exp c exp2 in
      let sid = gensym "store" in
      let gepid = gensym "gep" in
      (c, [I (sid, Store (get_first e2_compile, get_second e2_compile, Id gepid));
       I (gepid, Gep (ll_type, ll_opnd, [Const Int64.zero; Const Int64.one; e2_opnd]))] @ str2 @ str1 @ (get_third e2_compile))
    | _ -> failwith "Illegal lhs"
    end
  | Decl (vdecl) ->
    let name = fst vdecl in
    let uid = gensym name in
    let exp_compile = cmp_exp c (snd vdecl) in
    let update_ctxt = Ctxt.add c name (get_first exp_compile, Id uid) in
    (update_ctxt, [E (uid, Alloca (get_first exp_compile))] @ [I (uid, Store (get_first exp_compile, get_second exp_compile, Id uid))] @ (get_third exp_compile))
  | SCall (id, l) ->
    let (ll_ftyp, ctxt_id) = Ctxt.lookup_function id c in
    let fid = gensym "fun" in
    let rec args_list (c:Ctxt.t) (tl: Ll.ty list) (el: exp node list): stream * (Ll.ty * operand) list =
      begin match (tl, el) with
      | [],[] -> [], []
      | h1::t1, h2::t2 ->
        let temp = (args_list c t1 t2) in
        let exp_comp = cmp_exp c h2 in
        (get_third exp_comp) @ (fst temp), (h1, get_second exp_comp) :: (snd temp)
      | _ -> failwith "not enough args"
      end in
    let args = args_list c (List.rev (fst ll_ftyp)) l in
    c, [I(fid, Call (snd ll_ftyp, Gid id, snd args))] @ (fst args)
  | If (exp, block1, block2) ->
    let then_block = gensym "then" in
    let else_block = gensym "else" in
    let merge = gensym "merge" in
    let test = gensym "test" in
    let cond = cmp_exp c exp in
    (c, [L merge; T (Br merge)] @ (cmp_block c rt block2) @ [L else_block; T (Br merge)] @ (cmp_block c rt block1)
    @ [L then_block; T (Cbr (Id test, else_block, then_block));
    I (test, Icmp (Eq, I1, get_second cond, Const Int64.zero))] @ (get_third cond))
  | For (vdecls, exp_option, stmt_option, block) ->
    let rec ctxt_helper (c: Ctxt.t) (vdecls : vdecl list) (str: stream): Ctxt.t * stream =
      begin match vdecls with
      | [] -> c, str
      | h::tl ->
        let cmp_e = cmp_exp c (snd h) in
        let id = gensym (fst h) in
        let update_ctxt = Ctxt.add c (fst h) (get_first cmp_e, Id id)in
        ctxt_helper update_ctxt tl ([E (id, Alloca (get_first cmp_e))] @
        [I (id, Store (get_first cmp_e, get_second cmp_e, Id id))] @ (get_third cmp_e) @ str)
      end in
    let temp = ctxt_helper c vdecls [] in
    let new_c = (fst temp) @ c in
    let test = gensym "test" in
    let lpost = gensym "post" in
    let lbody = gensym "body" in
    let lpre = gensym "pre" in
    begin match (exp_option, stmt_option) with
    | None, _ -> failwith "infinite loop"
    | Some s, None -> failwith "infinite loop"
      (* let cond = cmp_exp new_c s in
      (new_c, [L lpost; T (Br lpre)] @ (cmp_block new_c rt block) @ [L lbody; T (Cbr (Id test, lpost, lbody));
        I (test, Icmp (Eq, I1, get_second cond, Const Int64.zero))] @ (get_third cond) @ (snd temp) @[L lpre ; T (Br lpre)]) *)
    | Some s1, Some s2 ->
      let opn = cmp_stmt new_c rt s2 in
      let cond = cmp_exp new_c s1 in
      ((fst opn @ new_c), [L lpost; T (Br lpre)] @ (snd opn) @ (cmp_block new_c rt block) @ [L lbody; T (Cbr (Id test, lpost, lbody));
        I (test, Icmp (Eq, I1, get_second cond, Const Int64.zero))] @ (get_third cond) @ [L lpre ; T (Br lpre)] @ (snd temp))
    end
  | While (exp, block) ->
    let test = gensym "test" in
    let lpost = gensym "post" in
    let lbody = gensym "body" in
    let lpre = gensym "pre" in
    let cond = cmp_exp c exp in
    (c, [L lpost; T (Br lpre)] @ (cmp_block c rt block) @ [L lbody; T (Cbr (Id test, lpost, lbody));
      I (test, Icmp (Eq, I1, get_second cond, Const Int64.zero))] @ (get_third cond) @ [L lpre ; T (Br lpre)])
    (* (c, [T (Br lpre); L lpre] @ (get_third cond) @ [I (test, Icmp (Eq, I1, get_second cond, Const Int64.zero));
    T (Cbr (Id test, lpost, lbody)); L lbody; T (Br lpre)] @ (cmp_block c rt block) @ [L lpost]) *)
  end

(* Compile a series of statements *)
and cmp_block (c:Ctxt.t) (rt:Ll.ty) (stmts:Ast.block) : stream =
  snd @@ List.fold_left (fun (c, code) s ->
      let c, stmt_code = cmp_stmt c rt s in
      c, code >@ stmt_code
    ) (c,[]) stmts


(* Populate a context with bindings for global variables and functions,
   mapping OAT identifiers to LLVMlite gids and their types.

   Only a small subset of OAT expressions can be used as global initializers
   in well-formed programs (The constructors starting with C). *)
let cmp_global_ctxt (c:Ctxt.t) (p:Ast.prog) : Ctxt.t =
  let open Ctxt in
  let rec global_ctxt_helper (ct:Ctxt.t) (pr:Ast.prog) : Ctxt.t =
    begin match pr with
    | [] -> ct
    | (Gvdecl v) :: rest -> global_ctxt_helper (add ct v.elt.name (type_helper v.elt.init.elt, Gid v.elt.name)) rest
    | (Gfdecl f) :: rest ->
      let rec arg_type (ctt:Ctxt.t) (l:(ty*id) list) (tail:ty list) : Ctxt.t * ty list =
        begin match l with
        | [] -> ctt, tail
        | (t,i)::tl -> arg_type (add ctt i (cmp_ty t, (Id (gensym i)))) tl (t::tail)
        end in
        let temp = arg_type ct f.elt.args [] in
        global_ctxt_helper (add (fst temp) f.elt.name (cmp_ty (TFun (snd temp, f.elt.rtyp)), Gid f.elt.name)) rest
    end in
  global_ctxt_helper c p


(* Compile a function declaration in global context c. Return the LLVMlite cfg
   and a list of global declarations containing the string literals appearing
   in the function.

   You will need to
   1. Allocate stack space for the function parameters using Alloca
   2. Store the function arguments in their corresponding alloca'd stack slot
   3. Extend the context with bindings for function variables
   3. Compile the body of the function using cmp_block
   4. Use cfg_of_stream to produce a LLVMlite cfg from
 *)
let cmp_fdecl (c:Ctxt.t) (f:Ast.fdecl node) : Ll.fdecl * (Ll.gid * Ll.gdecl) list =
  let open Ctxt in
  let rec get_function_type (args: (ty * id) list) (tyl : Ll.ty list) : Ll.ty list =
    begin match args with
    | [] -> tyl
    | (arg_type, arg_id) :: tl ->
    get_function_type tl (tyl @ [cmp_ty arg_type])
    end in
  let fty_final = ((get_function_type f.elt.args []), cmp_ty f.elt.rtyp) in
  let rec f_param_helper (c:Ctxt.t) (args: (ty * id) list) (uidl : uid list) (str : stream) : Ctxt.t * uid list * stream  =
    begin match args with
    | [] -> c, uidl, str
    | (arg_type, arg_id) :: tl ->
      let param_name = gensym arg_id in
      (* print_string store_param_name; *)
      let update_ctxt = Ctxt.add c arg_id (cmp_ty arg_type, Id param_name) in
      f_param_helper update_ctxt tl (uidl @ [arg_id])
      (str @ [I (param_name, Store(cmp_ty arg_type, Id arg_id, Id param_name))] @ [E (param_name, Alloca (cmp_ty arg_type))])
    end in
  let (final_ctxt, final_param_list, final_stream) = f_param_helper c f.elt.args [] [] in
  let cfg_stream = cfg_of_stream ((cmp_block final_ctxt (cmp_ty f.elt.rtyp) f.elt.body) @ final_stream) in
  let global_final = snd cfg_stream in
  ({fty=fty_final; param=final_param_list; cfg=(fst cfg_stream)}, global_final)


(* Compile a global initializer, returning the resulting LLVMlite global
   declaration, and a list of additional global declarations.

   Tips:
   - Only CNull, CBool, CInt, CStr, and CArr can appear as global initializers
     in well-formed OAT programs. Your compiler may throw an error for the other
     cases

   - OAT arrays are always handled via pointers. A global array of arrays will
     be an array of pointers to arrays emitted as additional global declarations
 *)
let rec cmp_gexp (e:Ast.exp node) : Ll.gdecl * (Ll.gid * Ll.gdecl) list =
  begin match e.elt with
  | CNull t -> ((cmp_ty t, GNull), [])
  | CBool b ->
    begin match b with
    | true -> ((cmp_ty TBool, GInt (Int64.of_int 1)), [])
    | false -> ((cmp_ty TBool, GInt (Int64.of_int 0)), [])
    end
  | CInt i -> ((cmp_ty TInt, GInt i), [])
  | CStr s -> ((Array(String.length s + 1, I8), GString s), [])
  | CArr (t, l) ->
    let rec gdecl_list (l : exp node list) : Ll.gdecl list =
      begin match l with
      | [] -> []
      | h::tl -> (fst (cmp_gexp h)) :: (gdecl_list tl)
      end in
    let rec arr_list (l : exp node list) : (Ll.gid * Ll.gdecl) list =
      begin match l with
      | [] -> []
      | h::tl ->
        let glob = gensym "glob" in
        (glob, fst (cmp_gexp h)) :: (snd (cmp_gexp h)) @ (arr_list tl)
      end in
    (Struct [I64; Array(List.length l, cmp_ty t)], GStruct [(I64, GInt (Int64.of_int (List.length l)));
     (Array(List.length l, cmp_ty t), GArray (gdecl_list l))]), (arr_list l)
  | _ -> failwith "not global exp"
  end


(* Oat initial context ------------------------------------------------------ *)
let internals =
  [ "oat_malloc",              Ll.Fun ([I64], Ptr I64)
  ; "oat_alloc_array",         Ll.Fun ([I64], Ptr (Struct [I64; Array (0, I64)]))
  ; "oat_assert_not_null",     Ll.Fun ([Ptr I8], Void)
  ; "oat_assert_array_length", Ll.Fun ([Ptr I64; I64], Void)
  ]

let builtins =
  [ "array_of_string",  cmp_ty @@ TFun ([TRef RString],  TRef(RArray TInt))
  ; "string_of_array",  cmp_ty @@ TFun ([TRef(RArray TInt)], TRef RString)
  ; "length_of_string", cmp_ty @@ TFun ([TRef RString],  TInt)
  ; "string_of_int",    cmp_ty @@ TFun ([TInt],  TRef RString)
  ; "string_cat",       cmp_ty @@ TFun ([TRef RString; TRef RString], TRef RString)
  ; "print_string",     cmp_ty @@ TFun ([TRef RString],  TVoid)
  ; "print_int",        cmp_ty @@ TFun ([TInt],  TVoid)
  ; "print_bool",       cmp_ty @@ TFun ([TBool], TVoid)
  ]

(* Compile a OAT program to LLVMlite *)
let cmp_prog (p:Ast.prog) : Ll.prog =
  (* add built-in functions to context *)
  let init_ctxt =
    List.fold_left (fun c (i, t) ->
        Ctxt.add c i (t, Gid i)
      ) Ctxt.empty builtins in
  (* build global variable context *)
  let c = cmp_global_ctxt init_ctxt p in
  (* compile functions and global variables *)
  let fdecls, gdecls =
    List.fold_right (fun d (fs, gs) ->
        match d with
        | Ast.Gvdecl { elt=gd } ->
           let ll_gd, gs' = cmp_gexp gd.init in
           (fs, (gd.name, ll_gd)::gs' @ gs)
        | Ast.Gfdecl fd ->
           let fdecl, gs' = cmp_fdecl c fd in
           (fd.elt.name,fdecl)::fs, gs' @ gs
      ) p ([], [])
  in
  (* gather external declarations *)
  let edecls = internals @ builtins in
  { tdecls=[]; gdecls; fdecls; edecls }
