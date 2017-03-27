; generated from: atprograms/easyrun6.oat
target triple = "x86_64-apple-macosx10.10.0"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_uop23 = xor i1 1, 1
  %_uop24 = sub i64 0, 4
  %_bop25 = add i64 %_uop24, 5
  %_bop26 = icmp sgt i64 %_bop25, 0
  %_bop27 = mul i64 6, 4
  %_bop28 = icmp slt i64 %_bop27, 25
  %_bop29 = and i1 %_bop26, %_bop28
  %_bop30 = or i1 %_uop23, %_bop29
  %_test22 = icmp eq i1 %_bop30, 0
  br i1 %_test22, label %_else20, label %_then19
_then19:
  br label %_merge21
_else20:
  br label %_merge21
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
