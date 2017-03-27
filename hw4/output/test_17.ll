; generated from: atprograms/easyrun5.oat
target triple = "x86_64-apple-macosx10.10.0"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %x = alloca i64
  %y = alloca i64
  %_bop2 = lshr i64 100, 3
  store i64 %_bop2, i64* %x
  %_bop3 = shl i64 100, 3
  store i64 %_bop3, i64* %y
  %_id8 = load i64, i64* %x
  %_id9 = load i64, i64* %y
  %_bop10 = sub i64 %_id8, %_id9
  %_bop11 = icmp sle i1 %_bop10, 0
  %_test7 = icmp eq i1 %_bop11, 0
  br i1 %_test7, label %_else5, label %_then4
_then4:
  br label %_merge6
_else5:
  br label %_merge6
_merge6:
  %_id12 = load i64, i64* %x
  %_id13 = load i64, i64* %y
  %_bop14 = sub i64 %_id12, %_id13
  ret i64 %_bop14
}


declare i64* @oat_malloc(i64)
declare { i64, [0 x i64] }* @oat_alloc_array(i64)
declare void @oat_assert_not_null(i8*)
declare void @oat_assert_array_length(i64*, i64)
declare { i64, [0 x i64] }* @array_of_string(i8*)
declare i8* @string_of_array({ i64, [0 x i64] }*)
declare i64 @length_of_string(i8*)
declare i8* @string_of_int(i64)
declare i8* @string_cat(i8*, i8*)
declare void @print_string(i8*)
declare void @print_int(i64)
declare void @print_bool(i1)
