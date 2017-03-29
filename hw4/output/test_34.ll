; generated from: atprograms/is_prime.oat
target triple = "x86_64-apple-macosx10.10.0"
@list = global { i64, [8 x i64] } { i64 8, [8 x i64] [ i64 3, i64 5, i64 7, i64 8, i64 11, i64 15, i64 17, i64 21 ] }
@_glob59 = global i64 3
@_glob60 = global i64 5
@_glob61 = global i64 7
@_glob62 = global i64 8
@_glob63 = global i64 11
@_glob64 = global i64 15
@_glob65 = global i64 17
@_glob66 = global i64 21

define i1 @isPrime(i64 %n) {
  %_n14 = alloca i64
  %_i22 = alloca i64
  %_cur_num35 = alloca i64
  store i64 %n, i64* %_n14
  %_id19 = load i64, i64* %_n14
  %_bop21 = icmp slt i64 %_id19, 2
  %_test18 = icmp eq i1 %_bop21, 0
  br i1 %_test18, label %_else16, label %_then15
_then15:
  ret i1 0
_else16:
  br label %_merge17
_merge17:
  store i64 2, i64* %_i22
  br label %_pre26
_pre26:
  %_id30 = load i64, i64* %_i22
  %_id32 = load i64, i64* %_n14
  %_bop34 = icmp sle i64 %_id30, %_id32
  %_test23 = icmp eq i1 %_bop34, 0
  br i1 %_test23, label %_post24, label %_body25
_body25:
  %_id36 = load i64, i64* %_n14
  store i64 %_id36, i64* %_cur_num35
  br label %_pre41
_pre41:
  %_id42 = load i64, i64* %_cur_num35
  %_id44 = load i64, i64* %_i22
  %_bop46 = icmp sgt i64 %_id42, %_id44
  %_test38 = icmp eq i1 %_bop46, 0
  br i1 %_test38, label %_post39, label %_body40
_body40:
  %_id47 = load i64, i64* %_cur_num35
  %_id49 = load i64, i64* %_i22
  %_bop51 = sub i64 %_id47, %_id49
  store i64 %_bop51, i64* %_cur_num35
  br label %_pre41
_post39:
  %_id56 = load i64, i64* %_cur_num35
  %_bop58 = icmp eq i64 %_id56, 0
  %_test55 = icmp eq i1 %_bop58, 0
  br i1 %_test55, label %_else53, label %_then52
_then52:
  ret i1 0
_else53:
  br label %_merge54
_merge54:
  %_id27 = load i64, i64* %_i22
  %_bop29 = add i64 %_id27, 1
  store i64 %_bop29, i64* %_i22
  br label %_pre26
_post24:
  ret i1 1
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv5 = alloca { i64, [0 x i8*] }*
  %_argc4 = alloca i64
  %_answer6 = alloca i1
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv5
  store i64 %argc, i64* %_argc4
  %_bitcast9 = bitcast { i64, [8 x i64] }* @list to { i64, [0 x i64] }*
  %_ptr10 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_bitcast9, i32 0, i32 1, i32 0
  %_load11 = load i64, i64* %_ptr10
  %_fun7 = call i1 @isPrime(i64 %_load11)
  store i1 %_fun7, i1* %_answer6
  %_id12 = load i1, i1* %_answer6
  ret i1 %_id12
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
