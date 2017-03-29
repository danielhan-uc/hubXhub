; generated from: atprograms/is_prime.oat
target triple = "x86_64-apple-macosx10.10.0"
@list = global { i64, [8 x i64] } { i64 8, [8 x i64] [ i64 3, i64 5, i64 7, i64 8, i64 11, i64 16, i64 17, i64 21 ] }
@_glob75 = global i64 3
@_glob76 = global i64 5
@_glob77 = global i64 7
@_glob78 = global i64 8
@_glob79 = global i64 11
@_glob80 = global i64 16
@_glob81 = global i64 17
@_glob82 = global i64 21

define i1 @isPrime(i64 %n) {
  %_n30 = alloca i64
  %_i38 = alloca i64
  %_cur_num51 = alloca i64
  store i64 %n, i64* %_n30
  %_id35 = load i64, i64* %_n30
  %_bop37 = icmp slt i64 %_id35, 2
  %_test34 = icmp eq i1 %_bop37, 0
  br i1 %_test34, label %_else32, label %_then31
_then31:
  ret i1 0
_else32:
  br label %_merge33
_merge33:
  store i64 2, i64* %_i38
  br label %_pre42
_pre42:
  %_id46 = load i64, i64* %_i38
  %_id48 = load i64, i64* %_n30
  %_bop50 = icmp sle i64 %_id46, %_id48
  %_test39 = icmp eq i1 %_bop50, 0
  br i1 %_test39, label %_post40, label %_body41
_body41:
  %_id52 = load i64, i64* %_n30
  store i64 %_id52, i64* %_cur_num51
  br label %_pre57
_pre57:
  %_id58 = load i64, i64* %_cur_num51
  %_id60 = load i64, i64* %_i38
  %_bop62 = icmp sgt i64 %_id58, %_id60
  %_test54 = icmp eq i1 %_bop62, 0
  br i1 %_test54, label %_post55, label %_body56
_body56:
  %_id63 = load i64, i64* %_cur_num51
  %_id65 = load i64, i64* %_i38
  %_bop67 = sub i64 %_id63, %_id65
  store i64 %_bop67, i64* %_cur_num51
  br label %_pre57
_post55:
  %_id72 = load i64, i64* %_cur_num51
  %_bop74 = icmp eq i64 %_id72, 0
  %_test71 = icmp eq i1 %_bop74, 0
  br i1 %_test71, label %_else69, label %_then68
_then68:
  ret i1 0
_else69:
  br label %_merge70
_merge70:
  %_id43 = load i64, i64* %_i38
  %_bop45 = add i64 %_id43, 1
  store i64 %_bop45, i64* %_i38
  br label %_pre42
_post40:
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
  %_id18 = load i64, i64* %_answer6
  %_bitcast22 = bitcast { i64, [8 x i64] }* @list to { i64, [0 x i64] }*
  %_id23 = load i64, i64* %_i7
  %_ptr25 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_bitcast22, i32 0, i32 1, i64 %_id23
  %_load26 = load i64, i64* %_ptr25
  %_fun20 = call i1 @isPrime(i64 %_load26)
  %_bop27 = add i64 %_id18, %_fun20
  store i64 %_bop27, i64* %_answer6
  %_id12 = load i64, i64* %_i7
  %_bop14 = add i64 %_id12, 1
  store i64 %_bop14, i64* %_i7
  br label %_pre11
_post9:
  %_id28 = load i64, i64* %_answer6
  ret i64 %_id28
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
