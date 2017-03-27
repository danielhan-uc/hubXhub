; generated from: atprograms/easyrun5.oat
target triple = "x86_64-apple-macosx10.10.0"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %x = alloca i64
  %y = alloca i64
  %_bop2 = lshr i64 100, 3
  store i64 %_bop2, i64* %x
  %_bop3 = shl i64 100, 3
  store i64 %_bop3, i64* %y
  %_id15 = load i64, i64* %x
  %_id16 = load i64, i64* %y
  %_bop17 = sub i64 %_id15, %_id16
  %_bop18 = icmp sle i64 %_bop17, 0
  %_test14 = icmp eq i1 %_bop18, 0
  br i1 %_test14, label %_else12, label %_then11
_then11:
  br label %_merge13
_else12:
  br label %_merge13
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
