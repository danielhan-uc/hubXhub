%arr = type [10 x i64]
@tmp = global %arr [ i64 3, i64 -2, i64 6, i64 1, i64 -5, i64 2, i64 6, i64 -1, i64 4, i64 2 ]

define i64 @maxdif(i64 %a, i64 %b, i64 %curmax) {
  %la = alloca i64
  store i64 %a, i64* %la
  %ra = alloca i64
  store i64 %b, i64* %ra
  %max = alloca i64
  store i64 %curmax, i64* %max
  br label %loop
loop:
  %lp = load i64, i64* %la
  %rp = load i64, i64* %ra
  %left = load i64, i64* %lp
  %right = load i64, i64* %rp
  %1 = icmp slt i64 10, %rp
  br i1 %1, label %end, label %body
body:
  %diff = sub i64 %left, %right
  %2 = icmp slt i64 %diff, %max
  br i1 %2, label %movepointer, label %changemax
movepointer:
  %nrp = add i64 %rp, 1
  store i64 %nrp, i64* %ra
  %nright = load i64, i64* %nrp
  %3 = icmp slt %nright, %left
  br i1 %3, label %changemin, label %fin
changemin:
  %nlp = add i64 %nrp, 0
  store i64 %nlp, i64* %la
  br label %fin
changemax:
  store i64 %diff, i64* %max
  br label %movepointer
fin:
  br label %loop
end:
  %fmax = load i64, i64* %max
  ret i64 %fmax
}

define i64 @main(i64 %argc, i8** %arcv) {
  %1 = getelementptr %arr, %arr* @tmp, i32 0, i32 0
  %2 = add i64 0, 0
  %3 = call i64 @maxdif(i64 %1, i64 %1, i64 %2)
  ret i64 %3
}
