; generated from: atprograms/arrayargs1.oat
target triple = "x86_64-apple-macosx10.10.0"
@x = global { i64, [3 x i64] } { i64 3, [3 x i64] [ i64 1, i64 2, i64 3 ] }
@_glob333 = global i64 1
@_glob334 = global i64 2
@_glob335 = global i64 3
@y = global { i64, [3 x i64] } { i64 3, [3 x i64] [ i64 4, i64 5, i64 6 ] }
@_glob330 = global i64 4
@_glob331 = global i64 5
@_glob332 = global i64 6

define { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %x, { i64, [0 x i64] }* %y, i1 %b) {
  %_b338 = alloca i1
  %_y337 = alloca { i64, [0 x i64] }*
  %_x336 = alloca { i64, [0 x i64] }*
  store i1 %b, i1* %_b338
  store { i64, [0 x i64] }* %y, { i64, [0 x i64] }** %_y337
  store { i64, [0 x i64] }* %x, { i64, [0 x i64] }** %_x336
  %_id343 = load i1, i1* %_b338
  %_test342 = icmp eq i1 %_id343, 0
  br i1 %_test342, label %_else340, label %_then339
_then339:
  %_id345 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x336
  ret { i64, [0 x i64] }* %_id345
_else340:
  %_id347 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_y337
  ret { i64, [0 x i64] }* %_id347
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv318 = alloca { i64, [0 x i8*] }*
  %_argc317 = alloca i64
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv318
  store i64 %argc, i64* %_argc317
  %_bitcast321 = bitcast { i64, [3 x i64] }* @y to { i64, [0 x i64] }*
  %_bitcast323 = bitcast { i64, [3 x i64] }* @x to { i64, [0 x i64] }*
  %_fun319 = call { i64, [0 x i64] }* @f(i1 %_bitcast323, { i64, [0 x i64] }* %_bitcast321, { i64, [0 x i64] }* 1)
  %_gep325 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_fun319, i32 0, i32 1, i32 0
  store i64 17, i64* %_gep325
  %_bitcast327 = bitcast { i64, [3 x i64] }* @x to { i64, [0 x i64] }*
  %_ptr328 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_bitcast327, i32 0, i32 1, i32 0
  %_load329 = load i64, i64* %_ptr328
  ret i64 %_load329
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
