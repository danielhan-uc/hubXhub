; generated from: atprograms/easyrun7.oat
target triple = "x86_64-apple-macosx10.10.0"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_uop35 = xor i64 -1, 5
  %_bop36 = and i64 %_uop35, 6
  %_bop37 = or i64 2, 0
  %_bop38 = icmp sge i64 %_bop36, %_bop37
  %_test34 = icmp eq i1 %_bop38, 0
  br i1 %_test34, label %_else32, label %_then31
_then31:
  br label %_merge33
_else32:
  br label %_merge33
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
