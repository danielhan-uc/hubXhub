
module Basics = struct
  
  exception Error
  
  type token = 
    | WHILE
    | VAR
    | UIDENT of (string)
    | TVOID
    | TSTRING
    | TRUE
    | TINT
    | TILDE
    | TBOOL
    | STRUCT
    | STRING of (string)
    | STAR
    | SEMI
    | RPAREN
    | RETURN
    | RBRACKET
    | RBRACE
    | PLUS
    | NULL
    | NEW
    | LTLT
    | LTEQ
    | LT
    | LPAREN
    | LBRACKET
    | LBRACE
    | IOR
    | INT of (int64)
    | IF
    | IDENT of (string)
    | IAND
    | GTGTGT
    | GTGT
    | GTEQ
    | GT
    | GLOBAL
    | FOR
    | FALSE
    | EQEQ
    | EQ
    | EOF
    | ELSE
    | DOT
    | DASH
    | COMMA
    | BAR
    | BANGEQ
    | BANG
    | ARROW
    | AMPER
  
end

include Basics

let _eRR =
  Basics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState238
  | MenhirState236
  | MenhirState231
  | MenhirState229
  | MenhirState223
  | MenhirState216
  | MenhirState211
  | MenhirState209
  | MenhirState201
  | MenhirState199
  | MenhirState197
  | MenhirState193
  | MenhirState186
  | MenhirState179
  | MenhirState173
  | MenhirState169
  | MenhirState164
  | MenhirState161
  | MenhirState156
  | MenhirState154
  | MenhirState150
  | MenhirState148
  | MenhirState142
  | MenhirState140
  | MenhirState138
  | MenhirState133
  | MenhirState131
  | MenhirState127
  | MenhirState125
  | MenhirState123
  | MenhirState122
  | MenhirState117
  | MenhirState114
  | MenhirState111
  | MenhirState102
  | MenhirState100
  | MenhirState97
  | MenhirState86
  | MenhirState84
  | MenhirState82
  | MenhirState80
  | MenhirState78
  | MenhirState76
  | MenhirState74
  | MenhirState72
  | MenhirState70
  | MenhirState68
  | MenhirState66
  | MenhirState64
  | MenhirState62
  | MenhirState60
  | MenhirState58
  | MenhirState54
  | MenhirState51
  | MenhirState49
  | MenhirState44
  | MenhirState40
  | MenhirState39
  | MenhirState32
  | MenhirState27
  | MenhirState25
  | MenhirState23
  | MenhirState20
  | MenhirState17
  | MenhirState15
  | MenhirState13
  | MenhirState12
  | MenhirState10
  | MenhirState8
  | MenhirState5
  | MenhirState0
  
open Ast

let loc (startpos:Lexing.position) (endpos:Lexing.position) (elt:'a) : 'a node =
  { elt ; loc=Range.mk_lex_range startpos endpos }


let rec _menhir_goto_else_stmt : _menhir_env -> 'ttv_tail -> Lexing.position -> (Ast.block) -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _endpos_b2_ = _endpos in
    let (b2 : (Ast.block)) = _v in
    let (((((_menhir_stack, _menhir_s, _startpos__1_), _startpos__2_), _endpos_e_, _, (e : (Ast.exp Ast.node)), _startpos_e_), _endpos__4_), _endpos_b1_, _, (b1 : (Ast.block))) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _1 = () in
    let _endpos = _endpos_b2_ in
    let _v : (Ast.stmt Ast.node) = let _endpos = _endpos_b2_ in
    let _startpos = _startpos__1_ in
        ( loc _startpos _endpos @@ If(e,b1,b2) ) in
    match _menhir_s with
    | MenhirState142 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos_ifs_ = _endpos in
        let (ifs : (Ast.stmt Ast.node)) = _v in
        let _1 = () in
        let _endpos = _endpos_ifs_ in
        let _v : (Ast.block) =                       ( [ ifs ] ) in
        _menhir_goto_else_stmt _menhir_env _menhir_stack _endpos _v
    | MenhirState238 | MenhirState123 | MenhirState179 | MenhirState156 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos_ifs_ = _endpos in
        let (ifs : (Ast.stmt Ast.node)) = _v in
        let _v : (Ast.stmt Ast.node) =                         ( ifs ) in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_reduce36 : _menhir_env -> ((('ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position) * Lexing.position) * _menhir_state * (Ast.exp Ast.node list)) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((((_menhir_stack, _endpos_e_, _menhir_s, (e : (Ast.exp Ast.node)), _startpos_e_), _startpos__2_), _, (xs0 : (Ast.exp Ast.node list))), _endpos__4_) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _startpos = _startpos_e_ in
    let _endpos = _endpos__4_ in
    let _v : (Ast.exp Ast.node) = let es =
      let xs = xs0 in
          ( xs )
    in
    let _endpos = _endpos__4_ in
    let _startpos = _startpos_e_ in
                            ( loc _startpos _endpos @@ Call (e,es) ) in
    _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_goto_separated_nonempty_list_SEMI_gfield_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.cfield list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState199 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Ast.cfield list)) = _v in
        let _v : (Ast.cfield list) =     ( x ) in
        _menhir_goto_loption_separated_nonempty_list_SEMI_gfield__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState223 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Ast.cfield list)) = _v in
        let ((_menhir_stack, _menhir_s, (x : (Ast.cfield))), _endpos__2_) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.cfield list) =     ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_SEMI_gfield_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_COMMA_gexp_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.exp Ast.node list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState211 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Ast.exp Ast.node list)) = _v in
        let _v : (Ast.exp Ast.node list) =     ( x ) in
        _menhir_goto_loption_separated_nonempty_list_COMMA_gexp__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState216 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Ast.exp Ast.node list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (Ast.exp Ast.node))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.exp Ast.node list) =     ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_COMMA_gexp_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_separated_nonempty_list_COMMA_ty__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.ty list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = (_menhir_stack, _endpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LPAREN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TBOOL ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TINT ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TSTRING ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TVOID ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState32 in
                let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_env = _menhir_discard _menhir_env in
                let _menhir_stack = Obj.magic _menhir_stack in
                let _startpos__100_ = _startpos in
                let ((((_menhir_stack, _menhir_s, _startpos__11_), _, (t0 : (Ast.ty)), _startpos_t0_), _, (xs00 : (Ast.ty list))), _endpos__50_) = _menhir_stack in
                let _100 = () in
                let _60 = () in
                let _50 = () in
                let _30 = () in
                let _11 = () in
                let _startpos = _startpos__11_ in
                let _v : (Ast.ty) = let r =
                  let _10 = _100 in
                  let _6 = _60 in
                  let _5 = _50 in
                  let xs0 = xs00 in
                  let _3 = _30 in
                  let t = t0 in
                  let _1 = _11 in
                  let ret =
                    let _1 = _10 in
                               ( RetVoid )
                  in
                  let l =
                    let xs = xs0 in
                        ( xs )
                  in
                         ( RFun (t :: l, ret) )
                in
                           ( TRef r ) in
                _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v _startpos
            | UIDENT _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_list_stmt_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.block) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState179 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (Ast.stmt Ast.node))), _, (xs : (Ast.block))) = _menhir_stack in
        let _v : (Ast.block) =     ( x :: xs ) in
        _menhir_goto_list_stmt_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState123 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos__3_ = _endpos in
            let ((_menhir_stack, _menhir_s), _, (stmts : (Ast.block))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _endpos = _endpos__3_ in
            let _v : (Ast.block) =                                    ( stmts ) in
            let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v) in
            (match _menhir_s with
            | MenhirState127 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((((_menhir_stack, _menhir_s, _startpos__1_), _startpos__2_), _endpos_e_, _, (e : (Ast.exp Ast.node)), _startpos_e_), _endpos__4_), _endpos_b_, _, (b : (Ast.block))) = _menhir_stack in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (Ast.stmt Ast.node) = let _endpos = _endpos_b_ in
                let _startpos = _startpos__1_ in
                                        ( loc _startpos _endpos @@ While(e, b) ) in
                _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
            | MenhirState140 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | ELSE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | IF ->
                        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState142 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | LBRACE ->
                        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState142
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState142)
                | BANG | DASH | EOF | FALSE | FOR | IDENT _ | IF | INT _ | LPAREN | NEW | RBRACE | RETURN | RPAREN | STRING _ | TBOOL | TILDE | TINT | TRUE | TSTRING | UIDENT _ | VAR | WHILE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_, _endpos) = Obj.magic _menhir_stack in
                    let _v : (Ast.block) =                       ( [] ) in
                    _menhir_goto_else_stmt _menhir_env _menhir_stack _endpos _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | MenhirState142 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _endpos_b_, _, (b : (Ast.block))) = _menhir_stack in
                let _1 = () in
                let _endpos = _endpos_b_ in
                let _v : (Ast.block) =                       ( b ) in
                _menhir_goto_else_stmt _menhir_env _menhir_stack _endpos _v
            | MenhirState161 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((((((((_menhir_stack, _menhir_s, _startpos__1_), _startpos__2_), _, (xs0 : (Ast.vdecl list))), _endpos__4_), _, (e : (Ast.exp Ast.node option))), _endpos__6_), _, (s : (Ast.stmt Ast.node option))), _endpos__8_), _endpos_b_, _, (b : (Ast.block))) = _menhir_stack in
                let _8 = () in
                let _6 = () in
                let _4 = () in
                let _2 = () in
                let _1 = () in
                let _v : (Ast.stmt Ast.node) = let ds =
                  let xs = xs0 in
                      ( xs )
                in
                let _endpos = _endpos_b_ in
                let _startpos = _startpos__1_ in
                                        ( loc _startpos _endpos @@ For(ds,e,s,b) ) in
                _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
            | MenhirState122 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((((((_menhir_stack, _menhir_s, _startpos__10_), _endpos_name_, (name : (string)), _startpos_name_), _startpos__3_), _, (args : ((Ast.ty * Ast.id) list))), _endpos__5_), _endpos_body_, _, (body : (Ast.block))) = _menhir_stack in
                let _5 = () in
                let _3 = () in
                let _10 = () in
                let _v : (Ast.decl) = let rtyp =
                  let _1 = _10 in
                             ( RetVoid )
                in
                let _startpos_rtyp_ = _startpos__10_ in
                let _endpos = _endpos_body_ in
                let _startpos = _startpos_rtyp_ in
                    ( Gfdecl (loc _startpos _endpos { rtyp; name; args; body }) ) in
                _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v
            | MenhirState231 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((((((_menhir_stack, _menhir_s, (t0 : (Ast.ty)), _startpos_t0_), _endpos_name_, (name : (string)), _startpos_name_), _startpos__3_), _, (args : ((Ast.ty * Ast.id) list))), _endpos__5_), _endpos_body_, _, (body : (Ast.block))) = _menhir_stack in
                let _5 = () in
                let _3 = () in
                let _v : (Ast.decl) = let rtyp =
                  let t = t0 in
                             ( RetVal t )
                in
                let _startpos_rtyp_ = _startpos_t0_ in
                let _endpos = _endpos_body_ in
                let _startpos = _startpos_rtyp_ in
                    ( Gfdecl (loc _startpos _endpos { rtyp; name; args; body }) ) in
                _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                _menhir_fail ())
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_separated_nonempty_list_COMMA_exp__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.exp Ast.node list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce36 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState102 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos__7_ = _endpos in
            let ((((_menhir_stack, _menhir_s, _startpos__1_), _, (t : (Ast.ty)), _startpos_t_), _endpos__4_, _), _, (xs0 : (Ast.exp Ast.node list))) = _menhir_stack in
            let _7 = () in
            let _5 = () in
            let _4 = () in
            let _3 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__7_ in
            let _v : (Ast.exp Ast.node) = let cs =
              let xs = xs0 in
                  ( xs )
            in
            let _endpos = _endpos__7_ in
            let _startpos = _startpos__1_ in
                                    ( loc _startpos _endpos @@ CArr (t, cs) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState169 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | SEMI ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_env = _menhir_discard _menhir_env in
                let _menhir_stack = Obj.magic _menhir_stack in
                let _endpos__5_ = _endpos in
                let ((((_menhir_stack, _endpos_e_, _menhir_s, (e : (Ast.exp Ast.node)), _startpos_e_), _startpos__2_), _, (xs0 : (Ast.exp Ast.node list))), _endpos__4_) = _menhir_stack in
                let _5 = () in
                let _4 = () in
                let _2 = () in
                let _v : (Ast.stmt Ast.node) = let es =
                  let xs = xs0 in
                      ( xs )
                in
                let _endpos = _endpos__5_ in
                let _startpos = _startpos_e_ in
                                        ( loc _startpos _endpos @@ SCall (e, es) ) in
                _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
            | AMPER | BANGEQ | BAR | DASH | DOT | EQEQ | GT | GTEQ | GTGT | GTGTGT | IAND | IOR | LBRACKET | LPAREN | LT | LTEQ | LTLT | PLUS | STAR ->
                _menhir_reduce36 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_separated_nonempty_list_COMMA_pair_ty_IDENT___ : _menhir_env -> 'ttv_tail -> _menhir_state -> ((Ast.ty * Ast.id) list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (xs0 : ((Ast.ty * Ast.id) list)) = _v in
    let _v : ((Ast.ty * Ast.id) list) = let l =
      let xs = xs0 in
          ( xs )
    in
                                                ( l ) in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState114 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LBRACE ->
                _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState122
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState229 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LBRACE ->
                _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState231)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_decl : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.decl) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | GLOBAL ->
        _menhir_run195 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRUCT ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TVOID ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | EOF ->
        _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState236
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState236

and _menhir_goto_loption_separated_nonempty_list_SEMI_gfield__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.cfield list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RBRACE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos__4_ = _endpos in
        let ((_menhir_stack, _menhir_s, (i : (string)), _startpos_i_), _, (xs0 : (Ast.cfield list))) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : (Ast.exp Ast.node) = let fs =
          let xs = xs0 in
              ( xs )
        in
        let _endpos = _endpos__4_ in
        let _startpos = _startpos_i_ in
                       ( loc _startpos _endpos @@ CStruct (i, fs) ) in
        _menhir_goto_gexp _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run200 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (string) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQ ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | FALSE ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState201 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState201 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState201 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState201 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | STRING _v ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState201 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TBOOL ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState201 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TINT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState201 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState201 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TSTRING ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState201 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | UIDENT _v ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState201 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState201)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_gexp : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.exp Ast.node) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState216 | MenhirState211 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | FALSE ->
                _menhir_run206 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState216 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run205 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState216 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run204 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState216 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRING _v ->
                _menhir_run203 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState216 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TBOOL ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TINT ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run202 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState216 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TSTRING ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | UIDENT _v ->
                _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState216)
        | RBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (Ast.exp Ast.node))) = _menhir_stack in
            let _v : (Ast.exp Ast.node list) =     ( [ x ] ) in
            _menhir_goto_separated_nonempty_list_COMMA_gexp_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState201 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _endpos_id_, _menhir_s, (id : (string)), _startpos_id_), _, (e : (Ast.exp Ast.node))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.cfield) =                        ( { cfname = id; cfinit = e } ) in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | IDENT _v ->
                _menhir_run200 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState223 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState223)
        | RBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (Ast.cfield))) = _menhir_stack in
            let _v : (Ast.cfield list) =     ( [ x ] ) in
            _menhir_goto_separated_nonempty_list_SEMI_gfield_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState197 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos__5_ = _endpos in
            let (((_menhir_stack, _menhir_s, _startpos__1_), _endpos_name_, (name : (string)), _startpos_name_), _, (init : (Ast.exp Ast.node))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.decl) = let _endpos = _endpos__5_ in
            let _startpos = _startpos__1_ in
                ( Gvdecl (loc _startpos _endpos { name; init }) ) in
            _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_separated_nonempty_list_COMMA_gexp__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.exp Ast.node list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RBRACE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos__6_ = _endpos in
        let (((_menhir_stack, _menhir_s, (t : (Ast.ty)), _startpos_t_), _endpos__3_, _), _, (xs0 : (Ast.exp Ast.node list))) = _menhir_stack in
        let _6 = () in
        let _4 = () in
        let _3 = () in
        let _2 = () in
        let _v : (Ast.exp Ast.node) = let cs =
          let xs = xs0 in
              ( xs )
        in
        let _endpos = _endpos__6_ in
        let _startpos = _startpos_t_ in
                       ( loc _startpos _endpos @@ CArr (t, cs) ) in
        _menhir_goto_gexp _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_separated_nonempty_list_SEMI_decl_field_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.field list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState186 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Ast.field list)) = _v in
        let _v : (Ast.field list) =     ( x ) in
        _menhir_goto_loption_separated_nonempty_list_SEMI_decl_field__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState193 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Ast.field list)) = _v in
        let ((_menhir_stack, _menhir_s, (x : (Ast.field))), _endpos__2_) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.field list) =     ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_SEMI_decl_field_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_COMMA_pair_ty_IDENT__ : _menhir_env -> 'ttv_tail -> _menhir_state -> ((Ast.ty * Ast.id) list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState117 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : ((Ast.ty * Ast.id) list)) = _v in
        let ((_menhir_stack, _menhir_s, (x0 : (Ast.ty)), _startpos_x0_), _endpos_y0_, (y0 : (string)), _startpos_y0_) = _menhir_stack in
        let _2 = () in
        let _v : ((Ast.ty * Ast.id) list) = let x =
          let y = y0 in
          let x = x0 in
              ( (x, y) )
        in
            ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_COMMA_pair_ty_IDENT__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState229 | MenhirState114 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : ((Ast.ty * Ast.id) list)) = _v in
        let _v : ((Ast.ty * Ast.id) list) =     ( x ) in
        _menhir_goto_loption_separated_nonempty_list_COMMA_pair_ty_IDENT___ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_reduce112 : _menhir_env -> (('ttv_tail * _menhir_state * (Ast.ty) * Lexing.position)) * Lexing.position * _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _menhir_s, (t0 : (Ast.ty)), _startpos_t0_), _endpos__30_, _) = _menhir_stack in
    let _30 = () in
    let _20 = () in
    let _startpos = _startpos_t0_ in
    let _v : (Ast.ty) = let r =
      let _3 = _30 in
      let _2 = _20 in
      let t = t0 in
                                 ( RArray t )
    in
               ( TRef r ) in
    _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_run42 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.ty) * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _endpos__2_ = _endpos in
    let (_menhir_stack, _menhir_s, (t : (Ast.ty)), _startpos_t_) = _menhir_stack in
    let _2 = () in
    let _startpos = _startpos_t_ in
    let _endpos = _endpos__2_ in
    let _v : (Ast.exp Ast.node) = let _endpos = _endpos__2_ in
    let _startpos = _startpos_t_ in
                            ( loc _startpos _endpos @@ CNull t ) in
    _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_goto_separated_nonempty_list_COMMA_ty_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.ty list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Ast.ty list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (Ast.ty)), _startpos_x_) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.ty list) =     ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_COMMA_ty_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Ast.ty list)) = _v in
        let _v : (Ast.ty list) =     ( x ) in
        _menhir_goto_loption_separated_nonempty_list_COMMA_ty__ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run19 : _menhir_env -> ('ttv_tail * _menhir_state * Lexing.position) * _menhir_state * (Ast.ty) * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos ->
    let _menhir_stack = (_menhir_stack, _endpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARROW ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LPAREN ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TBOOL ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TINT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TSTRING ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TVOID ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState20 in
            let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _startpos__100_ = _startpos in
            let (((_menhir_stack, _menhir_s, _startpos__11_), _, (t0 : (Ast.ty)), _startpos_t0_), _endpos__30_) = _menhir_stack in
            let _100 = () in
            let _40 = () in
            let _30 = () in
            let _11 = () in
            let _startpos = _startpos__11_ in
            let _v : (Ast.ty) = let r =
              let _10 = _100 in
              let _4 = _40 in
              let _3 = _30 in
              let t = t0 in
              let _1 = _11 in
              let ret =
                let _1 = _10 in
                           ( RetVoid )
              in
                                                      ( RFun ([t], ret) )
            in
                       ( TRef r ) in
            _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v _startpos
        | UIDENT _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20)
    | COMMA | IDENT _ | LBRACKET | NULL | RPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, _startpos__1_), _, (t : (Ast.ty)), _startpos_t_), _endpos__3_) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _startpos = _startpos__1_ in
        let _v : (Ast.ty) =                        ( t ) in
        _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v _startpos
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run23 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.ty) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RBRACKET ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_s = MenhirState23 in
        let _menhir_stack = (_menhir_stack, _endpos, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce112 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run25 : _menhir_env -> ('ttv_tail * _menhir_state * Lexing.position) * _menhir_state * (Ast.ty) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState25 in
        let _v : (Ast.ty list) =     ( [] ) in
        _menhir_goto_loption_separated_nonempty_list_COMMA_ty__ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_reduce62 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.block) =     ( [] ) in
    _menhir_goto_list_stmt_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_option_stmt_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.stmt Ast.node option) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = (_menhir_stack, _endpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACE ->
            _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState161)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_option_exp_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.exp Ast.node option) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMI ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = (_menhir_stack, _endpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BANG ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DASH ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FALSE ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FOR ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run146 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IF ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NEW ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RETURN ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | STRING _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TBOOL ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TILDE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TINT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TSTRING ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | UIDENT _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | VAR ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | WHILE ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState156 in
            let _v : (Ast.stmt Ast.node option) =     ( None ) in
            _menhir_goto_option_stmt_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState156)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce64 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.exp Ast.node list) =     ( [] ) in
    _menhir_goto_loption_separated_nonempty_list_COMMA_exp__ _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce43 : _menhir_env -> (('ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position)) * Lexing.position * (string) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let ((_menhir_stack, _endpos_e_, _menhir_s, (e : (Ast.exp Ast.node)), _startpos_e_), _endpos_id_, (id : (string)), _startpos_id_) = _menhir_stack in
    let _2 = () in
    let _startpos = _startpos_e_ in
    let _endpos = _endpos_id_ in
    let _v : (Ast.exp Ast.node) = let _endpos = _endpos_id_ in
    let _startpos = _startpos_e_ in
                            ( loc _startpos _endpos @@ Proj(e, id) ) in
    _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_separated_nonempty_list_COMMA_vdecl_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.vdecl list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState150 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Ast.vdecl list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (Ast.vdecl)), _startpos_x_) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.vdecl list) =     ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_COMMA_vdecl_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState148 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Ast.vdecl list)) = _v in
        let _v : (Ast.vdecl list) =     ( x ) in
        _menhir_goto_loption_separated_nonempty_list_COMMA_vdecl__ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run123 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState123 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FOR ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run146 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState123 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IF ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState123 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RETURN ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState123 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState123 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | VAR ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | WHILE ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RBRACE ->
        _menhir_reduce62 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123

and _menhir_goto_separated_nonempty_list_SEMI_field_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.cfield list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Ast.cfield list)) = _v in
        let _v : (Ast.cfield list) =     ( x ) in
        _menhir_goto_loption_separated_nonempty_list_SEMI_field__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState97 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Ast.cfield list)) = _v in
        let ((_menhir_stack, _menhir_s, (x : (Ast.cfield))), _endpos__2_) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.cfield list) =     ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_SEMI_field_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_reduce35 : _menhir_env -> ((('ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position)) * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _endpos_e_, _menhir_s, (e : (Ast.exp Ast.node)), _startpos_e_), _endpos_i_, _, (i : (Ast.exp Ast.node)), _startpos_i_), _endpos__4_) = _menhir_stack in
    let _4 = () in
    let _2 = () in
    let _startpos = _startpos_e_ in
    let _endpos = _endpos__4_ in
    let _v : (Ast.exp Ast.node) = let _endpos = _endpos__4_ in
    let _startpos = _startpos_e_ in
                            ( loc _startpos _endpos @@ Index (e, i) ) in
    _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_goto_separated_nonempty_list_COMMA_exp_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.exp Ast.node list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState169 | MenhirState102 | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Ast.exp Ast.node list)) = _v in
        let _v : (Ast.exp Ast.node list) =     ( x ) in
        _menhir_goto_loption_separated_nonempty_list_COMMA_exp__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState86 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Ast.exp Ast.node list)) = _v in
        let (_menhir_stack, _endpos_x_, _menhir_s, (x : (Ast.exp Ast.node)), _startpos_x_) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.exp Ast.node list) =     ( x :: xs ) in
        _menhir_goto_separated_nonempty_list_COMMA_exp_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run49 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState49 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState49 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState49 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState49 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState49 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49

and _menhir_run54 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState54 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState54 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState54 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54

and _menhir_run58 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState58 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState58 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState58 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState58 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState58 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58

and _menhir_run62 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState62 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState62 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState62 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62

and _menhir_run68 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState68 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState68 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState68 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68

and _menhir_run70 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState70 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState70 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState70 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70

and _menhir_run72 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72

and _menhir_run64 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState64 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState64 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState64 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64

and _menhir_run66 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66

and _menhir_run74 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState74 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState74 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState74 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74

and _menhir_run76 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState76 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState76 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState76 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76

and _menhir_run78 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState78 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState78 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState78 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78

and _menhir_run56 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce43 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run60 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_stack = (_menhir_stack, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState60 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState60 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState60 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60

and _menhir_run80 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState80 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState80 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState80 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80

and _menhir_run82 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82

and _menhir_run84 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState84 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState84 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState84 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState84 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState84 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84

and _menhir_run44 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _startpos ->
    let _menhir_stack = (_menhir_stack, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState44 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState44 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState44 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RPAREN ->
        _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44

and _menhir_run51 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (Ast.exp Ast.node) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState51 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState51 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState51 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51

and _menhir_goto_list_decl_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.prog) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState111 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (p : (Ast.prog))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.prog) =                       ( p ) in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (Ast.prog)) = _v in
            Obj.magic _1
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState236 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (Ast.decl))), _, (xs : (Ast.prog))) = _menhir_stack in
        let _v : (Ast.prog) =     ( x :: xs ) in
        _menhir_goto_list_decl_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_reduce68 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : ((Ast.ty * Ast.id) list) =     ( [] ) in
    _menhir_goto_loption_separated_nonempty_list_COMMA_pair_ty_IDENT___ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_loption_separated_nonempty_list_SEMI_decl_field__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.field list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RBRACE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos__5_ = _endpos in
        let (((_menhir_stack, _menhir_s, _startpos__1_), (name : (string)), _startpos_name_), _, (xs0 : (Ast.field list))) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : (Ast.decl) = let fs =
          let xs = xs0 in
              ( xs )
        in
        let _endpos = _endpos__5_ in
        let _startpos = _startpos__1_ in
            ( Gtdecl (loc _startpos _endpos (name, fs)) ) in
        _menhir_goto_decl _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run198 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LBRACE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState199 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState199 in
            let _v : (Ast.cfield list) =     ( [] ) in
            _menhir_goto_loption_separated_nonempty_list_SEMI_gfield__ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState199)
    | LBRACKET | NULL ->
        _menhir_reduce113 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run202 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _endpos__1_ = _endpos in
    let _startpos__1_ = _startpos in
    let _1 = () in
    let _v : (Ast.exp Ast.node) = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
                   ( loc _startpos _endpos @@ CBool true ) in
    _menhir_goto_gexp _menhir_env _menhir_stack _menhir_s _v

and _menhir_run203 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (string) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _endpos_s_ = _endpos in
    let (s : (string)) = _v in
    let _startpos_s_ = _startpos in
    let _v : (Ast.exp Ast.node) = let _endpos = _endpos_s_ in
    let _startpos = _startpos_s_ in
                   ( loc _startpos _endpos @@ CStr s ) in
    _menhir_goto_gexp _menhir_env _menhir_stack _menhir_s _v

and _menhir_run204 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (int64) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _endpos_i_ = _endpos in
    let (i : (int64)) = _v in
    let _startpos_i_ = _startpos in
    let _v : (Ast.exp Ast.node) = let _endpos = _endpos_i_ in
    let _startpos = _startpos_i_ in
                   ( loc _startpos _endpos @@ CInt i ) in
    _menhir_goto_gexp _menhir_env _menhir_stack _menhir_s _v

and _menhir_run205 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (string) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _endpos_id_ = _endpos in
    let (id : (string)) = _v in
    let _startpos_id_ = _startpos in
    let _v : (Ast.exp Ast.node) = let _endpos = _endpos_id_ in
    let _startpos = _startpos_id_ in
                 (loc _startpos _endpos @@ Id id ) in
    _menhir_goto_gexp _menhir_env _menhir_stack _menhir_s _v

and _menhir_run206 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _endpos__1_ = _endpos in
    let _startpos__1_ = _startpos in
    let _1 = () in
    let _v : (Ast.exp Ast.node) = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
                   ( loc _startpos _endpos @@ CBool false ) in
    _menhir_goto_gexp _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_ty : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.ty) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | IDENT _ | NULL | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s, _startpos__10_), _, (t1 : (Ast.ty)), _startpos_t1_), _endpos__30_), _, (t00 : (Ast.ty)), _startpos_t00_) = _menhir_stack in
            let _40 = () in
            let _30 = () in
            let _10 = () in
            let _startpos = _startpos__10_ in
            let _v : (Ast.ty) = let r =
              let t0 = t00 in
              let _4 = _40 in
              let _3 = _30 in
              let t = t1 in
              let _1 = _10 in
              let ret =
                let t = t0 in
                           ( RetVal t )
              in
                                                      ( RFun ([t], ret) )
            in
                       ( TRef r ) in
            _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState27 | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LPAREN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TBOOL ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TINT ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TSTRING ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | UIDENT _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27)
        | LBRACKET ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (Ast.ty)), _startpos_x_) = _menhir_stack in
            let _v : (Ast.ty list) =     ( [ x ] ) in
            _menhir_goto_separated_nonempty_list_COMMA_ty_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | IDENT _ | NULL | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((((_menhir_stack, _menhir_s, _startpos__10_), _, (t1 : (Ast.ty)), _startpos_t1_), _, (xs00 : (Ast.ty list))), _endpos__50_), _, (t00 : (Ast.ty)), _startpos_t00_) = _menhir_stack in
            let _60 = () in
            let _50 = () in
            let _30 = () in
            let _10 = () in
            let _startpos = _startpos__10_ in
            let _v : (Ast.ty) = let r =
              let t0 = t00 in
              let _6 = _60 in
              let _5 = _50 in
              let xs0 = xs00 in
              let _3 = _30 in
              let t = t1 in
              let _1 = _10 in
              let ret =
                let t = t0 in
                           ( RetVal t )
              in
              let l =
                let xs = xs0 in
                    ( xs )
              in
                     ( RFun (t :: l, ret) )
            in
                       ( TRef r ) in
            _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | IDENT _ | NULL | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, _startpos__10_), _endpos__20_, _), _, (t00 : (Ast.ty)), _startpos_t00_) = _menhir_stack in
            let _30 = () in
            let _20 = () in
            let _10 = () in
            let _startpos = _startpos__10_ in
            let _v : (Ast.ty) = let r =
              let t0 = t00 in
              let _3 = _30 in
              let _2 = _20 in
              let _1 = _10 in
              let ret =
                let t = t0 in
                           ( RetVal t )
              in
                                                 ( RFun ([], ret) )
            in
                       ( TRef r ) in
            _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState238 | MenhirState179 | MenhirState123 | MenhirState173 | MenhirState169 | MenhirState164 | MenhirState156 | MenhirState154 | MenhirState138 | MenhirState133 | MenhirState131 | MenhirState125 | MenhirState0 | MenhirState5 | MenhirState100 | MenhirState102 | MenhirState12 | MenhirState39 | MenhirState86 | MenhirState84 | MenhirState82 | MenhirState80 | MenhirState78 | MenhirState76 | MenhirState74 | MenhirState72 | MenhirState70 | MenhirState68 | MenhirState66 | MenhirState64 | MenhirState62 | MenhirState60 | MenhirState58 | MenhirState54 | MenhirState51 | MenhirState49 | MenhirState44 | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | NULL ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | NULL ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p
        | RPAREN ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | DASH ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState100 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState100 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState100 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RBRACKET ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_s = MenhirState100 in
                let _menhir_stack = (_menhir_stack, _endpos, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | LBRACE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | BANG ->
                        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | DASH ->
                        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | FALSE ->
                        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState102 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | IDENT _v ->
                        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState102 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | INT _v ->
                        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState102 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | LPAREN ->
                        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | NEW ->
                        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | STRING _v ->
                        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState102 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | TBOOL ->
                        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | TILDE ->
                        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | TINT ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | TRUE ->
                        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState102 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | TSTRING ->
                        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | UIDENT _v ->
                        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | RBRACE ->
                        _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState102
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102)
                | LBRACKET ->
                    _menhir_reduce112 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _, _menhir_s) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | STRING _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState100 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TBOOL ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TILDE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TINT ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState100 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TSTRING ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | UIDENT _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState229 | MenhirState117 | MenhirState114 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | LPAREN ->
                    _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState117 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | TBOOL ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState117 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | TINT ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState117 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | TSTRING ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState117 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | UIDENT _v ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState117 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState117)
            | RPAREN ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, (x0 : (Ast.ty)), _startpos_x0_), _endpos_y0_, (y0 : (string)), _startpos_y0_) = _menhir_stack in
                let _v : ((Ast.ty * Ast.id) list) = let x =
                  let y = y0 in
                  let x = x0 in
                      ( (x, y) )
                in
                    ( [ x ] ) in
                _menhir_goto_separated_nonempty_list_COMMA_pair_ty_IDENT__ _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _, _), _, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | LBRACKET ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState193 | MenhirState186 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos_id_ = _endpos in
            let (id : (string)) = _v in
            let _startpos_id_ = _startpos in
            let (_menhir_stack, _menhir_s, (t : (Ast.ty)), _startpos_t_) = _menhir_stack in
            let _v : (Ast.field) =                   ( { fname=id; ftyp=t } ) in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | SEMI ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = (_menhir_stack, _endpos) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | LPAREN ->
                    _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | TBOOL ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | TINT ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | TSTRING ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | UIDENT _v ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState193)
            | RBRACE ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, (x : (Ast.field))) = _menhir_stack in
                let _v : (Ast.field list) =     ( [ x ] ) in
                _menhir_goto_separated_nonempty_list_SEMI_decl_field_ _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | LBRACKET ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState197 | MenhirState216 | MenhirState211 | MenhirState201 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | RBRACKET ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_s = MenhirState209 in
                let _menhir_stack = (_menhir_stack, _endpos, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | LBRACE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | FALSE ->
                        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | IDENT _v ->
                        _menhir_run205 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState211 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | INT _v ->
                        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState211 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | LPAREN ->
                        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | STRING _v ->
                        _menhir_run203 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState211 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | TBOOL ->
                        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | TINT ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | TRUE ->
                        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | TSTRING ->
                        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | UIDENT _v ->
                        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | RBRACE ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_s = MenhirState211 in
                        let _v : (Ast.exp Ast.node list) =     ( [] ) in
                        _menhir_goto_loption_separated_nonempty_list_COMMA_gexp__ _menhir_env _menhir_stack _menhir_s _v
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState211)
                | LBRACKET | NULL ->
                    _menhir_reduce112 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _, _menhir_s) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState209)
        | NULL ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos__2_ = _endpos in
            let (_menhir_stack, _menhir_s, (t : (Ast.ty)), _startpos_t_) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.exp Ast.node) = let _endpos = _endpos__2_ in
            let _startpos = _startpos_t_ in
                           ( loc _startpos _endpos @@ CNull t ) in
            _menhir_goto_gexp _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState236 | MenhirState111 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IDENT _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LPAREN ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = (_menhir_stack, _startpos) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | LPAREN ->
                    _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState229 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | TBOOL ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState229 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | TINT ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState229 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | TSTRING ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState229 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | UIDENT _v ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState229 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | RPAREN ->
                    _menhir_reduce68 _menhir_env (Obj.magic _menhir_stack) MenhirState229
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState229)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _, _), _, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | LBRACKET ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stmt : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.stmt Ast.node) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState156 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (Ast.stmt Ast.node))) = _menhir_stack in
        let _v : (Ast.stmt Ast.node option) =     ( Some x ) in
        _menhir_goto_option_stmt_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState179 | MenhirState123 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BANG ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DASH ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FALSE ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FOR ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run146 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState179 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IF ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState179 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NEW ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RETURN ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | STRING _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState179 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TBOOL ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TILDE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TINT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TSTRING ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | UIDENT _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | VAR ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | WHILE ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | RBRACE ->
            _menhir_reduce62 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState179)
    | MenhirState238 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (s : (Ast.stmt Ast.node))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.stmt Ast.node) =                ( s ) in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (Ast.stmt Ast.node)) = _v in
            Obj.magic _1
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_reduce113 : _menhir_env -> 'ttv_tail * _menhir_state * (string) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (id0 : (string)), _startpos_id0_) = _menhir_stack in
    let _startpos = _startpos_id0_ in
    let _v : (Ast.ty) = let r =
      let id = id0 in
                    ( RStruct id )
    in
               ( TRef r ) in
    _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_goto_loption_separated_nonempty_list_SEMI_field__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.cfield list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RBRACE ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos__5_ = _endpos in
        let (((_menhir_stack, _menhir_s, _startpos__1_), _, (t : (string)), _startpos_t_), _, (xs0 : (Ast.cfield list))) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__5_ in
        let _v : (Ast.exp Ast.node) = let cs =
          let xs = xs0 in
              ( xs )
        in
        let _endpos = _endpos__5_ in
        let _startpos = _startpos__1_ in
                                ( loc _startpos _endpos @@ CStruct(t, cs) ) in
        _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run11 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (string) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQ ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BANG ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DASH ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FALSE ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState12 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState12 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState12 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NEW ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | STRING _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState12 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TBOOL ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TILDE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TINT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState12 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TSTRING ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | UIDENT _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run14 : _menhir_env -> 'ttv_tail * _menhir_state * Lexing.position -> Lexing.position -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARROW ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LPAREN ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TBOOL ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TINT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TSTRING ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TVOID ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState15 in
            let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _startpos__100_ = _startpos in
            let ((_menhir_stack, _menhir_s, _startpos__11_), _endpos__20_, _) = _menhir_stack in
            let _100 = () in
            let _30 = () in
            let _20 = () in
            let _11 = () in
            let _startpos = _startpos__11_ in
            let _v : (Ast.ty) = let r =
              let _10 = _100 in
              let _3 = _30 in
              let _2 = _20 in
              let _1 = _11 in
              let ret =
                let _1 = _10 in
                           ( RetVoid )
              in
                                                 ( RFun ([], ret) )
            in
                       ( TRef r ) in
            _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v _startpos
        | UIDENT _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_reduce34 : _menhir_env -> 'ttv_tail * Lexing.position * _menhir_state * (string) * Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _endpos_id_, _menhir_s, (id : (string)), _startpos_id_) = _menhir_stack in
    let _startpos = _startpos_id_ in
    let _endpos = _endpos_id_ in
    let _v : (Ast.exp Ast.node) = let _endpos = _endpos_id_ in
    let _startpos = _startpos_id_ in
                            ( loc _startpos _endpos @@ Id id ) in
    _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_goto_lhs : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.exp Ast.node) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQ ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BANG ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DASH ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FALSE ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState164 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState164 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState164 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NEW ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | STRING _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState164 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TBOOL ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TILDE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TINT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState164 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TSTRING ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | UIDENT _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState164)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_loption_separated_nonempty_list_COMMA_vdecl__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.vdecl list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SEMI ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = (_menhir_stack, _endpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BANG ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DASH ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FALSE ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState154 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState154 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState154 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NEW ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | STRING _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState154 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TBOOL ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TILDE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TINT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState154 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TSTRING ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | UIDENT _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState154 in
            let _v : (Ast.exp Ast.node option) =     ( None ) in
            _menhir_goto_option_exp_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState154)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (Ast.exp Ast.node) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    match _menhir_s with
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AMPER | BANGEQ | BAR | COMMA | DASH | DOT | EOF | EQEQ | GT | GTEQ | GTGT | GTGTGT | IAND | IOR | LT | LTEQ | LTLT | PLUS | RBRACE | RBRACKET | RPAREN | SEMI | STAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, _startpos__10_), _endpos_e_, _, (e : (Ast.exp Ast.node)), _startpos_e_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos__10_ in
            let _endpos = _endpos_e_ in
            let _v : (Ast.exp Ast.node) = let u =
              let _1 = _10 in
                        ( Lognot )
            in
            let _startpos_u_ = _startpos__10_ in
            let _endpos = _endpos_e_ in
            let _startpos = _startpos_u_ in
                                    ( loc _startpos _endpos @@ Uop (u, e) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState169 | MenhirState102 | MenhirState86 | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | DASH ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState86 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState86 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState86 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRING _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState86 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TBOOL ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TILDE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TINT ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState86 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TSTRING ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | UIDENT _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState86)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | IAND ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | IOR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | RBRACE | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _endpos_x_, _menhir_s, (x : (Ast.exp Ast.node)), _startpos_x_) = _menhir_stack in
            let _v : (Ast.exp Ast.node list) =     ( [ x ] ) in
            _menhir_goto_separated_nonempty_list_COMMA_exp_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AMPER | BANGEQ | BAR | COMMA | DASH | EOF | EQEQ | GT | GTEQ | GTGT | GTGTGT | IAND | IOR | LT | LTEQ | LTLT | PLUS | RBRACE | RBRACKET | RPAREN | SEMI | STAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( Mul )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | IAND ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | IOR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | RBRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | AMPER | BANGEQ | BAR | COMMA | DASH | EOF | EQEQ | GT | GTEQ | GTGT | GTGTGT | IAND | IOR | LT | LTEQ | LTLT | PLUS | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( Add )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | AMPER | BANGEQ | BAR | COMMA | EOF | EQEQ | GT | GTEQ | GTGT | GTGTGT | IAND | IOR | LT | LTEQ | LTLT | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( Shl )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState60 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | AMPER | BANGEQ | BAR | COMMA | DASH | EOF | EQEQ | GT | GTEQ | GTGT | GTGTGT | IAND | IOR | LT | LTEQ | LTLT | PLUS | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _startpos__10_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( Sub )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | AMPER | BANGEQ | BAR | COMMA | EOF | EQEQ | GT | GTEQ | IAND | IOR | LT | LTEQ | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( Lte )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState64 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | AMPER | BANGEQ | BAR | COMMA | EOF | EQEQ | GT | GTEQ | GTGT | GTGTGT | IAND | IOR | LT | LTEQ | LTLT | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( Sar )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState66 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | AMPER | BANGEQ | BAR | COMMA | EOF | EQEQ | GT | GTEQ | GTGT | GTGTGT | IAND | IOR | LT | LTEQ | LTLT | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( Shr )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | AMPER | BANGEQ | BAR | COMMA | EOF | EQEQ | GT | GTEQ | IAND | IOR | LT | LTEQ | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( Lt )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | IAND ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | EOF | IOR | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( IOr )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | EOF | IAND | IOR | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( IAnd )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState74 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | AMPER | BANGEQ | BAR | COMMA | EOF | EQEQ | GT | GTEQ | IAND | IOR | LT | LTEQ | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( Gte )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState76 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | AMPER | BANGEQ | BAR | COMMA | EOF | EQEQ | GT | GTEQ | IAND | IOR | LT | LTEQ | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( Gt )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | AMPER | BANGEQ | BAR | COMMA | EOF | EQEQ | IAND | IOR | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( Eq )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState80 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | BAR | COMMA | EOF | IAND | IOR | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( Or )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | AMPER | BANGEQ | BAR | COMMA | EOF | EQEQ | IAND | IOR | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( Neq )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState84 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | AMPER | BAR | COMMA | EOF | IAND | IOR | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_e1_, _menhir_s, (e1 : (Ast.exp Ast.node)), _startpos_e1_), _endpos_e2_, _, (e2 : (Ast.exp Ast.node)), _startpos_e2_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos_e1_ in
            let _endpos = _endpos_e2_ in
            let _v : (Ast.exp Ast.node) = let b =
              let _1 = _10 in
                         ( And )
            in
            let _endpos = _endpos_e2_ in
            let _startpos = _startpos_e1_ in
                                    ( loc _startpos _endpos @@ Bop (b, e1, e2) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | AMPER | BANGEQ | BAR | COMMA | DASH | EOF | EQEQ | GT | GTEQ | GTGT | GTGTGT | IAND | IOR | LT | LTEQ | LTLT | PLUS | RBRACE | RBRACKET | RPAREN | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, _startpos__10_), _endpos_e_, _, (e : (Ast.exp Ast.node)), _startpos_e_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos__10_ in
            let _endpos = _endpos_e_ in
            let _v : (Ast.exp Ast.node) = let u =
              let _1 = _10 in
                        ( Neg )
            in
            let _startpos_u_ = _startpos__10_ in
            let _endpos = _endpos_e_ in
            let _startpos = _startpos_u_ in
                                    ( loc _startpos _endpos @@ Uop (u, e) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | IAND ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | IOR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos__3_ = _endpos in
            let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos_e_, _, (e : (Ast.exp Ast.node)), _startpos_e_) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__3_ in
            let _v : (Ast.exp Ast.node) =                         ( e ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | IAND ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | IOR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | RBRACE | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _endpos_id_, _menhir_s, (id : (string)), _startpos_id_), _endpos_e_, _, (e : (Ast.exp Ast.node)), _startpos_e_) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.cfield) =                       ( { cfname = id; cfinit = e } ) in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_stack = Obj.magic _menhir_stack in
            assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | SEMI ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = (_menhir_stack, _endpos) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | IDENT _v ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState97 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97)
            | RBRACE ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, (x : (Ast.cfield))) = _menhir_stack in
                let _v : (Ast.cfield list) =     ( [ x ] ) in
                _menhir_goto_separated_nonempty_list_SEMI_field_ _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | IAND ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | IOR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | RBRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos__5_ = _endpos in
            let (((_menhir_stack, _menhir_s, _startpos__1_), _, (t : (Ast.ty)), _startpos_t_), _endpos_e1_, _, (e1 : (Ast.exp Ast.node)), _startpos_e1_) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _endpos = _endpos__5_ in
            let _v : (Ast.exp Ast.node) = let _endpos = _endpos__5_ in
            let _startpos = _startpos__1_ in
                                    ( loc _startpos _endpos @@ NewArr(t, e1) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | AMPER | BANGEQ | BAR | COMMA | DASH | DOT | EOF | EQEQ | GT | GTEQ | GTGT | GTGTGT | IAND | IOR | LT | LTEQ | LTLT | PLUS | RBRACE | RBRACKET | RPAREN | SEMI | STAR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, _startpos__10_), _endpos_e_, _, (e : (Ast.exp Ast.node)), _startpos_e_) = _menhir_stack in
            let _10 = () in
            let _startpos = _startpos__10_ in
            let _endpos = _endpos_e_ in
            let _v : (Ast.exp Ast.node) = let u =
              let _1 = _10 in
                        ( Bitnot )
            in
            let _startpos_u_ = _startpos__10_ in
            let _endpos = _endpos_e_ in
            let _startpos = _startpos_u_ in
                                    ( loc _startpos _endpos @@ Uop (u, e) ) in
            _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _endpos_e_, _menhir_s, (e : (Ast.exp Ast.node)), _startpos_e_) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.exp Ast.node) =               ( e ) in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (Ast.exp Ast.node)) = _v in
            Obj.magic _1
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | IAND ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | IOR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState125 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | IAND ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | IOR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LBRACE ->
                _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState131 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | IAND ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | IOR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, _startpos__1_), _endpos_id_, (id : (string)), _startpos_id_), _endpos_init_, _, (init : (Ast.exp Ast.node)), _startpos_init_) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _startpos = _startpos__1_ in
            let _v : (Ast.vdecl) =                              ( (id, init) ) in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
            (match _menhir_s with
            | MenhirState150 | MenhirState148 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | COMMA ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | VAR ->
                        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState150)
                | SEMI ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, (x : (Ast.vdecl)), _startpos_x_) = _menhir_stack in
                    let _v : (Ast.vdecl list) =     ( [ x ] ) in
                    _menhir_goto_separated_nonempty_list_COMMA_vdecl_ _menhir_env _menhir_stack _menhir_s _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | MenhirState238 | MenhirState179 | MenhirState123 | MenhirState156 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | SEMI ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _endpos__2_ = _endpos in
                    let (_menhir_stack, _menhir_s, (d : (Ast.vdecl)), _startpos_d_) = _menhir_stack in
                    let _2 = () in
                    let _v : (Ast.stmt Ast.node) = let _endpos = _endpos__2_ in
                    let _startpos = _startpos_d_ in
                                            ( loc _startpos _endpos @@ Decl(d) ) in
                    _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                _menhir_fail ())
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState133 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | IAND ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | IOR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos__3_ = _endpos in
            let ((_menhir_stack, _menhir_s, _startpos__1_), _endpos_e_, _, (e : (Ast.exp Ast.node)), _startpos_e_) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.stmt Ast.node) = let _endpos = _endpos__3_ in
            let _startpos = _startpos__1_ in
                                    ( loc _startpos _endpos @@ Ret(Some e) ) in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState138 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | IAND ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | IOR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LBRACE ->
                _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState164 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | IAND ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | IOR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos__4_ = _endpos in
            let ((_menhir_stack, _menhir_s, (p : (Ast.exp Ast.node)), _startpos_p_), _endpos_e_, _, (e : (Ast.exp Ast.node)), _startpos_e_) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (Ast.stmt Ast.node) = let _endpos = _endpos__4_ in
            let _startpos = _startpos_p_ in
                                    ( loc _startpos _endpos @@ Assn(p,e) ) in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState238 | MenhirState123 | MenhirState179 | MenhirState156 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | IDENT _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
                let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | EQ ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _endpos_e_, _menhir_s, (e : (Ast.exp Ast.node)), _startpos_e_), _endpos_id_, (id : (string)), _startpos_id_) = _menhir_stack in
                    let _2 = () in
                    let _startpos = _startpos_e_ in
                    let _v : (Ast.exp Ast.node) = let _endpos = _endpos_id_ in
                    let _startpos = _startpos_e_ in
                                            ( loc _startpos _endpos @@ Proj (e, id) ) in
                    _menhir_goto_lhs _menhir_env _menhir_stack _menhir_s _v _startpos
                | AMPER | BANGEQ | BAR | DASH | DOT | EQEQ | GT | GTEQ | GTGT | GTGTGT | IAND | IOR | LBRACKET | LPAREN | LT | LTEQ | LTLT | PLUS | STAR ->
                    _menhir_reduce43 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _, _menhir_s, _, _), _, _, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | IAND ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | IOR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | DASH ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState173 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState173 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRING _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState173 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TBOOL ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TILDE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TINT ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TSTRING ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | UIDENT _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState173)
        | LPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | DASH ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState169 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState169 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRING _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState169 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TBOOL ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TILDE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TINT ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TSTRING ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | UIDENT _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RPAREN ->
                _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState169
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState169)
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState173 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | IAND ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | IOR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | RBRACKET ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = (_menhir_stack, _endpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EQ ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((_menhir_stack, _endpos_e_, _menhir_s, (e : (Ast.exp Ast.node)), _startpos_e_), _endpos_i_, _, (i : (Ast.exp Ast.node)), _startpos_i_), _endpos__4_) = _menhir_stack in
                let _4 = () in
                let _2 = () in
                let _startpos = _startpos_e_ in
                let _v : (Ast.exp Ast.node) = let _endpos = _endpos__4_ in
                let _startpos = _startpos_e_ in
                                        ( loc _startpos _endpos @@ Index (e, i) ) in
                _menhir_goto_lhs _menhir_env _menhir_stack _menhir_s _v _startpos
            | AMPER | BANGEQ | BAR | DASH | DOT | EQEQ | GT | GTEQ | GTGT | GTGTGT | IAND | IOR | LBRACKET | LPAREN | LT | LTEQ | LTLT | PLUS | STAR ->
                _menhir_reduce35 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState154 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AMPER ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | BANGEQ ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | BAR ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DASH ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DOT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack)
        | EQEQ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | GT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | GTEQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | GTGT ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack)
        | GTGTGT ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack)
        | IAND ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack)
        | IOR ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack)
        | LBRACKET ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack)
        | LPAREN ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LT ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack)
        | LTEQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack)
        | LTLT ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | STAR ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack)
        | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _endpos_x_, _menhir_s, (x : (Ast.exp Ast.node)), _startpos_x_) = _menhir_stack in
            let _v : (Ast.exp Ast.node option) =     ( Some x ) in
            _menhir_goto_option_exp_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_run37 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (string) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack)

and _menhir_reduce60 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.prog) =     ( [] ) in
    _menhir_goto_list_decl_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run112 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = (_menhir_stack, _startpos) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LPAREN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TBOOL ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TINT ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TSTRING ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | UIDENT _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RPAREN ->
                _menhir_reduce68 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run184 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | UIDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = (_menhir_stack, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | LPAREN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TBOOL ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TINT ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TSTRING ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | UIDENT _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RBRACE ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState186 in
                let _v : (Ast.field list) =     ( [] ) in
                _menhir_goto_loption_separated_nonempty_list_SEMI_decl_field__ _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState186)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, _), _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RPAREN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState17
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run195 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | FALSE ->
                _menhir_run206 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState197 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run205 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState197 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run204 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState197 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState197 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRING _v ->
                _menhir_run203 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState197 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TBOOL ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState197 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TINT ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState197 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run202 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState197 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TSTRING ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState197 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | UIDENT _v ->
                _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState197 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState197)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState238 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState236 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState231 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState229 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, _, _), _, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState223 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState216 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState211 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState209 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState201 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState199 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState197 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState193 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState186 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState179 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState173 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState169 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState164 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState161 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState156 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState154 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState150 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState148 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState142 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState140 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState138 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState133 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState131 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState127 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState125 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState123 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState122 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState117 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _, _), _, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState114 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, _), _, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState111 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR
    | MenhirState102 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState97 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState86 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState84 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState80 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState76 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState74 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState66 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState64 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState60 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run124 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BANG ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DASH ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FALSE ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NEW ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | STRING _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TBOOL ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TILDE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TINT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TSTRING ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | UIDENT _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run129 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = (_menhir_stack, _endpos, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BANG ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | DASH ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | FALSE ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState131 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | IDENT _v ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState131 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | INT _v ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState131 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | NEW ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | STRING _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState131 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TBOOL ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TILDE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TINT ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TRUE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState131 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | TSTRING ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | UIDENT _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, _), _, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (string) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce113 _menhir_env (Obj.magic _menhir_stack)

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _startpos__10_ = _startpos in
    let _10 = () in
    let _startpos = _startpos__10_ in
    let _v : (Ast.ty) = let r =
      let _1 = _10 in
                  ( RString )
    in
               ( TRef r ) in
    _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_run3 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _endpos__1_ = _endpos in
    let _startpos__1_ = _startpos in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : (Ast.exp Ast.node) = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
                            ( loc _startpos _endpos @@ CBool true ) in
    _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _startpos__1_ = _startpos in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _v : (Ast.ty) =            ( TInt ) in
    _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState5 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState5 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState5 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState5 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState5 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _startpos__1_ = _startpos in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _v : (Ast.ty) =            ( TBool ) in
    _menhir_goto_ty _menhir_env _menhir_stack _menhir_s _v _startpos

and _menhir_run7 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (string) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _endpos_s_ = _endpos in
    let (s : (string)) = _v in
    let _startpos_s_ = _startpos in
    let _startpos = _startpos_s_ in
    let _endpos = _endpos_s_ in
    let _v : (Ast.exp Ast.node) = let _endpos = _endpos_s_ in
    let _startpos = _startpos_s_ in
                            ( loc _startpos _endpos @@ CStr s ) in
    _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_run133 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | SEMI ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos = _menhir_env._menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_s = MenhirState133 in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _endpos__2_ = _endpos in
        let (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (Ast.stmt Ast.node) = let _endpos = _endpos__2_ in
        let _startpos = _startpos__1_ in
                                ( loc _startpos _endpos @@ Ret(None) ) in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState8 in
        let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = (_menhir_stack, _menhir_s, _v, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | IDENT _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState10 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
            | RBRACE ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_s = MenhirState10 in
                let _v : (Ast.cfield list) =     ( [] ) in
                _menhir_goto_loption_separated_nonempty_list_SEMI_field__ _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10)
        | LBRACKET ->
            _menhir_reduce113 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState13 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState13 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState13 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RPAREN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState13
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState13 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState13 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run36 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (int64) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _endpos_i_ = _endpos in
    let (i : (int64)) = _v in
    let _startpos_i_ = _startpos in
    let _startpos = _startpos_i_ in
    let _endpos = _endpos_i_ in
    let _v : (Ast.exp Ast.node) = let _endpos = _endpos_i_ in
    let _startpos = _startpos_i_ in
                            ( loc _startpos _endpos @@ CInt i ) in
    _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_run137 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BANG ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | DASH ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | FALSE ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | IDENT _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | INT _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | NEW ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | STRING _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TBOOL ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TILDE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TINT ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TRUE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | TSTRING ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | UIDENT _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run146 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> (string) -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _v _startpos ->
    let _menhir_stack = (_menhir_stack, _endpos, _menhir_s, _v, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQ ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _endpos_id_, _menhir_s, (id : (string)), _startpos_id_) = _menhir_stack in
        let _startpos = _startpos_id_ in
        let _v : (Ast.exp Ast.node) = let _endpos = _endpos_id_ in
        let _startpos = _startpos_id_ in
                                ( loc _startpos _endpos @@ Id id ) in
        _menhir_goto_lhs _menhir_env _menhir_stack _menhir_s _v _startpos
    | AMPER | BANGEQ | BAR | DASH | DOT | EQEQ | GT | GTEQ | GTGT | GTGTGT | IAND | IOR | LBRACKET | LPAREN | LT | LTEQ | LTLT | PLUS | STAR ->
        _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _, _menhir_s, _, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run147 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _startpos = _menhir_env._menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = (_menhir_stack, _startpos) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | VAR ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState148 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
        | SEMI ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState148 in
            let _v : (Ast.vdecl list) =     ( [] ) in
            _menhir_goto_loption_separated_nonempty_list_COMMA_vdecl__ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState148)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run38 : _menhir_env -> 'ttv_tail -> Lexing.position -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _endpos _menhir_s _startpos ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _endpos__1_ = _endpos in
    let _startpos__1_ = _startpos in
    let _1 = () in
    let _startpos = _startpos__1_ in
    let _endpos = _endpos__1_ in
    let _v : (Ast.exp Ast.node) = let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
                            ( loc _startpos _endpos @@ CBool false ) in
    _menhir_goto_exp _menhir_env _menhir_stack _endpos _menhir_s _v _startpos

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState39 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState39 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState39 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState39 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState39 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> Lexing.position -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _startpos ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _startpos) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState40 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState40 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState40 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState40 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState40 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and _menhir_init : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> _menhir_env =
  fun lexer lexbuf ->
    let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and exp_top : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.exp Ast.node) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState0 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState0 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState0 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState0 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState0 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

and prog : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.prog) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | GLOBAL ->
        _menhir_run195 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRUCT ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TVOID ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | EOF ->
        _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111)

and stmt_top : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.stmt Ast.node) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BANG ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | DASH ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FALSE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState238 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | FOR ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IDENT _v ->
        _menhir_run146 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState238 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | IF ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | INT _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState238 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | NEW ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | RETURN ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | STRING _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState238 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TBOOL ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TILDE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TINT ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TRUE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _menhir_env._menhir_lexbuf.Lexing.lex_curr_p MenhirState238 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | TSTRING ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | UIDENT _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _v _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | VAR ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | WHILE ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _menhir_env._menhir_lexbuf.Lexing.lex_start_p
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState238)
  

