open Assert
open X86
open Simulator
open Asm
open Simulator

(* These tests are provided by you -- they will be graded manually *)

(* You should also add additional test cases here to help you   *)
(* debug your program.                                          *)

let provided_tests : suite = [
    Test ("Student-Provided Big Test for Part III: Score recorded as PartIIITestCase", []); 
  ]

 (* copied from gradedtests.ml *)
let program_test (p:prog) (ans:int64) () =
  let res = assemble p |> load |> run in
  if res <> ans
  then failwith (Printf.sprintf("Expected %Ld but got %Ld") ans res)
  else ()
(* Part 3 : Assembly Programming *)
let taehantest =
let lcm a b =
    [text "mod"
  	[ Cmpq, [~%R12; ~%R11]
  	; J Le, [~$$"exit1"]
  	; Subq, [~%R12; ~%R11]
  	; Jmp, [~$$"mod"]
  	]
    ; text "exit1"
  	 [Retq, []]
    ; text "lcm"
  	   [
           Cmpq,  [~$0; ~%R09]
         ; J Eq,  [~$$"exit2"]
         ; Movq,  [~%R09; ~%R10]
         ; Movq,  [~%R08; ~%R11]
         ; Movq,  [~%R09; ~%R12]
  	 ; Callq, [~$$"mod"]			      
         ; Movq,  [~%R11; ~%R09]
  	 ; Movq,  [~%R10; ~%R08]
  	 ; Jmp,   [~$$"gcd"]
         ]
    ; text "div"
           [
           Movq, [~$0; ~%Rax]
           ; Cmpq, [~%R08; ~%R13]
           ; J Ge, [~$$"exit"]
           ; Subq, [~%R13; ~%R08]
           ; Addq, [~$1; ~%Rax]
           ; Jmp,  [~$$"divide"]
           ]
    ; text "exit2"
           [
           Movq,  [~%R08; ~%R13]
           ; Imulq, [~%R09; ~%R08]
           ; Callq, [~$$"div"]                  
           ; Retq,  [] 
           ]
    ; text "exit"
           [
             Retq, []
           ]
    ; gtext "main"
            [ Movq,  [~$a; ~%R08]
  	    ; Movq,  [~$b; ~%R09]
  	    ; Callq, [~$$"lcm"]
            ; Retq,  []
            ]
    ]
  in

  [ ("lcm_8_12", program_test (lcm 8 12) 24L);
    ("lcm_12_8", program_test (lcm 12 8) 24L);
    ("lcm_prime", program_test (lcm 5 3) 15L);
    ("lcm_large", program_test (lcm 80 90) 720L)	       	       
  ]


