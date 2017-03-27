; generated from: atprograms/easyrun6.oat
target triple = "x86_64-apple-macosx10.10.0"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_uop19 = xor i1 1, 1
  %_uop20 = sub i64 0, 4
  %_bop21 = add i64 %_uop20, 5
  %_bop22 = icmp sgt i1 %_bop21, 0
  %_bop23 = mul i64 6, 4
  %_bop24 = icmp slt i1 %_bop23, 25
  %_bop25 = and i1 %_bop22, %_bop24
  %_bop26 = or i1 %_uop19, %_bop25
  %_test18 = icmp eq i1 %_bop26, 0
  br i1 %_test18, label %_else16, label %_then15
_then15:
  br label %_merge17
_else16:
  br label %_merge17
_merge17:
  ret i64 4
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
