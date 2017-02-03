open Assert
open X86
open Simulator
open Asm

(* These tests are provided by you -- they will be graded manually *)

(* You should also add additional test cases here to help you   *)
(* debug your program.  
                                        *)
let provided_tests : suite = [
  Test ("Student-Provided Big Test for Part III: Score recorded as PartIIITestCase", [
  ]);
  ]


(*************************************************************)
(******************* SELF_WRITTEN TESTS **********************)
(*************************************************************)

let test_machine (bs: sbyte list): mach =
  let mem = (Array.make mem_size (Byte '\x00')) in
  Array.blit (Array.of_list bs) 0 mem 0 (List.length bs);
  let regs = Array.make nregs 0L in
  regs.(rind Rip) <- mem_bot;
  regs.(rind Rsp) <- Int64.sub mem_top 8L;
  { flags = {fo = false; fs = false; fz = false};
    regs = regs;
    mem = mem
  }

let machine_test (s:string) (n: int) (m: mach) (f:mach -> bool) () =
  for i=1 to n do step m done;
  if (f m) then () else failwith ("expected " ^ s ^ "Rip " ^ (Int64.to_string m.regs.(rind Rax)))

let negq_ = test_machine
    [InsB0 (Addq, [~$4; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Negq, [~%Rax]);InsFrag;InsFrag;InsFrag
    ] (*Rax is -4*)

let addq_ = test_machine
    [InsB0 (Addq, [~$3; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Addq, [~%Rax; ~%Rbx]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Addq, [~%Rax; ~%Rbx]);InsFrag;InsFrag;InsFrag (*Rbx is 6*)
    ]
let addq_im1_ = test_machine
    [InsB0 (Addq, [~$3; Ind1 (Lit 0x400012L)]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Addq, [~$3; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Addq, [Ind1 (Lit 0x400012L); ~%Rax]);InsFrag;InsFrag;InsFrag (*Rax is 6*)
    ]

let imulq_ = test_machine
    [InsB0 (Movq, [~$3; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Imulq, [~%Rax; ~%Rax]);InsFrag;InsFrag;InsFrag (*Rax is 9*)
    ]

let decq_ = test_machine
    [InsB0 (Addq, [~$4; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Decq, [~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Decq, [~%Rax]);InsFrag;InsFrag;InsFrag] (*Rax is 2*)

let incq_ = test_machine
    [InsB0 (Addq, [~$4; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag] (*Rax is 6*)

(*********************** Logic Instruction *************************)

let notq_ = test_machine
    [InsB0 (Addq, [~$4; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Notq, [~%Rax]);InsFrag;InsFrag;InsFrag
    ]

let andq_ = test_machine
    [InsB0 (Movq, [~$2; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Movq, [~$3; ~%Rbx]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Andq, [~%Rax; ~%Rbx]);InsFrag;InsFrag;InsFrag
    ]

let orq_ = test_machine
    [InsB0 (Movq, [~$4; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Movq, [~$3; ~%Rbx]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Orq, [~%Rax; ~%Rbx]);InsFrag;InsFrag;InsFrag
    ]

let xorq_ = test_machine
    [InsB0 (Movq, [~$1; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Movq, [~$2; ~%Rbx]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Xorq, [~%Rax; ~%Rbx]);InsFrag;InsFrag;InsFrag
    ]

(************************ Bit Manipulation  ************************)

let sarq_ = test_machine
    [InsB0 (Movq, [~$3; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Sarq, [~$1; ~%Rax]);InsFrag;InsFrag;InsFrag] (*Rax is 1*)

let shlq_ = test_machine
    [InsB0 (Movq, [~$3; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Shlq, [~$1; ~%Rax]);InsFrag;InsFrag;InsFrag] (*Rax is 6*)

let shrq_ = test_machine
    [InsB0 (Movq, [~$3; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Shrq, [~$1; ~%Rax]);InsFrag;InsFrag;InsFrag] (*Rax is 1*)
               

(******************* Data-movement Instructions ********************)

let incq_ = test_machine
    [InsB0 (Addq, [~$4; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag] (*Rax is 6*)

let incq_ = test_machine
    [InsB0 (Addq, [~$4; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag] (*Rax is 6*)

let incq_ = test_machine
    [InsB0 (Addq, [~$4; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag] (*Rax is 6*)

let incq_ = test_machine
    [InsB0 (Addq, [~$4; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag] (*Rax is 6*)

(********* Control-flow and Condition Instructions *****************)

let incq_ = test_machine
    [InsB0 (Addq, [~$4; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag] (*Rax is 6*)

let incq_ = test_machine
    [InsB0 (Addq, [~$4; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag] (*Rax is 6*)

let incq_ = test_machine
    [InsB0 (Addq, [~$4; ~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag
    ;InsB0 (Incq, [~%Rax]);InsFrag;InsFrag;InsFrag] (*Rax is 6*)

(*************************************************************)
(******************* SELF_WRITTEN TESTS **********************)
(*************************************************************)
let instruction_tests = [
  ("negq_", machine_test "test" 2 negq_
    (fun m -> m.regs.(rind Rax) = -4L)
  );
 
  ("addq_", machine_test "test" 3 addq_
    (fun m -> m.regs.(rind Rbx) = 6L)
  );

  ("addq_im1_", machine_test "test" 3 addq_im1_
    (fun m -> m.regs.(rind Rax) = 6L)
  );

  ("imulq_", machine_test "test" 2 imulq_
    (fun m -> m.regs.(rind Rax) = 9L)
  );

  ("decq_", machine_test "test" 3 decq_
    (fun m -> m.regs.(rind Rax) = 2L)
  );

  ("incq_", machine_test "test" 3 incq_
    (fun m -> m.regs.(rind Rax) = 6L)
  );

  ("notq_", machine_test "test" 3 notq_
    (fun m -> m.regs.(rind Rax) = -5L)
  );

  ("andq_", machine_test "test" 2 andq_
    (fun m -> m.regs.(rind Rax) = 2L)
  );

  ("orq_", machine_test "test" 3 orq_
    (fun m -> m.regs.(rind Rbx) = 7L)
  );

  ("xorq_", machine_test "test" 3 xorq_
    (fun m -> m.regs.(rind Rbx) = 3L)
  );

  ("sarq_", machine_test "test" 3 sarq_
    (fun m -> m.regs.(rind Rax) = 1L)
  );

  ("shlq_", machine_test "test" 2 shlq_
    (fun m -> m.regs.(rind Rax) = 6L)
  );

  ("shrq_", machine_test "test" 3 shrq_
    (fun m -> m.regs.(rind Rax) = 1L)
  );
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
  	  [
            Cmpq, [~%R12; ~%R11]
  	  ; J Lt, [~$$"exit1"]
  	  ; Subq, [~%R12; ~%R11]
          ; Jmp,  [~$$"mod"]
  	  ]
    ; text "exit1"
          [
            Retq, []
          ]
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
  	 ; Jmp,   [~$$"lcm"]
         ]
    ; text "div"
         [
           Cmpq,  [~$0; ~%R15]
         ; J Eq,  [~$$"exit"]
         ; Subq,  [~%R13; ~%R15]
         ; Addq,  [~$1; ~%Rax]
         ; Jmp,   [~$$"div"]
         ]
    ; text "exit2"
         [
           Movq,  [~%R08; ~%R13]
         ; Imulq, [~%R14; ~%R15]         
         ; Movq,  [~$0; ~%Rax]
         ; Jmp,   [~$$"div"]    
         ]
    ; text "exit"
         [
           Retq,  []
         ]
    ; gtext "main"
         [
           Movq,  [~$a; ~%R14]
         ; Movq,  [~$b; ~%R15]
         ; Movq,  [~%R14; ~%R08]
         ; Movq,  [~%R15; ~%R09]
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
