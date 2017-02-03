(* X86lite Simulator *)

(* See the documentation in the X86lite specification, available on the 
   course web pages, for a detailed explanation of the instruction
   semantics.
*)

open X86

(* simulator machine state -------------------------------------------------- *)

let mem_bot = 0x400000L          (* lowest valid address *)
let mem_top = 0x410000L          (* one past the last byte in memory *)
let mem_size = Int64.to_int (Int64.sub mem_top mem_bot)
let nregs = 17                   (* including Rip *)
let ins_size = 4L                (* assume we have a 4-byte encoding *)
let exit_addr = 0xfdeadL         (* halt when m.regs(%rip) = exit_addr *)

(* Your simulator should raise this exception if it tries to read from or
   store to an address not within the valid address space. *)
exception X86lite_segfault

(* The simulator memory maps addresses to symbolic bytes.  Symbolic
   bytes are either actual data indicated by the Byte constructor or
   'symbolic instructions' that take up four bytes for the purposes of
   layout.

   The symbolic bytes abstract away from the details of how
   instructions are represented in memory.  Each instruction takes
   exactly four consecutive bytes, where the first byte InsB0 stores
   the actual instruction, and the next three bytes are InsFrag
   elements, which aren't valid data.

   For example, the two-instruction sequence:
        at&t syntax             ocaml syntax
      movq %rdi, (%rsp)       Movq,  [~%Rdi; Ind2 Rsp]
      decq %rdi               Decq,  [~%Rdi]

   is represented by the following elements of the mem array (starting
   at address 0x400000):

       0x400000 :  InsB0 (Movq,  [~%Rdi; Ind2 Rsp])
       0x400001 :  InsFrag
       0x400002 :  InsFrag
       0x400003 :  InsFrag
       0x400004 :  InsB0 (Decq,  [~%Rdi])
       0x400005 :  InsFrag
       0x400006 :  InsFrag
       0x400007 :  InsFrag
*)
type sbyte = InsB0 of ins       (* 1st byte of an instruction *)
           | InsFrag            (* 2nd, 3rd, or 4th byte of an instruction *)
           | Byte of char       (* non-instruction byte *)

(* memory maps addresses to symbolic bytes *)
type mem = sbyte array

(* Flags for condition codes *)
type flags = { mutable fo : bool
             ; mutable fs : bool
             ; mutable fz : bool
             }

(* Register files *)
type regs = int64 array

(* Complete machine state *)
type mach = { flags : flags
            ; regs : regs
            ; mem : mem
            }

(* simulator helper functions ----------------------------------------------- *)

(* The index of a register in the regs array *)
let rind : reg -> int = function
  | Rip -> 16
  | Rax -> 0  | Rbx -> 1  | Rcx -> 2  | Rdx -> 3
  | Rsi -> 4  | Rdi -> 5  | Rbp -> 6  | Rsp -> 7
  | R08 -> 8  | R09 -> 9  | R10 -> 10 | R11 -> 11
  | R12 -> 12 | R13 -> 13 | R14 -> 14 | R15 -> 15

(* Helper functions for reading/writing sbytes *)

(* Convert an int64 to its sbyte representation *)
let sbytes_of_int64 (i:int64) : sbyte list =
  let open Char in 
  let open Int64 in
  List.map (fun n -> Byte (shift_right i n |> logand 0xffL |> to_int |> chr))
           [0; 8; 16; 24; 32; 40; 48; 56]

(* Convert an sbyte representation to an int64 *)
let int64_of_sbytes (bs:sbyte list) : int64 =
  let open Char in
  let open Int64 in
  let f b i = match b with
    | Byte c -> logor (shift_left i 8) (c |> code |> of_int)
    | _ -> 0L
  in
  List.fold_right f bs 0L

(* Convert a string to its sbyte representation *)
let sbytes_of_string (s:string) : sbyte list =
  let rec loop acc = function
    | i when i < 0 -> acc
    | i -> loop (Byte s.[i]::acc) (pred i)
  in
  loop [Byte '\x00'] @@ String.length s - 1

(* Serialize an instruction to sbytes *)
let sbytes_of_ins (op, args:ins) : sbyte list =
  let check = function
    | Imm (Lbl _) | Ind1 (Lbl _) | Ind3 (Lbl _, _) -> 
      invalid_arg "sbytes_of_ins: tried to serialize a label!"
    | o -> ()
  in
  List.iter check args;
  [InsB0 (op, args); InsFrag; InsFrag; InsFrag]

(* Serialize a data element to sbytes *)
let sbytes_of_data : data -> sbyte list = function
  | Quad (Lit i) -> sbytes_of_int64 i
  | Asciz s -> sbytes_of_string s
  | Quad (Lbl _) -> invalid_arg "sbytes_of_data: tried to serialize a label!"


(* It might be useful to toggle printing of intermediate states of your 
   simulator. *)
let debug_simulator = ref false

(* Interpret a condition code with respect to the given flags. *)
let interp_cnd {fo; fs; fz} : cnd -> bool = function
  | Eq -> fz
  | Neq -> not(fz)
  | Gt -> fs == fo && not(fz)
  | Ge -> fs == fo
  | Lt -> fs != fo
  | Le -> (fs != fo) || fz

(* Maps an X86lite address into Some OCaml array index,
   or None if the address is not within the legal address space. *)
let map_addr (addr:quad) : int option =
  if addr >= 0x400000L && addr <= 0x410000L then
    Some ((Int64.to_int addr) - (Int64.to_int 0x400000L))
  else
    None
(************************************************************)
(************************************************************)
(************************************************************)

let get_memory_address (m:mach) (r: reg) : int =
  match map_addr m.regs.(rind r) with
  | Some c -> c
  | None -> 0

let get_memory_address_from_address (adr: int64) : int =
  match map_addr adr with
  | Some c -> c
  | None -> 0

let sbyte_list (a: sbyte array) (start: int) : sbyte list =
  Array.to_list (Array.sub a start 8)

let insert_sbyte_to_memory (m: mach) (memory_address: int) (offset: int64) (data: int64) : unit =
  for i = 0 to 7 do
    m.mem.(Int64.to_int(Int64.add (Int64.of_int (memory_address + i)) (offset))) <- List.nth (sbytes_of_int64 data) i
  done

let update_flags (m: mach) (result : int64) : unit = 
  if Int64.equal result Int64.zero then begin 
    m.flags.fz <- true;
    m.flags.fs <- false
  end
  else if (Int64.compare result Int64.zero) > 0 then begin
    m.flags.fs <- false;
    m.flags.fz <- false
  end
  else begin
    m.flags.fs <- true;
    m.flags.fz <- false
  end
(************************************************************)
(*************BIT MANIPULATION INSTRUCTIONS******************)
(************************************************************)

let bit_manipulation_step (m: mach) (o: opcode) (op: operand list) : unit = 
  begin match (o, op) with
  | (Sarq, [amt; dest]) -> (* Arithmetic shift dest right by amt *)
      begin match (amt, dest) with
      | (Imm (Lit imm), Reg reg) -> 
        let num = Int64.shift_right m.regs.(rind reg) (Int64.to_int imm) in
        m.regs.(rind reg) <- num;
        if Int64.equal imm Int64.one then m.flags.fo <- false;
        if not(Int64.equal imm Int64.zero) then update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind3 (Lit imm2, reg)) ->
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let dest_n_int = Int64.shift_right dest_int (Int64.to_int imm1) in
        insert_sbyte_to_memory (m) (memory_address) (imm2) (dest_n_int);
        if Int64.equal dest_n_int Int64.one then m.flags.fo <- false;
        if not(Int64.equal imm1 Int64.zero) then update_flags m dest_n_int;
      | (Reg reg1, Reg reg2) ->
        let num = Int64.shift_right m.regs.(rind reg2) (Int64.to_int m.regs.(rind reg1)) in
        m.regs.(rind reg2) <- num;
        if Int64.equal m.regs.(rind reg1) Int64.one then m.flags.fo <- false;
        if not(Int64.equal m.regs.(rind reg1) Int64.zero) then update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Ind3 (Lit imm, reg)) ->
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let dest_n_int = Int64.shift_right dest_int (Int64.to_int m.regs.(rind reg1)) in
        insert_sbyte_to_memory (m) (memory_address) (imm) (dest_n_int);
        if Int64.equal m.regs.(rind reg1) Int64.one then m.flags.fo <- false;
        if not(Int64.equal m.regs.(rind reg1) Int64.one) then update_flags m dest_n_int;
        (* for i = 0 to 7 do
          m.mem.(Int64.to_int(Int64.add (Int64.of_int (memory_address + i)) (imm))) <- List.nth (sbytes_of_int64 dest_n_int) i
        done; *)
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | _ -> ()
      end
  | (Shrq, [amt; dest]) -> (* Bitwise shift dest right by amt *)
      begin match (amt, dest) with
      | (Imm (Lit imm), Reg reg) -> 
        let rv = m.regs.(rind reg) in
        let num = Int64.shift_right_logical rv (Int64.to_int imm) in
        m.regs.(rind reg) <- num;
        if not(Int64.equal (Int64.logand (Int64.shift_right_logical rv 62) Int64.one) (Int64.shift_right_logical rv 63)) 
          && (Int64.equal imm Int64.one) then m.flags.fo <- false;
        if not(Int64.equal imm Int64.zero) then update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind3 (Lit imm2, reg)) ->
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let dest_n_int = Int64.shift_right_logical dest_int (Int64.to_int imm1) in
        insert_sbyte_to_memory (m) (memory_address) (imm2) (dest_n_int);
        if not(Int64.equal (Int64.logand (Int64.shift_right_logical dest_int 62) Int64.one) (Int64.shift_right_logical dest_int 63)) 
          && (Int64.equal imm1 Int64.one) then m.flags.fo <- false;
        if not(Int64.equal imm1 Int64.zero) then update_flags m dest_n_int;
      | (Reg reg1, Reg reg2) ->
        let rv = m.regs.(rind reg2) in
        let num = Int64.shift_right_logical rv (Int64.to_int m.regs.(rind reg1)) in
        m.regs.(rind reg2) <- num;
        if not(Int64.equal (Int64.logand (Int64.shift_right_logical rv 62) Int64.one) (Int64.shift_right_logical rv 63)) 
          && (Int64.equal m.regs.(rind reg1 ) Int64.one) then m.flags.fo <- false;
        if not(Int64.equal m.regs.(rind reg1) Int64.zero) then update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Ind3 (Lit imm, reg)) ->
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let dest_n_int = Int64.shift_right_logical dest_int (Int64.to_int m.regs.(rind reg1)) in
        insert_sbyte_to_memory (m) (memory_address) (imm) (dest_n_int);
        if not(Int64.equal (Int64.logand (Int64.shift_right_logical dest_int 62) Int64.one) (Int64.shift_right_logical dest_int 63)) 
          && (Int64.equal imm Int64.one) then m.flags.fo <- false;
        if not(Int64.equal m.regs.(rind reg1) Int64.zero) then update_flags m dest_n_int;
        (* for i = 0 to 7 do
          m.mem.(Int64.to_int(Int64.add (Int64.of_int (memory_address + i)) (imm))) <- List.nth (sbytes_of_int64 dest_n_int) i
        done; *)
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | _ -> ()
      end
  | (Shlq, [amt; dest]) -> (* Bitwise shift dest left by amt *)
      begin match (amt, dest) with
      | (Imm (Lit imm), Reg reg) -> 
        let rv = m.regs.(rind reg) in
        let num = Int64.shift_left rv (Int64.to_int imm) in
        m.regs.(rind reg) <- num;
        if not(Int64.equal (Int64.logand (Int64.shift_right_logical rv 62) Int64.one) (Int64.shift_right_logical rv 63)) 
          && (Int64.equal imm Int64.one) then m.flags.fo <- false;
        if not(Int64.equal imm Int64.zero) then update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind3 (Lit imm2, reg)) ->
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let dest_n_int = Int64.shift_left dest_int (Int64.to_int imm1) in
        insert_sbyte_to_memory (m) (memory_address) (imm2) (dest_n_int);
        if not(Int64.equal (Int64.logand (Int64.shift_right_logical dest_int 62) Int64.one) (Int64.shift_right_logical dest_int 63)) 
          && (Int64.equal imm1 Int64.one) then m.flags.fo <- false;
        if not(Int64.equal imm1 Int64.zero) then update_flags m dest_n_int;
      | (Reg reg1, Reg reg2) ->
      let rv = m.regs.(rind reg2) in
        let num = Int64.shift_left rv (Int64.to_int m.regs.(rind reg1)) in
        m.regs.(rind reg2) <- num;
        if not(Int64.equal (Int64.logand (Int64.shift_right_logical rv 62) Int64.one) (Int64.shift_right_logical rv 63)) 
          && (Int64.equal m.regs.(rind reg1) Int64.one) then m.flags.fo <- false;
        if not(Int64.equal m.regs.(rind reg1) Int64.zero) then update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Ind3 (Lit imm, reg)) ->
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let dest_n_int = Int64.shift_left dest_int (Int64.to_int m.regs.(rind reg1)) in
        insert_sbyte_to_memory (m) (memory_address) (imm) (dest_n_int);
        if not(Int64.equal (Int64.logand (Int64.shift_right_logical dest_int 62) Int64.one) (Int64.shift_right_logical dest_int 63)) 
          && (Int64.equal imm Int64.one) then m.flags.fo <- false;
        if not(Int64.equal m.regs.(rind reg1) Int64.zero) then update_flags m dest_n_int;
        (* for i = 0 to 7 do
          m.mem.(Int64.to_int(Int64.add (Int64.of_int (memory_address + i)) (imm))) <- List.nth (sbytes_of_int64 dest_n_int) i
        done; *)
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | _ -> ()
      end
  | _ -> ()
  end

let set_step (m: mach) (c: cnd) (op: operand list) : unit = 
  if interp_cnd m.flags c then 
    begin match op with
    | [Reg r] ->
      m.regs.(rind r) <- Int64.add (Int64.logand m.regs.(rind r) (Int64.of_int (-256))) Int64.one;
      m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
    | [Ind3 (Lit imm, reg)] ->
      let memory_address = get_memory_address m reg in
      let a : sbyte list = sbyte_list m.mem memory_address in
      let dest_int = int64_of_sbytes a in
      let data = Int64.add (Int64.logand dest_int (Int64.of_int (-256))) Int64.one in
      insert_sbyte_to_memory (m) (memory_address) (imm) (data);
      m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
    | _ -> ()
    end
  else
    begin match op with
    | [Reg r] ->
      m.regs.(rind r) <- Int64.logand m.regs.(rind r) (Int64.of_int (-256));
      m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
    | [Ind3 (Lit imm, reg)] ->
      let memory_address = get_memory_address m reg in
      let a : sbyte list = sbyte_list m.mem memory_address in
      let dest_int = int64_of_sbytes a in
      let data = Int64.logand dest_int (Int64.of_int (-256)) in
      insert_sbyte_to_memory (m) (memory_address) (imm) (data);
      m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
    | _ -> ()
    end

(************************************************************)
(*******************ARITHMETIC INSTRUCTIONS******************)
(************************************************************)


let arithmetic_step (m: mach) (o: opcode) (op: operand list) : unit = 
  begin match (o, op) with
  | (Negq, [dest]) -> (* Two's complement negation of dest *)
      begin match dest with
      | Reg reg ->
        let open Int64_overflow in
        let num = neg m.regs.(rind reg) in 
        m.regs.(rind reg) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        (* Printf.printf "Flags %B, %B, %B " m.flags.fo m.flags.fs m.flags.fz; *)
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | Ind1 (Lit imm) -> 
        let memory_address = get_memory_address_from_address imm in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = neg dest_int in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        (* Printf.printf "Number %Ld " num.value; *)
        (* Printf.printf "Flags %B, %B, %B " m.flags.fo m.flags.fs m.flags.fz; *)
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | Ind2 (reg) ->
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = neg dest_int in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        (* Printf.printf "Number %Ld " num.value; *)
        (* Printf.printf "Flags %B, %B, %B " m.flags.fo m.flags.fs m.flags.fz; *)
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | Ind3 (Lit imm, reg) -> 
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = neg dest_int in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (imm) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        (* Printf.printf "Number %Ld " num.value; *)
        (* Printf.printf "Flags %B, %B, %B " m.flags.fo m.flags.fs m.flags.fz; *)
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | _ -> ()
      end
  | (Addq, [src; dest]) -> (* Add src to value in dest *)
      begin match (src, dest) with
      | (Imm (Lit imm), Reg reg) ->
        let open Int64_overflow in
        let num = add m.regs.(rind reg) imm in 
        m.regs.(rind reg) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind1(Lit imm2)) ->
        let memory_address = get_memory_address_from_address imm2 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = add imm1 dest_int in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind2(reg)) ->         
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = add imm1 dest_int in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind3(Lit imm2, reg)) ->
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = add imm1 dest_int in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (imm2) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Reg reg2) ->
        let open Int64_overflow in
        let num = add m.regs.(rind reg1) m.regs.(rind reg2) in 
        m.regs.(rind reg2) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
       | (Reg reg1, Ind1(Lit imm)) ->
        let memory_address = get_memory_address_from_address imm in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = add m.regs.(rind reg1) dest_int in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Ind2(reg2)) ->
        let memory_address = get_memory_address m reg2 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = add m.regs.(rind reg1) dest_int in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Ind3(Lit imm, reg2)) ->
        let memory_address = get_memory_address m reg2 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = add m.regs.(rind reg1) dest_int in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (imm) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm), Reg reg2) ->
        let memory_address = get_memory_address_from_address imm in
        Printf.printf("asfd");
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = add m.regs.(rind reg2) dest_int in 
        m.regs.(rind reg2) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm1), Ind1(Lit imm2)) ->
        let memory_address1 = get_memory_address_from_address imm1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address_from_address imm2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = add dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm), Ind2(reg2)) ->
        let memory_address1 = get_memory_address_from_address imm in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = add dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm1), Ind3(Lit imm2, reg2)) ->
        let memory_address1 = get_memory_address_from_address imm1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = add dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (imm2) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2(reg1), Reg reg2) ->
        let memory_address = get_memory_address m reg1 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = add m.regs.(rind reg2) dest_int in 
        m.regs.(rind reg2) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
      | (Ind2(reg), Ind1(Lit imm)) ->
        let memory_address1 = get_memory_address m reg in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address_from_address imm in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = add dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2(reg1), Ind2(reg2)) ->
        let memory_address1 = get_memory_address m reg1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = add dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2(reg1), Ind3(Lit imm, reg2)) ->
        let memory_address1 = get_memory_address m reg1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = add dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (imm) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm, reg1), Reg reg2) ->
        let memory_address = (get_memory_address m reg1) + (Int64.to_int imm) in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = add m.regs.(rind reg2) dest_int in 
        m.regs.(rind reg2) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm1, reg), Ind1(Lit imm)) ->
        let memory_address1 = (get_memory_address m reg) + (Int64.to_int imm1) in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address_from_address imm in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = add dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm, reg1), Ind2(reg2)) ->
        let memory_address1 = (get_memory_address m reg1) + (Int64.to_int imm) in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = add dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm1, reg1), Ind3(Lit imm2, reg2)) ->
        let memory_address1 = (get_memory_address m reg1) + (Int64.to_int imm1) in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = add dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (imm2) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | _ -> ()
      end
  | (Subq, [src; dest]) -> (* Subtract src from value in dest *)
     begin match (src, dest) with
      | (Imm (Lit imm), Reg reg) ->
        let open Int64_overflow in
        let num = sub m.regs.(rind reg) imm in 
        m.regs.(rind reg) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind1(Lit imm2)) ->
        let memory_address = get_memory_address_from_address imm2 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = sub dest_int imm1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind2(reg)) ->         
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = sub dest_int imm1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind3(Lit imm2, reg)) ->
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = sub dest_int imm1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (imm2) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Reg reg2) ->
        let open Int64_overflow in
        let num = sub m.regs.(rind reg2) m.regs.(rind reg1) in 
        m.regs.(rind reg2) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
       | (Reg reg1, Ind1(Lit imm)) ->
        let memory_address = get_memory_address_from_address imm in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = sub dest_int m.regs.(rind reg1) in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Ind2(reg2)) ->
        let memory_address = get_memory_address m reg2 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = sub dest_int m.regs.(rind reg1) in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Ind3(Lit imm, reg2)) ->
        let memory_address = get_memory_address m reg2 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = sub dest_int m.regs.(rind reg1) in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (imm) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm), Reg reg2) ->
        let memory_address = get_memory_address_from_address imm in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = sub m.regs.(rind reg2) dest_int in 
        m.regs.(rind reg2) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm1), Ind1(Lit imm2)) ->
        let memory_address1 = get_memory_address_from_address imm1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address_from_address imm2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = sub dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm), Ind2(reg2)) ->
        let memory_address1 = get_memory_address_from_address imm in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = sub dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm1), Ind3(Lit imm2, reg2)) ->
        let memory_address1 = get_memory_address_from_address imm1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = sub dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (imm2) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2(reg1), Reg reg2) ->
        let memory_address = get_memory_address m reg1 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = sub m.regs.(rind reg2) dest_int in 
        m.regs.(rind reg2) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
      | (Ind2(reg), Ind1(Lit imm)) ->
        let memory_address1 = get_memory_address m reg in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address_from_address imm in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = sub dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2(reg1), Ind2(reg2)) ->
        let memory_address1 = get_memory_address m reg1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = sub dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2(reg1), Ind3(Lit imm, reg2)) ->
        let memory_address1 = get_memory_address m reg1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = sub dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (imm) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm, reg1), Reg reg2) ->
        let memory_address = (get_memory_address m reg1) + (Int64.to_int imm) in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = sub m.regs.(rind reg2) dest_int in 
        m.regs.(rind reg2) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm1, reg), Ind1(Lit imm)) ->
        let memory_address1 = (get_memory_address m reg) + (Int64.to_int imm1) in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address_from_address imm in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = sub dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm, reg1), Ind2(reg2)) ->
        let memory_address1 = (get_memory_address m reg1) + (Int64.to_int imm) in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = sub dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm1, reg1), Ind3(Lit imm2, reg2)) ->
        let memory_address1 = (get_memory_address m reg1) + (Int64.to_int imm1) in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let open Int64_overflow in
        let num = sub dest_int2 dest_int1 in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address2) (imm2) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | _ -> ()
      end
  | (Imulq, [src; reg]) -> (* Multiply src to value in reg *)
      begin match (src, reg) with
      | (Imm (Lit imm), Reg reg) ->
        let open Int64_overflow in
        let num = mul m.regs.(rind reg) imm in 
        m.regs.(rind reg) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Reg reg2) ->
         let open Int64_overflow in
         let num = mul m.regs.(rind reg2) m.regs.(rind reg1) in 
        m.regs.(rind reg2) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1 (Lit imm), Reg reg) ->
        let memory_address = get_memory_address_from_address imm in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = mul dest_int m.regs.(rind reg) in 
        m.regs.(rind reg) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2 (reg1), Reg reg2) ->
        let memory_address = get_memory_address m reg1 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = mul dest_int m.regs.(rind reg2) in 
        m.regs.(rind reg2) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3 (Lit imm, reg1), Reg reg2) ->
        let memory_address = (get_memory_address m reg1) + (Int64.to_int imm) in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = mul dest_int m.regs.(rind reg2) in 
        m.regs.(rind reg2) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | _ -> ()
      end
  | (Incq, [src]) -> (* Increase src by 1 *)
     begin match src with
      | Reg reg ->
        let open Int64_overflow in
        let num = succ m.regs.(rind reg) in 
        m.regs.(rind reg) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        (* Printf.printf "Flags %B, %B, %B " m.flags.fo m.flags.fs m.flags.fz; *)
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | Ind1 (Lit imm) -> 
        let memory_address = get_memory_address_from_address imm in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = succ dest_int in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | Ind2 (reg) -> 
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = succ dest_int in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | Ind3 (Lit imm, reg) -> 
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = succ dest_int in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (imm) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | _ -> ()
      end
  | (Decq, [src]) -> (* Decrease src by 1 *)
      begin match src with
      | Reg reg ->
        let open Int64_overflow in
        let num = pred m.regs.(rind reg) in 
        m.regs.(rind reg) <- num.value;
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | Ind1 (Lit imm) -> 
        let memory_address = get_memory_address_from_address imm in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = pred dest_int in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | Ind2 (reg) -> 
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = pred dest_int in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)  
      | Ind3 (Lit imm, reg) -> 
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let open Int64_overflow in
        let num = pred dest_int in 
        let dest_n_int = num.value in
        insert_sbyte_to_memory (m) (memory_address) (imm) (dest_n_int);
        if num.overflow then m.flags.fo <- true
        else m.flags.fo <- false;
        update_flags m num.value;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | _ -> ()
      end
  | _ -> ()
  end

(************************************************************)
(*********************LOGIC INSTRUCTIONS*********************)
(************************************************************)

  let logic_step (m: mach) (o: opcode) (op: operand list) : unit = 
  begin match (o, op) with
  | (Notq, [dest]) -> (* Logical negation of dest *)
      begin match dest with
      | Reg reg ->
        let num = Int64.lognot m.regs.(rind reg) in 
        m.regs.(rind reg) <- num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | Ind1 (Lit imm) -> 
        let memory_address = get_memory_address_from_address imm in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let dest_n_int = Int64.lognot dest_int in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | Ind2 (reg) -> 
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let dest_n_int = Int64.lognot dest_int in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | Ind3 (Lit imm, reg) ->
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let dest_n_int = Int64.lognot dest_int in
        insert_sbyte_to_memory (m) (memory_address) (imm) (dest_n_int);
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | _ -> ()
      end
  | (Andq, [src; dest]) -> (* Logical AND src to value in dest *)
      begin match (src, dest) with
      | (Imm (Lit imm), Reg reg) ->
        let num = Int64.logand m.regs.(rind reg) imm in 
        m.regs.(rind reg) <- num;
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind1(Lit imm2)) ->
        let memory_address = get_memory_address_from_address imm2 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logand dest_int imm1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind2(reg)) ->         
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logand dest_int imm1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind3(Lit imm2, reg)) ->
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logand dest_int imm1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (imm2) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Reg reg2) ->
        let num = Int64.logand m.regs.(rind reg2) m.regs.(rind reg1) in 
        m.regs.(rind reg2) <- num;
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
       | (Reg reg1, Ind1(Lit imm)) ->
        let memory_address = get_memory_address_from_address imm in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logand dest_int m.regs.(rind reg1) in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Ind2(reg2)) ->
        let memory_address = get_memory_address m reg2 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logand dest_int m.regs.(rind reg1) in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Ind3(Lit imm, reg2)) ->
        let memory_address = get_memory_address m reg2 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logand dest_int m.regs.(rind reg1) in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (imm) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm), Reg reg2) ->
        let memory_address = get_memory_address_from_address imm in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logand m.regs.(rind reg2) dest_int in 
        m.regs.(rind reg2) <- num;
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm1), Ind1(Lit imm2)) ->
        let memory_address1 = get_memory_address_from_address imm1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address_from_address imm2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logand dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm), Ind2(reg2)) ->
        let memory_address1 = get_memory_address_from_address imm in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logand dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm1), Ind3(Lit imm2, reg2)) ->
        let memory_address1 = get_memory_address_from_address imm1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logand dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (imm2) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2(reg1), Reg reg2) ->
        let memory_address = get_memory_address m reg1 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logand m.regs.(rind reg2) dest_int in 
        m.regs.(rind reg2) <- num;
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
      | (Ind2(reg), Ind1(Lit imm)) ->
        let memory_address1 = get_memory_address m reg in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address_from_address imm in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logand dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2(reg1), Ind2(reg2)) ->
        let memory_address1 = get_memory_address m reg1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logand dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2(reg1), Ind3(Lit imm, reg2)) ->
        let memory_address1 = get_memory_address m reg1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logand dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (imm) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm, reg1), Reg reg2) ->
        let memory_address = (get_memory_address m reg1) + (Int64.to_int imm) in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logand m.regs.(rind reg2) dest_int in 
        m.regs.(rind reg2) <- num;
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm1, reg), Ind1(Lit imm)) ->
        let memory_address1 = (get_memory_address m reg) + (Int64.to_int imm1) in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address_from_address imm in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logand dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm, reg1), Ind2(reg2)) ->
        let memory_address1 = (get_memory_address m reg1) + (Int64.to_int imm) in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logand dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm1, reg1), Ind3(Lit imm2, reg2)) ->
        let memory_address1 = (get_memory_address m reg1) + (Int64.to_int imm1) in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logand dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (imm2) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | _ -> ()
      end
  | (Orq, [src; dest]) -> (* Logical OR src to value in dest *)
      begin match (src, dest) with
      | (Imm (Lit imm), Reg reg) ->
        let num = Int64.logor m.regs.(rind reg) imm in 
        m.regs.(rind reg) <- num;
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind1(Lit imm2)) ->
        let memory_address = get_memory_address_from_address imm2 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logor dest_int imm1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind2(reg)) ->         
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logor dest_int imm1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind3(Lit imm2, reg)) ->
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logor dest_int imm1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (imm2) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Reg reg2) ->
        let num = Int64.logor m.regs.(rind reg2) m.regs.(rind reg1) in 
        m.regs.(rind reg2) <- num;
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
       | (Reg reg1, Ind1(Lit imm)) ->
        let memory_address = get_memory_address_from_address imm in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logor dest_int m.regs.(rind reg1) in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Ind2(reg2)) ->
        let memory_address = get_memory_address m reg2 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logor dest_int m.regs.(rind reg1) in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Ind3(Lit imm, reg2)) ->
        let memory_address = get_memory_address m reg2 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logor dest_int m.regs.(rind reg1) in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (imm) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm), Reg reg2) ->
        let memory_address = get_memory_address_from_address imm in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logor m.regs.(rind reg2) dest_int in 
        m.regs.(rind reg2) <- num;
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm1), Ind1(Lit imm2)) ->
        let memory_address1 = get_memory_address_from_address imm1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address_from_address imm2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm), Ind2(reg2)) ->
        let memory_address1 = get_memory_address_from_address imm in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm1), Ind3(Lit imm2, reg2)) ->
        let memory_address1 = get_memory_address_from_address imm1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (imm2) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2(reg1), Reg reg2) ->
        let memory_address = get_memory_address m reg1 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logor m.regs.(rind reg2) dest_int in 
        m.regs.(rind reg2) <- num;
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
      | (Ind2(reg), Ind1(Lit imm)) ->
        let memory_address1 = get_memory_address m reg in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address_from_address imm in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2(reg1), Ind2(reg2)) ->
        let memory_address1 = get_memory_address m reg1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2(reg1), Ind3(Lit imm, reg2)) ->
        let memory_address1 = get_memory_address m reg1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (imm) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm, reg1), Reg reg2) ->
        let memory_address = (get_memory_address m reg1) + (Int64.to_int imm) in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logor m.regs.(rind reg2) dest_int in 
        m.regs.(rind reg2) <- num;
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm1, reg), Ind1(Lit imm)) ->
        let memory_address1 = (get_memory_address m reg) + (Int64.to_int imm1) in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address_from_address imm in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm, reg1), Ind2(reg2)) ->
        let memory_address1 = (get_memory_address m reg1) + (Int64.to_int imm) in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm1, reg1), Ind3(Lit imm2, reg2)) ->
        let memory_address1 = (get_memory_address m reg1) + (Int64.to_int imm1) in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (imm2) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | _ -> ()
      end
  | (Xorq, [src; dest]) -> (* Logical XOR src to value in dest *)
       begin match (src, dest) with
      | (Imm (Lit imm), Reg reg) ->
        let num = Int64.logxor m.regs.(rind reg) imm in 
        m.regs.(rind reg) <- num;
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind1(Lit imm2)) ->
        let memory_address = get_memory_address_from_address imm2 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logxor dest_int imm1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind2(reg)) ->         
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logxor dest_int imm1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Imm (Lit imm1), Ind3(Lit imm2, reg)) ->
        let memory_address = get_memory_address m reg in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logxor dest_int imm1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (imm2) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Reg reg2) ->
        let num = Int64.logxor m.regs.(rind reg2) m.regs.(rind reg1) in 
        m.regs.(rind reg2) <- num;
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
       | (Reg reg1, Ind1(Lit imm)) ->
        let memory_address = get_memory_address_from_address imm in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logxor dest_int m.regs.(rind reg1) in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Ind2(reg2)) ->
        let memory_address = get_memory_address m reg2 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logxor dest_int m.regs.(rind reg1) in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Reg reg1, Ind3(Lit imm, reg2)) ->
        let memory_address = get_memory_address m reg2 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logxor dest_int m.regs.(rind reg1) in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address) (imm) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm), Reg reg2) ->
        let memory_address = get_memory_address_from_address imm in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logxor m.regs.(rind reg2) dest_int in 
        m.regs.(rind reg2) <- num;
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm1), Ind1(Lit imm2)) ->
        let memory_address1 = get_memory_address_from_address imm1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address_from_address imm2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logxor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm), Ind2(reg2)) ->
        let memory_address1 = get_memory_address_from_address imm in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logxor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind1(Lit imm1), Ind3(Lit imm2, reg2)) ->
        let memory_address1 = get_memory_address_from_address imm1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logxor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (imm2) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2(reg1), Reg reg2) ->
        let memory_address = get_memory_address m reg1 in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logxor m.regs.(rind reg2) dest_int in 
        m.regs.(rind reg2) <- num;
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
      | (Ind2(reg), Ind1(Lit imm)) ->
        let memory_address1 = get_memory_address m reg in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address_from_address imm in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logxor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2(reg1), Ind2(reg2)) ->
        let memory_address1 = get_memory_address m reg1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logxor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind2(reg1), Ind3(Lit imm, reg2)) ->
        let memory_address1 = get_memory_address m reg1 in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logxor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (imm) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm, reg1), Reg reg2) ->
        let memory_address = (get_memory_address m reg1) + (Int64.to_int imm) in
        let a : sbyte list = sbyte_list m.mem memory_address in
        let dest_int = int64_of_sbytes a in
        let num = Int64.logxor m.regs.(rind reg2) dest_int in 
        m.regs.(rind reg2) <- num;
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm1, reg), Ind1(Lit imm)) ->
        let memory_address1 = (get_memory_address m reg) + (Int64.to_int imm1) in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address_from_address imm in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logxor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm, reg1), Ind2(reg2)) ->
        let memory_address1 = (get_memory_address m reg1) + (Int64.to_int imm) in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logxor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (Int64.zero) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | (Ind3(Lit imm1, reg1), Ind3(Lit imm2, reg2)) ->
        let memory_address1 = (get_memory_address m reg1) + (Int64.to_int imm1) in
        let a1 : sbyte list = sbyte_list m.mem memory_address1 in
        let dest_int1 = int64_of_sbytes a1 in
        let memory_address2 = get_memory_address m reg2 in
        let a2 : sbyte list = sbyte_list m.mem memory_address2 in
        let dest_int2 = int64_of_sbytes a2 in
        let num = Int64.logxor dest_int2 dest_int1 in 
        let dest_n_int = num in
        insert_sbyte_to_memory (m) (memory_address2) (imm2) (dest_n_int);
        m.flags.fo <- false;
        update_flags m num;
        m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
      | _ -> ()
       end
  | _ -> ()
  end

(************************************************************)
(*****************DATA MOVEMENT INSTRUCTIONS*****************)
(************************************************************)

let movq_step (m: mach) (op: operand list) : unit =
  begin match op with
  | [Imm (Lit imm); Reg r] ->
    m.regs.(rind r) <- imm;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Reg reg1; Reg reg2] ->
    m.regs.(rind reg2) <- m.regs.(rind reg1);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind1 (Lit imm); Reg reg] ->
     let memory_address = get_memory_address_from_address imm in
     let a : sbyte list = sbyte_list m.mem memory_address in
     let dest_int = int64_of_sbytes a in
     m.regs.(rind reg) <- dest_int;
     m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind2 (reg1); Reg reg2] ->
     let memory_address = get_memory_address m reg1 in
     let a : sbyte list = sbyte_list m.mem memory_address in
     let dest_int = int64_of_sbytes a in
     m.regs.(rind reg2) <- dest_int;
     m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind3 (Lit imm, reg1); Reg reg2] ->
     let memory_address = (get_memory_address m reg1) + (Int64.to_int imm) in
     let a : sbyte list = sbyte_list m.mem memory_address in
     let dest_int = int64_of_sbytes a in
     m.regs.(rind reg2) <- dest_int;
     m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Imm (Lit imm1); Ind1 (Lit imm2)] ->
    let memory_address = get_memory_address_from_address imm2 in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (imm1);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Imm (Lit imm1); Ind2 (reg)] ->
    let memory_address = get_memory_address m reg in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (imm1);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Imm (Lit imm1); Ind3 (Lit imm2, reg)] ->
    let memory_address = get_memory_address m reg in
    insert_sbyte_to_memory (m) (memory_address) (imm2) (imm1);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Reg reg; Ind1 (Lit imm)] ->
    let memory_address = get_memory_address_from_address imm in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (m.regs.(rind reg));
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Reg reg1; Ind2 (reg2)] ->
    let memory_address = get_memory_address m reg2 in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (m.regs.(rind reg1));
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Reg r; Ind3 (Lit imm, reg)] ->
    let memory_address = get_memory_address m reg in
    insert_sbyte_to_memory (m) (memory_address) (imm) (m.regs.(rind r));
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind1 (Lit imm1); Ind1 (Lit imm2)] ->
    let source_address = get_memory_address_from_address imm1 in
    let a : sbyte list = sbyte_list m.mem source_address in
    let dest_int = int64_of_sbytes a in
    let memory_address = get_memory_address_from_address imm2 in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_int);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind1 (Lit imm1); Ind2 (reg)] ->
    let source_address = get_memory_address_from_address imm1 in
    let a : sbyte list = sbyte_list m.mem source_address in
    let dest_int = int64_of_sbytes a in
    let memory_address = get_memory_address m reg in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_int);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind1 (Lit imm1); Ind3 (Lit imm2, reg)] ->
    let source_address = get_memory_address_from_address imm1 in
    let a : sbyte list = sbyte_list m.mem source_address in
    let dest_int = int64_of_sbytes a in
    let memory_address = get_memory_address m reg in
    insert_sbyte_to_memory (m) (memory_address) (imm2) (dest_int);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind2 (reg); Ind1 (Lit imm)] ->
    let source_address = get_memory_address m reg in
    let a : sbyte list = sbyte_list m.mem source_address in
    let dest_int = int64_of_sbytes a in
    let memory_address = get_memory_address_from_address imm in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_int);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind2 (reg1); Ind2 (reg2)] ->
    let source_address = get_memory_address m reg1 in
    let a : sbyte list = sbyte_list m.mem source_address in
    let dest_int = int64_of_sbytes a in
    let memory_address = get_memory_address m reg2 in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_int);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind2 (reg1); Ind3 (Lit imm, reg2)] ->
    let source_address = get_memory_address m reg1 in
    let a : sbyte list = sbyte_list m.mem source_address in
    let dest_int = int64_of_sbytes a in
    let memory_address = get_memory_address m reg2 in
    insert_sbyte_to_memory (m) (memory_address) (imm) (dest_int);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind3 (Lit imm1, reg1); Ind1 (Lit imm2)] ->
    let source_address = (get_memory_address m reg1) + (Int64.to_int imm1) in
    let a : sbyte list = sbyte_list m.mem source_address in
    let dest_int = int64_of_sbytes a in
    let memory_address = get_memory_address_from_address imm2 in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_int);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind3 (Lit imm1, reg1); Ind2 (reg2)] ->
    let source_address = (get_memory_address m reg1) + (Int64.to_int imm1) in
    let a : sbyte list = sbyte_list m.mem source_address in
    let dest_int = int64_of_sbytes a in
    let memory_address = get_memory_address m reg2 in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (dest_int);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind3 (Lit imm1, reg1); Ind3 (Lit imm2, reg2)] ->
    let source_address = (get_memory_address m reg1) + (Int64.to_int imm1) in
    let a : sbyte list = sbyte_list m.mem source_address in
    let dest_int = int64_of_sbytes a in
    let memory_address = get_memory_address m reg2 in
    insert_sbyte_to_memory (m) (memory_address) (imm2) (dest_int);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | _ -> ()
  end

let pushq_step (m: mach) (op: operand list) : unit =
  begin match op with
  | [Imm (Lit imm)] ->
    m.regs.(rind Rsp) <- Int64.sub (m.regs.(rind Rsp)) (Int64.of_int 8);
    let memory_address = get_memory_address m Rsp in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (imm);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Reg reg] -> 
    m.regs.(rind Rsp) <- Int64.sub (m.regs.(rind Rsp)) (Int64.of_int 8);
    let memory_address = get_memory_address m Rsp in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (m.regs.(rind reg));
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind1 (Lit imm)] ->
    m.regs.(rind Rsp) <- Int64.sub (m.regs.(rind Rsp)) (Int64.of_int 8);
    let source_address = get_memory_address_from_address imm in
    let memory_address = get_memory_address m Rsp in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (int64_of_sbytes (sbyte_list m.mem source_address));
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 8);
  | [Ind2 (reg)] ->
    m.regs.(rind Rsp) <- Int64.sub (m.regs.(rind Rsp)) (Int64.of_int 8);
    let source_address = get_memory_address m reg in
    let memory_address = get_memory_address m Rsp in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (int64_of_sbytes (sbyte_list m.mem source_address));
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 8);
  | [Ind3 (Lit imm, reg)] ->
    m.regs.(rind Rsp) <- Int64.sub (m.regs.(rind Rsp)) (Int64.of_int 8);
    let source_address = (get_memory_address m reg) + (Int64.to_int imm) in
    let memory_address = get_memory_address m Rsp in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (int64_of_sbytes (sbyte_list m.mem source_address));
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 8);
  | _ -> ()
  end

let popq_step (m: mach) (op: operand list) : unit =
  begin match op with
  | [Reg reg] ->
    let memory_address = get_memory_address m Rsp in
    m.regs.(rind reg) <- int64_of_sbytes (sbyte_list m.mem memory_address);
    m.regs.(rind Rsp) <- Int64.add (m.regs.(rind Rsp)) (Int64.of_int 8);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind1 (Lit imm)] ->
    let source_address = get_memory_address m Rsp in
    let memory_address = get_memory_address_from_address imm in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (int64_of_sbytes (sbyte_list m.mem source_address));
    m.regs.(rind Rsp) <- Int64.add (m.regs.(rind Rsp)) (Int64.of_int 8);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind2 (reg)] ->
    let source_address = get_memory_address m Rsp in
    let memory_address = get_memory_address m reg in
    insert_sbyte_to_memory (m) (memory_address) (Int64.zero) (int64_of_sbytes (sbyte_list m.mem source_address));
    m.regs.(rind Rsp) <- Int64.add (m.regs.(rind Rsp)) (Int64.of_int 8);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind3 (Lit imm, reg)] ->
    let source_address = get_memory_address m Rsp in
    let memory_address = get_memory_address m reg in
    insert_sbyte_to_memory (m) (memory_address) (imm) (int64_of_sbytes (sbyte_list m.mem source_address));
    m.regs.(rind Rsp) <- Int64.add (m.regs.(rind Rsp)) (Int64.of_int 8);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | _ -> ()
  end

let leaq_step (m: mach) (op: operand list) : unit = 
  begin match op with
  | [Ind1 (Lit imm); Reg r] ->
    m.regs.(rind r) <- imm;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind2 (reg); Reg r] ->
    let memory_address = get_memory_address m reg in
    m.regs.(rind r) <- Int64.of_int memory_address;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind3 (Lit imm, reg); Reg r] ->
    let memory_address = get_memory_address m reg in
    m.regs.(rind r) <- Int64.add (Int64.of_int memory_address) imm;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind1 (Lit imm1); Ind1 (Lit imm2)] -> 
    let destination_address = get_memory_address_from_address imm2 in
    insert_sbyte_to_memory (m) (destination_address) (Int64.zero) (Int64.of_int (get_memory_address_from_address imm1));
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind2 (reg); Ind1 (Lit imm)] -> 
    let memory_address = get_memory_address m reg in
    let destination_address = get_memory_address_from_address imm in
    insert_sbyte_to_memory (m) (destination_address) (Int64.zero) (Int64.of_int memory_address);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind3 (Lit imm1, reg); Ind1 (Lit imm2)] -> 
    let memory_address = get_memory_address m reg in
    let destination_address = get_memory_address_from_address imm2 in
    let data = Int64.add (Int64.of_int memory_address) imm1 in
    insert_sbyte_to_memory (m) (destination_address) (Int64.zero) (data);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind1 (Lit imm1); Ind2 (reg2)] -> 
    let destination_address = get_memory_address m reg2 in
    insert_sbyte_to_memory (m) (destination_address) (Int64.zero) (Int64.of_int (get_memory_address_from_address imm1));
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind2 (reg1); Ind2 (reg2)] -> 
    let memory_address = get_memory_address m reg1 in
    let destination_address = get_memory_address m reg2 in
    insert_sbyte_to_memory (m) (destination_address) (Int64.zero) (Int64.of_int memory_address);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind3 (Lit imm1, reg1); Ind2 (reg2)] -> 
    let memory_address = get_memory_address m reg1 in
    let destination_address = get_memory_address m reg2 in
    let data = Int64.add (Int64.of_int memory_address) imm1 in
    insert_sbyte_to_memory (m) (destination_address) (Int64.zero) (data);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind1 (Lit imm1); Ind3 (Lit imm2, reg2)] -> 
    let destination_address = get_memory_address m reg2 in
    insert_sbyte_to_memory (m) (destination_address) (imm2) (Int64.of_int (get_memory_address_from_address imm1));
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind2 (reg1); Ind3 (Lit imm2, reg2)] -> 
    let memory_address = get_memory_address m reg1 in
    let destination_address = get_memory_address m reg2 in
    insert_sbyte_to_memory (m) (destination_address) (imm2) (Int64.of_int memory_address);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind3 (Lit imm1, reg1); Ind3 (Lit imm2, reg2)] -> 
    let memory_address = get_memory_address m reg1 in
    let destination_address = get_memory_address m reg2 in
    let data = Int64.add (Int64.of_int memory_address) imm1 in
    insert_sbyte_to_memory (m) (destination_address) (imm2) (data);
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | _ -> ()
  end

(************************************************************)
(***********CONTROL-FLOW & CONDITION INSTRUCTIONS************)
(************************************************************)

let cmpq_step (m: mach) (op: operand list) : unit =
  begin match op with
  | [Imm (Lit imm1); Imm (Lit imm2)] ->
    let open Int64_overflow in
    let num = sub imm2 imm1 in
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Reg reg; Imm (Lit imm)] ->
    let open Int64_overflow in
    let num = sub imm m.regs.(rind reg) in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Imm (Lit imm); Reg reg] ->
    let open Int64_overflow in
    let num = sub m.regs.(rind reg) imm in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Reg reg1; Reg reg2] ->
    let open Int64_overflow in
    let num = sub m.regs.(rind reg2) m.regs.(rind reg1) in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Imm (Lit imm1); Ind1(Lit imm2)] ->
    let memory_address = get_memory_address_from_address imm2 in
    let a : sbyte list = sbyte_list m.mem memory_address in
    let dest_int = int64_of_sbytes a in
    let open Int64_overflow in
    let num = sub dest_int imm1 in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Imm (Lit imm1); Ind2(reg)] ->         
    let memory_address = get_memory_address m reg in
    let a : sbyte list = sbyte_list m.mem memory_address in
    let dest_int = int64_of_sbytes a in
    let open Int64_overflow in
    let num = sub dest_int imm1 in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Imm (Lit imm1); Ind3(Lit imm2, reg)] ->
    let memory_address = get_memory_address m reg in
    let a : sbyte list = sbyte_list m.mem memory_address in
    let dest_int = int64_of_sbytes a in
    let open Int64_overflow in
    let num = sub dest_int imm1 in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Reg reg1; Ind1(Lit imm)] ->
    let memory_address = get_memory_address_from_address imm in
    let a : sbyte list = sbyte_list m.mem memory_address in
    let dest_int = int64_of_sbytes a in
    let open Int64_overflow in
    let num = sub dest_int m.regs.(rind reg1) in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Reg reg1; Ind2(reg2)] ->
    let memory_address = get_memory_address m reg2 in
    let a : sbyte list = sbyte_list m.mem memory_address in
    let dest_int = int64_of_sbytes a in
    let open Int64_overflow in
    let num = sub dest_int m.regs.(rind reg1) in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Reg reg1; Ind3(Lit imm, reg2)] ->
    let memory_address = get_memory_address m reg2 in
    let a : sbyte list = sbyte_list m.mem memory_address in
    let dest_int = int64_of_sbytes a in
    let open Int64_overflow in
    let num = sub dest_int m.regs.(rind reg1) in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind1(Lit imm); Reg reg2] ->
    let memory_address = get_memory_address_from_address imm in
    let a : sbyte list = sbyte_list m.mem memory_address in
    let dest_int = int64_of_sbytes a in
    let open Int64_overflow in
    let num = sub m.regs.(rind reg2) dest_int in 
    m.regs.(rind reg2) <- num.value;
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind1(Lit imm1); Ind1(Lit imm2)] ->
    let memory_address1 = get_memory_address_from_address imm1 in
    let a1 : sbyte list = sbyte_list m.mem memory_address1 in
    let dest_int1 = int64_of_sbytes a1 in
    let memory_address2 = get_memory_address_from_address imm2 in
    let a2 : sbyte list = sbyte_list m.mem memory_address2 in
    let dest_int2 = int64_of_sbytes a2 in
    let open Int64_overflow in
    let num = sub dest_int2 dest_int1 in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind1(Lit imm); Ind2(reg2)] ->
    let memory_address1 = get_memory_address_from_address imm in
    let a1 : sbyte list = sbyte_list m.mem memory_address1 in
    let dest_int1 = int64_of_sbytes a1 in
    let memory_address2 = get_memory_address m reg2 in
    let a2 : sbyte list = sbyte_list m.mem memory_address2 in
    let dest_int2 = int64_of_sbytes a2 in
    let open Int64_overflow in
    let num = sub dest_int2 dest_int1 in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind1(Lit imm1); Ind3(Lit imm2, reg2)] ->
    let memory_address1 = get_memory_address_from_address imm1 in
    let a1 : sbyte list = sbyte_list m.mem memory_address1 in
    let dest_int1 = int64_of_sbytes a1 in
    let memory_address2 = get_memory_address m reg2 in
    let a2 : sbyte list = sbyte_list m.mem memory_address2 in
    let dest_int2 = int64_of_sbytes a2 in
    let open Int64_overflow in
    let num = sub dest_int2 dest_int1 in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind2(reg1); Reg reg2] ->
    let memory_address = get_memory_address m reg1 in
    let a : sbyte list = sbyte_list m.mem memory_address in
    let dest_int = int64_of_sbytes a in
    let open Int64_overflow in
    let num = sub m.regs.(rind reg2) dest_int in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  | [Ind2(reg); Ind1(Lit imm)] ->
    let memory_address1 = get_memory_address m reg in
    let a1 : sbyte list = sbyte_list m.mem memory_address1 in
    let dest_int1 = int64_of_sbytes a1 in
    let memory_address2 = get_memory_address_from_address imm in
    let a2 : sbyte list = sbyte_list m.mem memory_address2 in
    let dest_int2 = int64_of_sbytes a2 in
    let open Int64_overflow in
    let num = sub dest_int2 dest_int1 in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind2(reg1); Ind2(reg2)] ->
    let memory_address1 = get_memory_address m reg1 in
    let a1 : sbyte list = sbyte_list m.mem memory_address1 in
    let dest_int1 = int64_of_sbytes a1 in
    let memory_address2 = get_memory_address m reg2 in
    let a2 : sbyte list = sbyte_list m.mem memory_address2 in
    let dest_int2 = int64_of_sbytes a2 in
    let open Int64_overflow in
    let num = sub dest_int2 dest_int1 in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind2(reg1); Ind3(Lit imm, reg2)] ->
    let memory_address1 = get_memory_address m reg1 in
    let a1 : sbyte list = sbyte_list m.mem memory_address1 in
    let dest_int1 = int64_of_sbytes a1 in
    let memory_address2 = get_memory_address m reg2 in
    let a2 : sbyte list = sbyte_list m.mem memory_address2 in
    let dest_int2 = int64_of_sbytes a2 in
    let open Int64_overflow in
    let num = sub dest_int2 dest_int1 in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind3(Lit imm, reg1); Reg reg2] ->
    let memory_address = (get_memory_address m reg1) + (Int64.to_int imm) in
    let a : sbyte list = sbyte_list m.mem memory_address in
    let dest_int = int64_of_sbytes a in
    let open Int64_overflow in
    let num = sub m.regs.(rind reg2) dest_int in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind3(Lit imm1, reg); Ind1(Lit imm)] ->
    let memory_address1 = (get_memory_address m reg) + (Int64.to_int imm1) in
    let a1 : sbyte list = sbyte_list m.mem memory_address1 in
    let dest_int1 = int64_of_sbytes a1 in
    let memory_address2 = get_memory_address_from_address imm in
    let a2 : sbyte list = sbyte_list m.mem memory_address2 in
    let dest_int2 = int64_of_sbytes a2 in
    let open Int64_overflow in
    let num = sub dest_int2 dest_int1 in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind3(Lit imm, reg1); Ind2(reg2)] ->
    let memory_address1 = (get_memory_address m reg1) + (Int64.to_int imm) in
    let a1 : sbyte list = sbyte_list m.mem memory_address1 in
    let dest_int1 = int64_of_sbytes a1 in
    let memory_address2 = get_memory_address m reg2 in
    let a2 : sbyte list = sbyte_list m.mem memory_address2 in
    let dest_int2 = int64_of_sbytes a2 in
    let open Int64_overflow in
    let num = sub dest_int2 dest_int1 in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | [Ind3(Lit imm1, reg1); Ind3(Lit imm2, reg2)] ->
    let memory_address1 = (get_memory_address m reg1) + (Int64.to_int imm1) in
    let a1 : sbyte list = sbyte_list m.mem memory_address1 in
    let dest_int1 = int64_of_sbytes a1 in
    let memory_address2 = get_memory_address m reg2 in
    let a2 : sbyte list = sbyte_list m.mem memory_address2 in
    let dest_int2 = int64_of_sbytes a2 in
    let open Int64_overflow in
    let num = sub dest_int2 dest_int1 in 
    if num.overflow then m.flags.fo <- true
    else m.flags.fo <- false;
    update_flags m num.value;
    m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)
  | _ -> ()
  end

let jmp_step (m: mach) (op: operand list) : unit = 
  begin match op with
  | [Imm (Lit imm)] ->
    m.regs.(rind Rip) <- imm;
  | [Reg reg] ->
    m.regs.(rind Rip) <- m.regs.(rind reg);
  | [Ind1 (Lit imm)] ->
    let memory_address = get_memory_address_from_address imm in
    let a : sbyte list = sbyte_list m.mem memory_address in
    let dest_int = int64_of_sbytes a in
    m.regs.(rind Rip) <- dest_int;
  | [Ind2 (reg)] ->
    let memory_address = get_memory_address m reg in
    let a : sbyte list = sbyte_list m.mem memory_address in
    let dest_int = int64_of_sbytes a in
    m.regs.(rind Rip) <- dest_int;
  | [Ind3 (Lit imm, reg)] ->
    let memory_address = (get_memory_address m reg) + (Int64.to_int imm) in
    let a : sbyte list = sbyte_list m.mem memory_address in
    let dest_int = int64_of_sbytes a in
    m.regs.(rind Rip) <- dest_int;
  | _ -> ()
  end

let j_step (m: mach) (c: cnd) (op: operand list) : unit = 
  if (interp_cnd m.flags) c then jmp_step m op
  else m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4)

let callq_step (m: mach) (op: operand list) : unit = 
  m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 4);
  pushq_step m [Reg Rip];
  jmp_step m op

let retq_step (m: mach) : unit = 
  let memory_address = get_memory_address m Rsp in
  m.regs.(rind Rip) <- int64_of_sbytes (sbyte_list m.mem memory_address);
  m.regs.(rind Rsp) <- Int64.add (m.regs.(rind Rsp)) (Int64.of_int 8)

(************************************************************)
(************************************************************)
(************************************************************)


(* Simulates one step of the machine:
    - fetch the instruction at %rip
    - compute the source and/or destination information from the operands
    - simulate the instruction semantics
    - update the registers and/or memory appropriately
    - set the condition flags
*)

let step (m:mach) : unit =
  let memory_address = get_memory_address m Rip in
  let ins = m.mem.(memory_address) in
  begin match ins with
  | InsB0 x ->
    begin match x with
    | (Movq, oplist) -> movq_step m oplist
    | (Pushq, oplist) -> pushq_step m oplist
    | (Popq, oplist) -> popq_step m oplist
    | (Leaq, oplist) -> leaq_step m oplist
    | (Incq, oplist) -> arithmetic_step m Incq oplist
    | (Decq, oplist) -> arithmetic_step m Decq oplist
    | (Negq, oplist) -> arithmetic_step m Negq oplist
    | (Notq, oplist) -> logic_step m Notq oplist
    | (Addq, oplist) -> arithmetic_step m Addq oplist
    | (Subq, oplist) -> arithmetic_step m Subq oplist
    | (Imulq, oplist) -> arithmetic_step m Imulq oplist
    | (Xorq, oplist) -> logic_step m Xorq oplist
    | (Orq, oplist) -> logic_step m Orq oplist
    | (Andq, oplist) -> logic_step m Andq oplist
    | (Sarq, oplist) -> bit_manipulation_step m Sarq oplist
    | (Shlq, oplist) -> bit_manipulation_step m Shlq oplist
    | (Shrq, oplist) -> bit_manipulation_step m Shrq oplist
    | (Jmp, oplist) -> jmp_step m oplist
    | (J c, oplist) -> j_step m c oplist
    | (Cmpq, oplist) -> cmpq_step m oplist
    | (Set c, oplist) -> set_step m c oplist
    | (Callq, oplist) -> callq_step m oplist
    | (Retq, _) -> retq_step m
    end
  | InsFrag -> ()
  | Byte c -> m.regs.(rind Rip) <- Int64.add (m.regs.(rind Rip)) (Int64.of_int 1) (**)
  end



(* Runs the machine until the rip register reaches a designated
   memory address. *)
let run (m:mach) : int64 =
  while m.regs.(rind Rip) <> exit_addr do step m done;
  m.regs.(rind Rax)

(* assembling and linking --------------------------------------------------- *)

(* A representation of the executable *)
type exec = { entry    : quad              (* address of the entry point *)
            ; text_pos : quad              (* starting address of the code *)
            ; data_pos : quad              (* starting address of the data *)
            ; text_seg : sbyte list        (* contents of the text segment *)
            ; data_seg : sbyte list        (* contents of the data segment *)
            }

(* Assemble should raise this when a label is used but not defined *)
exception Undefined_sym of lbl

(* Assemble should raise this when a label is defined more than once *)
exception Redefined_sym of lbl

(* Convert an X86 program into an object file:
   - separate the text and data segments
   - compute the size of each segment
      Note: the size of an Asciz string section is (1 + the string length)

   - resolve the labels to concrete addresses and 'patch' the instructions to 
     replace Lbl values with the corresponding Imm values.

   - the text segment starts at the lowest address
   - the data segment starts after the text segment

  HINT: List.fold_left and List.fold_right are your friends.

  Fill out the assemble function, which creates an obj given an X86.prog.
  First, calculate the address where text and data should be loaded according
  to the memory layout described above. Then, to resolve forward references to
  labels, you will need to traverse the assembly program and construct a symbol
  table to record the absolute address of each label definition you encounter.
  The last step is to traverse the assembly program a second time, outputting
  sbytes for each instruction and data element you encounter. You will need
  to use your symbol table to replace labels, which can occur in instruction
  operands or Quad data, with their addresses.

 *)

(********************************************************)
(* record absolute address of each label in symbol tabl *)
(********************************************************)

let get_cur_data_length (data: data list) : int =
  let cur_data_length = ref 0 in
  for i = 0 to (List.length data - 1) do
    let cur_data = (List.nth data i) in
    cur_data_length := !cur_data_length + List.length (sbytes_of_data cur_data)
  done;
  !cur_data_length

let initialize_label_hash (p: elem list) : ((lbl, int64) Hashtbl.t * int64 * int64) =
  let hash = Hashtbl.create (List.length p) in
  let cur_label_address = ref 0x400000L in
  let data_address = ref 0x400000L in
  let main_address = ref 0x400000L in
  for i = 0 to (List.length p - 1) do
    let cur_elem = List.nth p i in
    begin match cur_elem.asm with
    | Text (ins_list) ->
        if String.equal cur_elem.lbl "main" then
          main_address := !cur_label_address
        else
          main_address := !main_address;
        let cur_asm_length = List.length ins_list in
        Hashtbl.add hash (cur_elem.lbl) (!cur_label_address);
        cur_label_address := Int64.add (!cur_label_address) (Int64.of_int (cur_asm_length * 4));
    | Data (data_list) ->
        data_address := !cur_label_address;
        Hashtbl.add hash (cur_elem.lbl) (!data_address);
        cur_label_address := Int64.add (!cur_label_address) (Int64.of_int (get_cur_data_length (data_list)));
    end;
  done;
  (hash, !data_address, !main_address)

let translate_cur_ins (st: (lbl, int64) Hashtbl.t) (input_text_seg: sbyte list)(ins: ins list) : sbyte list =
  let text_seg = ref input_text_seg in
  for i = 0 to (List.length ins - 1) do
    let cur_ins = (List.nth ins i) in
    begin match cur_ins with
    | (Movq, oplist) ->
        begin match oplist with
        | [Ind1 (Lbl l); dest] ->
            let lbl_address = try
              Hashtbl.find st l
            with Not_found -> raise (Undefined_sym l) in
            text_seg := !text_seg @ [InsB0 (Movq, [Ind1 (Lit (lbl_address)); dest])] @ [InsFrag; InsFrag; InsFrag] 
        | _ ->
            text_seg := !text_seg @ sbytes_of_ins cur_ins
        end
    | (Pushq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Popq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Leaq, oplist) ->
      begin match oplist with
        | [Ind1 (Lbl l); dest] ->
            let lbl_address = try
              Hashtbl.find st l
            with Not_found -> raise (Undefined_sym l) in
            text_seg := !text_seg @ [InsB0 (Leaq, [Ind1 (Lit (lbl_address)); dest])] @ [InsFrag; InsFrag; InsFrag] 
        | _ ->
            text_seg := !text_seg @ sbytes_of_ins cur_ins
        end
    | (Incq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Decq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Negq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Notq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Addq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Subq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Imulq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Xorq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Orq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Andq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Sarq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Shlq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Shrq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Jmp, oplist) ->
        begin match oplist with
        | [Imm (Lbl l)] ->
            let lbl_address = try
              Hashtbl.find st l
            with Not_found -> raise (Undefined_sym l) in
            text_seg := !text_seg @ [InsB0 (Jmp, [Imm (Lit (lbl_address))])] @ [InsFrag; InsFrag; InsFrag] 
        | _ ->
            text_seg := !text_seg @ sbytes_of_ins cur_ins 
        end
    | (J cc, oplist) ->
        begin match oplist with
        | [Imm (Lbl l)] ->
            let lbl_address = try
              Hashtbl.find st l
            with Not_found -> raise (Undefined_sym l) in
            text_seg := !text_seg @ [InsB0 (J cc, [Imm (Lit (lbl_address))])] @ [InsFrag; InsFrag; InsFrag] 
        | _ ->
            text_seg := !text_seg @ sbytes_of_ins cur_ins 
        end
    | (Cmpq, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Set c, oplist) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    | (Callq, oplist) ->
        begin match oplist with
        | [Imm (Lbl l)] -> 
            let lbl_address = try
              Hashtbl.find st l
            with Not_found -> raise (Undefined_sym l) in
            text_seg := !text_seg @ [InsB0 (Callq, [Imm (Lit (lbl_address))])] @ [InsFrag; InsFrag; InsFrag] 
        | _ ->
            text_seg := !text_seg @ sbytes_of_ins cur_ins
        end
    | (Retq, _) ->
        text_seg := !text_seg @ sbytes_of_ins cur_ins
    end
  done;
  !text_seg

let translate_cur_data (input_data_seg: sbyte list) (data: data list) : sbyte list =
  let data_seg = ref input_data_seg in
  for i = 0 to (List.length data - 1) do
    let cur_data = (List.nth data i) in
    data_seg := !data_seg @ sbytes_of_data cur_data
  done;
  !data_seg

let assemble (p:prog) : exec =
  let (label_symbol_table, data_pos, main_address) = initialize_label_hash p in
  let checker =
    try
      Hashtbl.find label_symbol_table "main"
    with Not_found -> raise (Undefined_sym "Main") in
  let text_seg_list = ref [] in
  let data_seg_list = ref [] in
  for i = 0 to (List.length p - 1) do
    let cur_asm = (List.nth p i).asm in
    begin match cur_asm with  
    | Text (ins_list) ->
        (*put in tex_seg array*)
        let cur_ins_list = ins_list in
        text_seg_list := (translate_cur_ins (label_symbol_table) (!text_seg_list) (cur_ins_list))
    | Data (data_list) -> 
        (*put in data_seg array*)
        let cur_data_list = data_list in
        data_seg_list := (translate_cur_data (!data_seg_list) (cur_data_list))
    end
  done;
  { entry = main_address (**)
  ; text_pos = 0x400000L
  ; data_pos = data_pos (*add length of text_seg*)
  ; text_seg = !text_seg_list
  ; data_seg = !data_seg_list
  }

(* Convert an object file into an executable machine state. 
    - allocate the mem array
    - set up the memory state by writing the symbolic bytes to the 
      appropriate locations 
    - create the inital register state
      - initialize rip to the entry point address
      - initializes rsp to the last word in memory 
      - the other registers are initialized to 0
    - the condition code flags start as 'false'

  Hint: The Array.make, Array.blit, and Array.of_list library functions 
  may be of use.
*)
let load {entry; text_pos; data_pos; text_seg; data_seg} : mach = 
  let mem = (Array.make mem_size (Byte '\x00')) in
  let toInt (i : int option) =
  match i with
  | Some x -> x
  | None -> raise (Invalid_argument "get int from int option")
  in
  Array.blit (Array.of_list text_seg) 0 mem (toInt (map_addr text_pos)) (List.length text_seg);
  Array.blit (Array.of_list data_seg) 0 mem (toInt (map_addr data_pos)) (List.length data_seg);
  let regs = Array.make nregs 0L in
  regs.(rind Rip) <- entry;
  regs.(rind Rsp) <- Int64.sub mem_top 8L;
  let m : mach = { flags = {fo = false; fs = false; fz = false};
    regs = regs;
    mem = mem
  } in
  insert_sbyte_to_memory m (get_memory_address m Rsp) Int64.zero exit_addr;
  m
