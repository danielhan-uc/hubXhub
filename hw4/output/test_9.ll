; generated from: atprograms/easyrun6.oat
target triple = "x86_64-apple-macosx10.10.0"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_uop37 = xor i1 1, 1
  %_uop38 = sub i64 0, 4
  %_bop39 = add i64 %_uop38, 5
  %_bop40 = icmp sgt i1 %_bop39, 0
  %_bop41 = mul i64 6, 4
  %_bop42 = icmp slt i1 %_bop41, 25
  %_bop43 = and i1 %_bop40, %_bop42
  %_bop44 = or i1 %_uop37, %_bop43
  %_test36 = icmp eq i1 %_bop44, 0
  br i1 %_test36, label %_else34, label %_then33
_then33:
  br label %_merge35
_else34:
  br label %_merge35
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
