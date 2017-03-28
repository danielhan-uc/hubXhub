; generated from: atprograms/arrayargs2.oat
target triple = "x86_64-apple-macosx10.10.0"
define { i64, [0 x i64] }* @f({ i64, [0 x i64] }* %x, { i64, [0 x i64] }* %y, i1 %b) {
  %_b375 = alloca i1
  %_y374 = alloca { i64, [0 x i64] }*
  %_x373 = alloca { i64, [0 x i64] }*
  store i1 %b, i1* %_b375
  store { i64, [0 x i64] }* %y, { i64, [0 x i64] }** %_y374
  store { i64, [0 x i64] }* %x, { i64, [0 x i64] }** %_x373
  %_id380 = load i1, i1* %_b375
  %_test379 = icmp eq i1 %_id380, 0
  br i1 %_test379, label %_else377, label %_then376
_then376:
  %_id382 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x373
  ret { i64, [0 x i64] }* %_id382
_else377:
  %_id384 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_y374
  ret { i64, [0 x i64] }* %_id384
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv355 = alloca { i64, [0 x i8*] }*
  %_argc354 = alloca i64
  %_x356 = alloca { i64, [0 x i64] }*
  %_y359 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv355
  store i64 %argc, i64* %_argc354
  %_raw_array357 = call { i64, [0 x i64] }* @oat_alloc_array(i64 3)
  %_array358 = bitcast { i64, [0 x i64] }* %_raw_array357 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array358, { i64, [0 x i64] }** %_x356
  %_raw_array360 = call { i64, [0 x i64] }* @oat_alloc_array(i64 3)
  %_array361 = bitcast { i64, [0 x i64] }* %_raw_array360 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array361, { i64, [0 x i64] }** %_y359
  %_id363 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_y359
  %_id365 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x356
  %_fun362 = call { i64, [0 x i64] }* @f(i1 %_id365, { i64, [0 x i64] }* %_id363, { i64, [0 x i64] }* 1)
  %_gep368 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_fun362, i32 0, i32 1, i32 0
  store i64 17, i64* %_gep368
  %_id369 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_x356
  %_ptr371 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id369, i32 0, i32 1, i32 0
  %_load372 = load i64, i64* %_ptr371
  ret i64 %_load372
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
