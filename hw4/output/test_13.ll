; generated from: atprograms/arrayargs3.oat
target triple = "x86_64-apple-macosx10.10.0"
@x = global { i64, [3 x i64] } { i64 3, [3 x i64] [ i64 1, i64 2, i64 3 ] }
@_glob421 = global i64 1
@_glob422 = global i64 2
@_glob423 = global i64 3
@y = global { i64, [3 x i64] } { i64 3, [3 x i64] [ i64 4, i64 5, i64 6 ] }
@_glob418 = global i64 4
@_glob419 = global i64 5
@_glob420 = global i64 6

define { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %x, { i64, [0 x i64] }* %y, i1 %b) {
  %_b426 = alloca i1
  %_y425 = alloca { i64, [0 x i64] }*
  %_x424 = alloca { i64, [0 x i64] }*
  store i1 %b, i1* %_b426
  store { i64, [0 x i64] }* %y, { i64, [0 x i64] }** %_y425
  store { i64, [0 x i64] }* %x, { i64, [0 x i64] }** %_x424
  %_id431 = load i1, i1* %_b426
  %_test430 = icmp eq i1 %_id431, 0
  br i1 %_test430, label %_else428, label %_then427
_then427:
  %_id433 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x424
  ret { i64, [0 x i64] }* %_id433
_else428:
  %_id435 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_y425
  ret { i64, [0 x i64] }* %_id435
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv392 = alloca { i64, [0 x i8*] }*
  %_argc391 = alloca i64
  %_z400 = alloca i64
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv392
  store i64 %argc, i64* %_argc391
  %_bitcast395 = bitcast { i64, [3 x i64] }* @y to { i64, [0 x i64] }*
  %_bitcast397 = bitcast { i64, [3 x i64] }* @x to { i64, [0 x i64] }*
  %_fun393 = call { i64, [0 x i64] }* @f(i1 %_bitcast397, { i64, [0 x i64] }* %_bitcast395, { i64, [0 x i64] }* 1)
  %_gep399 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_fun393, i32 0, i32 1, i32 0
  store i64 17, i64* %_gep399
  %_bitcast403 = bitcast { i64, [3 x i64] }* @y to { i64, [0 x i64] }*
  %_bitcast405 = bitcast { i64, [3 x i64] }* @x to { i64, [0 x i64] }*
  %_fun401 = call { i64, [0 x i64] }* @f(i1 %_bitcast405, { i64, [0 x i64] }* %_bitcast403, { i64, [0 x i64] }* 1)
  %_ptr406 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_fun401, i32 0, i32 1, i32 0
  %_load407 = load i64, i64* %_ptr406
  %_bitcast410 = bitcast { i64, [3 x i64] }* @x to { i64, [0 x i64] }*
  %_bitcast412 = bitcast { i64, [3 x i64] }* @y to { i64, [0 x i64] }*
  %_fun408 = call { i64, [0 x i64] }* @f(i1 %_bitcast412, { i64, [0 x i64] }* %_bitcast410, { i64, [0 x i64] }* 0)
  %_ptr413 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_fun408, i32 0, i32 1, i32 0
  %_load414 = load i64, i64* %_ptr413
  %_bop415 = add i64 %_load407, %_load414
  store i64 %_bop415, i64* %_z400
  %_id416 = load i64, i64* %_z400
  ret i64 %_id416
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
