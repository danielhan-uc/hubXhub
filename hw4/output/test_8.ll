; generated from: atprograms/easyrun5.oat
target triple = "x86_64-apple-macosx10.10.0"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %x = alloca i64
  %y = alloca i64
  %_bop16 = lshr i64 100, 3
  store i64 %_bop16, i64* %x
  %_bop17 = shl i64 100, 3
  store i64 %_bop17, i64* %y
  %_id22 = load i64, i64* %x
  %_id23 = load i64, i64* %y
  %_bop24 = sub i64 %_id22, %_id23
  %_bop25 = icmp sle i1 %_bop24, 0
  %_test21 = icmp eq i1 %_bop25, 0
  br i1 %_test21, label %_else19, label %_then18
_then18:
  br label %_merge20
_else19:
  br label %_merge20
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
