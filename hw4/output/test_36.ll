; generated from: atprograms/is_prime.oat
target triple = "x86_64-apple-macosx10.10.0"
@list = global { i64, [8 x i64] } { i64 8, [8 x i64] [ i64 3, i64 5, i64 7, i64 8, i64 11, i64 16, i64 17, i64 21 ] }
@_glob79 = global i64 3
@_glob80 = global i64 5
@_glob81 = global i64 7
@_glob82 = global i64 8
@_glob83 = global i64 11
@_glob84 = global i64 16
@_glob85 = global i64 17
@_glob86 = global i64 21

define i1 @isPrime(i64 %n) {
  %_n34 = alloca i64
  %_i42 = alloca i64
  %_cur_num55 = alloca i64
  store i64 %n, i64* %_n34
  %_id39 = load i64, i64* %_n34
  %_bop41 = icmp slt i64 %_id39, 2
  %_test38 = icmp eq i1 %_bop41, 0
  br i1 %_test38, label %_else36, label %_then35
_then35:
  ret i1 0
_else36:
  br label %_merge37
_merge37:
  store i64 2, i64* %_i42
  br label %_pre46
_pre46:
  %_id50 = load i64, i64* %_i42
  %_id52 = load i64, i64* %_n34
  %_bop54 = icmp sle i64 %_id50, %_id52
  %_test43 = icmp eq i1 %_bop54, 0
  br i1 %_test43, label %_post44, label %_body45
_body45:
  %_id56 = load i64, i64* %_n34
  store i64 %_id56, i64* %_cur_num55
  br label %_pre61
_pre61:
  %_id62 = load i64, i64* %_cur_num55
  %_id64 = load i64, i64* %_i42
  %_bop66 = icmp sgt i64 %_id62, %_id64
  %_test58 = icmp eq i1 %_bop66, 0
  br i1 %_test58, label %_post59, label %_body60
_body60:
  %_id67 = load i64, i64* %_cur_num55
  %_id69 = load i64, i64* %_i42
  %_bop71 = sub i64 %_id67, %_id69
  store i64 %_bop71, i64* %_cur_num55
  br label %_pre61
_post59:
  %_id76 = load i64, i64* %_cur_num55
  %_bop78 = icmp eq i64 %_id76, 0
  %_test75 = icmp eq i1 %_bop78, 0
  br i1 %_test75, label %_else73, label %_then72
_then72:
  ret i1 0
_else73:
  br label %_merge74
_merge74:
  %_id47 = load i64, i64* %_i42
  %_bop49 = add i64 %_id47, 1
  store i64 %_bop49, i64* %_i42
  br label %_pre46
_post44:
  ret i1 1
}

define i1 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv5 = alloca { i64, [0 x i8*] }*
  %_argc4 = alloca i64
  %_answer6 = alloca i64
  %_i7 = alloca i64
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv5
  store i64 %argc, i64* %_argc4
  store i64 0, i64* %_answer6
  store i64 0, i64* %_i7
  br label %_pre11
_pre11:
  %_id15 = load i64, i64* %_i7
  %_bop17 = icmp slt i64 %_id15, 8
  %_test8 = icmp eq i1 %_bop17, 0
  br i1 %_test8, label %_post9, label %_body10
_body10:
  %_bitcast24 = bitcast { i64, [8 x i64] }* @list to { i64, [0 x i64] }*
  %_id25 = load i64, i64* %_i7
  %_ptr27 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_bitcast24, i32 0, i32 1, i64 %_id25
  %_load28 = load i64, i64* %_ptr27
  %_fun22 = call i1 @isPrime(i64 %_load28)
  %_test21 = icmp eq i1 %_fun22, 0
  br i1 %_test21, label %_else19, label %_then18
_then18:
  %_id29 = load i64, i64* %_answer6
  %_bop31 = add i64 %_id29, 1
  store i64 %_bop31, i64* %_answer6
  br label %_merge20
_else19:
  br label %_merge20
_merge20:
  %_id12 = load i64, i64* %_i7
  %_bop14 = add i64 %_id12, 1
  store i64 %_bop14, i64* %_i7
  br label %_pre11
_post9:
  %_id32 = load i64, i64* %_answer6
  ret i64 %_id32
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
