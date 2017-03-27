; generated from: atprograms/easyrun3.oat
target triple = "x86_64-apple-macosx10.10.0"
define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %x = alloca i64
  %i = alloca i64
  store i64 0, i64* %x
  store i64 0, i64* %i
  br label %_pre5
_pre5:
  %_id6 = load i64, i64* %i
  %_bop7 = icmp slt i1 %_id6, 10
  %_test2 = icmp eq i1 %_bop7, 0
  br i1 %_test2, label %_post3, label %_body4
_body4:
  br label %_pre5
_post3:
  %_id15 = load i64, i64* %x
  ret i64 %_id15
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
