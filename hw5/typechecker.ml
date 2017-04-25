open Ast
open Tctxt

(* Use type_error to report error messages for ill-typed programs. *)
exception TypeError of string
let type_error (l : 'a node) err =
  let (_, (s, e), _) = l.loc in
  raise (TypeError (Printf.sprintf "[%d, %d] %s" s e err))

(* The Oat types of the Oat built-in functions *)
let builtins =
  [ "array_of_string",  ([TRef RString],  RetVal (TRef(RArray TInt)))
  ; "string_of_array",  ([TRef(RArray TInt)], RetVal (TRef RString))
  ; "length_of_string", ([TRef RString],  RetVal TInt)
  ; "string_of_int",    ([TInt], RetVal (TRef RString))
  ; "string_cat",       ([TRef RString; TRef RString], RetVal (TRef RString))
  ; "print_string",     ([TRef RString],  RetVoid)
  ; "print_int",        ([TInt], RetVoid)
  ; "print_bool",       ([TBool], RetVoid)
  ]

(* binary operation types --------------------------------------------------- *)
let typ_of_binop : Ast.binop -> Ast.ty * Ast.ty * Ast.ty = function
  | Add | Mul | Sub | Shl | Shr | Sar | IAnd | IOr -> (TInt, TInt, TInt)
  | Eq | Neq | Lt | Lte | Gt | Gte -> (TInt, TInt, TBool)
  | And | Or -> (TBool, TBool, TBool)

(* unary operation types ---------------------------------------------------- *)
let typ_of_unop : Ast.unop -> Ast.ty * Ast.ty = function
  | Neg | Bitnot -> (TInt, TInt)
  | Lognot       -> (TBool, TBool)


(* expressions -------------------------------------------------------------- *)
(* TASK:

   Typechecks an expression in the typing context c, returns the type of the
   expression.  This function should implement the inference rules given in
   the oad.pdf specification.  There, they are written:

       F; S; G; L |- exp : t

   See tctxt.ml for the implementation of the context c, which represents the
   four typing contexts:
        F - for function identifiers
        S - for structure definitions
        G - for global identifiers
        L - for local identifiers

   Notes:
     - Pay careful attention to the Id x case.  The abstract syntax treats
       function, global, and local identifiers all as Id x, but the
       typechecking rules (and compilation invariants) treat function identifiers
       differently.

     - Structure values permit the programmer to write the fields in
       any order (compared with the structure definition).  This means
       that, given the declaration
          struct T { a:int; b:int; c:int }
       The expression
          new T {b=3; c=4; a=1}
       is well typed.  (You should sort the fields to compare them.)
       This is the meaning of the permutation pi that is used in the
       TYP_STRUCTLIT rule.
*)
let rec typecheck_exp (c : Tctxt.t) (e : Ast.exp node) : Ast.ty =
  begin match e.elt with
  | CNull ty -> ty
  | CBool b -> TBool
  | CInt i64 -> TInt
  | CStr s -> TRef RString
  | CArr (ty, el) ->
    List.iter (fun f ->
      if not ((typecheck_exp c f) = ty)
      then type_error f "typecheck_exp : array entry error"
      else ()) el;
    TRef (RArray ty)
  | CStruct (id, fl) ->
    if not ((lookup_struct_option id c) = None) then
      (List.iter (fun f ->
      if ((lookup_field_option id f.cfname c) = None) ||
         (not ((lookup_field id f.cfname c) = (typecheck_exp c f.cfinit))) ||
         (not (List.length fl = List.length (lookup_struct id c))) then
      type_error f.cfinit "typecheck_exp : struct field error"
      else ()) fl;
      TRef (RStruct id))
    else type_error e "typecheck_exp : struct not in ctxt"
  | Proj (e1, id) ->
    begin match typecheck_exp c e1 with
    | TRef (RStruct st_id) ->
      if not ((lookup_field_option st_id id c) = None) then
        lookup_field st_id id c
      else type_error e1 "typecheck_exp : projection field does not exist"
    | _ -> type_error e1 "typecheck_exp : projection not a struct"
    end
  | NewArr (ty, e1) ->
    if not ((typecheck_exp c e1) = TInt) then
      type_error e1 "typecheck_exp : array init error"
    else ();
    TRef (RArray ty)
  | Id id ->
    if (lookup_option id c) = None then
      if not ((lookup_function_option id c) = None) then
        let fty = lookup_function id c in
        TRef (RFun fty)
      else type_error e "typecheck_exp : id not in tctxt"
    else lookup id c
  | Index (e1, e2) ->
    begin match typecheck_exp c e1 with
    | TRef (RArray ty) ->
      if not ((typecheck_exp c e2) = TInt) then
        type_error e2 "typecheck_exp : array index not an integer"
      else ty
    | _ -> type_error e1 "typecheck_exp : not indexing an array"
    end
  | Call (e1, el) ->
    begin match typecheck_exp c e1 with
    | TRef (RFun (tl, RetVal rt)) ->
      if not (List.length tl = List.length el) then type_error e1 "typecheck_exp : incorrect amount of args"
      else ();
      List.iter2 (fun f t ->
      if (typecheck_exp c f) = t then ()
      else type_error f "typecheck_exp : argument type error") el tl;
      rt
    | _ -> type_error e1 "typecheck_exp : call not function"
    end
  | Bop (binop, e1, e2) ->
    let (t1, t2, rty) = typ_of_binop binop in
    begin match (typecheck_exp c e1, typecheck_exp c e2) with
    | (TInt, TInt) -> if (t1 = TInt) && (t2 = TInt) then rty
                      else type_error e "typecheck_exp : wrong binop param 1"
    | (TBool, TBool) -> if (t1 = TBool) && (t2 = TBool) then rty
                      else type_error e "typecheck_exp : wrong binop param 2"
    | _ -> type_error e "typecheck_exp : wrong binop param 3"
    end
  | Uop (unop, e1) ->
    let (t, rty) = typ_of_unop unop in
    begin match (typecheck_exp c e1) with
    | TInt -> if (t = TInt) then rty
              else type_error e1 "typecheck_exp : wrong unop param 1"
    | TBool -> if (t = TBool) then rty
              else type_error e1 "typecheck_exp : wrong unop param 2"
    | _ -> type_error e "typecheck_exp : wrong unop param 3"
    end

  end


(* statements --------------------------------------------------------------- *)

(* return behavior of a statement:
     - NoReturn:  might not return
     - Return: definitely returns
*)
type stmt_type = NoReturn | Return

(* TASK: Typecheck a statement
     - to_ret is the desired return type (from the function declaration

   This function should implement the statment typechecking rules from oat.pdf.

   - In the TYP_IF rule, the "sup" operation is the least-upper-bound operation on the
     lattice of stmt_type values given by the reflexive relation, plus:
           Return <: NoReturn
     Intuitively: if one of the two branches of a conditional does not contain a
     return statement, then the entire conditional statement might not return.

   - You will probably find it convenient to add a helper function that implements the
     block typecheck rules.
*)
let typecheck_lhs (tc: Tctxt.t) (e: Ast.exp node) : Ast.ty =
  begin match e.elt with
  | Id _ | Index _ | Proj _ -> typecheck_exp tc e
  | _ -> type_error e "typecheck_lhs : not lhs expression"
  end

let rec typecheck_stmt (tc : Tctxt.t) (s:Ast.stmt node) (to_ret:ret_ty) : Tctxt.t * stmt_type =
  begin match s.elt with
  | Assn (e1, e2) -> if typecheck_lhs tc e1 = typecheck_exp tc e2
                     then (tc, NoReturn)
                     else type_error s "typecheck_stmt : assignment error"
  | Decl vdecl ->
    if (lookup_local_option (fst vdecl) tc) = None then
    (add_local tc (fst vdecl) (typecheck_exp tc (snd vdecl)), NoReturn)
    else type_error (snd vdecl) "typecheck_stmt : overwrite variable"
  | Ret exp_op ->
    begin match exp_op with
    | None -> if to_ret = RetVoid then (tc, Return) else type_error s "typecheck_stmt : ret void error"
    | Some c ->  if RetVal (typecheck_exp tc c) = to_ret
                 then (tc, Return)
                 else type_error s "typecheck_stmt : ret value error"
    end
  | SCall (e1, el) ->
    begin match typecheck_exp tc e1 with
    | TRef (RFun (tl, RetVoid)) ->
      List.iter2 (fun f t ->
      if (typecheck_exp tc f) = t then ()
      else type_error f "typecheck_stmt : argument type error") el tl;
      (tc, NoReturn)
    | _ -> type_error e1 "typecheck_stmt : scall not function"
    end
  | If (exp, b1, b2) ->
    if ((typecheck_exp tc exp) = TBool) then
      if ((snd (typecheck_block tc b1 to_ret)) = Return)
      && ((snd (typecheck_block tc b2 to_ret)) = Return) then
      (tc, Return)
      else (tc, NoReturn)
    else type_error exp "typecheck_stmt : if condition not bool"
  | For (vl, exp_op, stmt_op, b) ->
    let new_tc = List.fold_left (fun c v -> add_local c (fst v) (typecheck_exp c (snd v))) tc vl in
    let check_block = typecheck_block new_tc b to_ret in
    begin match exp_op, stmt_op with
    | (Some exp, Some stmt) ->
      let stmt_check = typecheck_stmt new_tc stmt to_ret in
      if ((typecheck_exp new_tc exp) = TBool) && ((snd stmt_check) = NoReturn) then
        (tc, NoReturn)
      else type_error s "typecheck_stmt : for loop setup error 1"
    | (Some exp, None) ->
      if (typecheck_exp new_tc exp) = TBool then
        (tc, NoReturn)
      else type_error s "typecheck_stmt : for loop setup error 2"
    | (None, Some stmt) ->
      let stmt_check = typecheck_stmt new_tc stmt to_ret in
      if (snd stmt_check) = NoReturn then
        (tc, NoReturn)
      else type_error s "typecheck_stmt : for loop setup error 1"
    | (None, None) -> (tc, NoReturn)
    end
  | While (exp, b) ->
    let check_block = typecheck_block tc b to_ret in
    if (typecheck_exp tc exp) = TBool then
      (tc, NoReturn)
    else type_error s "typecheck_stmt : while condition type not bool"
  end

and typecheck_block (tc : Tctxt.t) (block : Ast.block) (rty : Ast.ret_ty) =
  begin match block with
  | [] -> (tc, NoReturn)
  | h :: [] ->
    let ret_stmt = typecheck_stmt tc h rty in
    if (snd ret_stmt) = Return then
      (fst ret_stmt, Return)
    else (fst ret_stmt, NoReturn)
  | h :: tl ->
    let st = typecheck_stmt tc h rty in
    if (snd st) = Return then type_error h "typecheck_block : early return"
    else typecheck_block (fst st) tl rty
  end
  (* List.fold_left (fun (c,r) stmt -> if (snd (typecheck_stmt c stmt rty)) = Return
                                    then (fst (typecheck_stmt c stmt rty), Return) else (fst (typecheck_stmt c stmt rty), r))
                                    (tc, NoReturn) block *)


(* well-formed types -------------------------------------------------------- *)
(* TASK: Implement a (set of) functions that check that types are well formed.

    - l is just an ast node that provides source location information for
      generating error messages (it's only needed for type_error

    - tc contains the structure definition context
 *)
let rec typecheck_ty (l : 'a Ast.node) (tc : Tctxt.t) (t : Ast.ty) : unit =
  begin match t with
  | TRef (RStruct id) ->
    begin match (lookup_struct_option id tc) with
    | Some c -> ()
    | None -> type_error l "typecheck_ty : Struct id not found"
    end
  | TRef (RArray ty) -> typecheck_ty l tc ty
  | TRef (RFun (fl, rt)) -> List.iter (fun f -> typecheck_ty l tc f) fl
  | _ -> ()
  end

let typecheck_tdecl (tc : Tctxt.t) l  (loc : 'a Ast.node) =
  List.iter (fun f -> typecheck_ty loc tc f.ftyp) l

(* function declarations ---------------------------------------------------- *)
(* TASK: typecheck a function declaration
    - extends the local context with the types of the formal parameters to the
      function
    - typechecks the body of the function (passing in the expected return type
    - checks that the function actually returns
*)

let typecheck_fdecl (tc : Tctxt.t) (f : Ast.fdecl) (l : 'a Ast.node)  =
  let update_context = List.fold_left (fun c (ty, id) -> Tctxt.add_local c id ty) tc f.args in
  let (tctxt, stmt_type) = typecheck_block update_context f.body f.rtyp in
  if stmt_type = NoReturn then type_error l "typecheck_fdecl : fdecl not return"
  else ()


(* creating the typchecking context ----------------------------------------- *)

(* TASK: Complete the following functions that correspond to the
   judgments that create the global typechecking context.

   create_struct_ctxt: - adds all the struct types to the struct 'S'
   context (checking to see that there are no duplicate fields

   create_function_ctxt: - adds the the function identifiers and their
   types to the 'F' context (ensuring that there are no redeclared
   function identifiers)

   create_global_ctxt: - typechecks the global initializers and adds
   their identifiers to the 'G' global context

   NOTE: global initializers may mention function identifiers as
   constants, but can't mention other global values *)

(* Helper function to look for duplicate field names *)
let rec check_dups fs =
  match fs with
  | [] -> false
  | h :: t -> if List.exists (fun x -> x.fname = h.fname) t then true else check_dups t

let create_struct_ctxt p =
  let ct = Tctxt.empty in
  List.fold_left (fun c d ->
    match d with
    | Gtdecl ({elt=(id, fs)} as l) ->
      if (lookup_struct_option id c) = None
      then if not (check_dups fs)
           then add_struct c id fs
           else type_error l "create_struct_ctxt : duplicate field name"
      else type_error l "create_struct_ctxt : duplicate struct name"
    | _ -> c) ct p

let create_function_ctxt (tc:Tctxt.t) (p:Ast.prog) : Tctxt.t =
  let builtins_context =
    List.fold_left (fun c (id, t) -> Tctxt.add_function c id t) tc builtins
  in
  List.fold_left (fun c d ->
    match d with
    | Gfdecl ({elt=f} as l) ->
      let tl = List.fold_left (fun l e -> l @ [fst e]) [] f.args in
      if (lookup_function_option f.name c) = None
      then add_function c f.name (tl, f.rtyp)
      else type_error l "create_function_ctxt : duplicate function name"
    | _ -> c) builtins_context p


let create_global_ctxt (tc:Tctxt.t) (p:Ast.prog) : Tctxt.t =
List.fold_left (fun c d ->
  match d with
  | Gvdecl ({elt=g} as l) ->
    if (lookup_global_option g.name c) = None
    then
      match g.init.elt with
      | Id i -> if (lookup_global_option) i c = None then
                  add_global c g.name (typecheck_exp c g.init)
                else type_error g.init "create_global_ctxt : scope error"
      | _ -> add_global c g.name (typecheck_exp c g.init)
    else type_error l "create_global_ctxt : duplicate global variable name"
  | _ -> c) tc p

(* typechecks the whole program in the correct global context --------------- *)
(* This function implements the TYP_PROG rule of the oat.pdf specification.
   Note that global initializers are already checked in create_global_ctxt
*)
let typecheck_program (p:Ast.prog) : unit =
  let sc = create_struct_ctxt p in
  let fc = create_function_ctxt sc p in
  let tc = create_global_ctxt fc p in
  List.iter (fun p ->
    match p with
    | Gfdecl ({elt=f} as l) -> typecheck_fdecl tc f l
    | Gtdecl ({elt=(id, fs)} as l) -> typecheck_tdecl tc fs l
    | _ -> ()) p
