; generated from: atprograms/lcs.oat
target triple = "x86_64-apple-macosx10.10.0"
@buf = global { i64, [1 x i64] } { i64 1, [1 x i64] [ i64 0 ] }
@_glob7614 = global i64 0
@_str7507 = global [1 x i8] c"\00"
@_str7481 = global [7 x i8] c"TOMATO\00"
@_str7484 = global [8 x i8] c"ORATING\00"

define i8* @lcs(i64 %i, i64 %j, i8* %a, i8* %b) {
  %_b7495 = alloca i8*
  %_a7494 = alloca i8*
  %_j7493 = alloca i64
  %_i7492 = alloca i64
  %_a_chars7509 = alloca { i64, [0 x i64] }*
  %_b_chars7513 = alloca { i64, [0 x i64] }*
  %_last_char_a7517 = alloca i64
  %_last_char_b7524 = alloca i64
  %_prev_lcs7540 = alloca i8*
  %_next_char7562 = alloca i8*
  %_left_lcs7571 = alloca i8*
  %_right_lcs7582 = alloca i8*
  %_left_len7593 = alloca i64
  %_right_len7597 = alloca i64
  store i8* %b, i8** %_b7495
  store i8* %a, i8** %_a7494
  store i64 %j, i64* %_j7493
  store i64 %i, i64* %_i7492
  %_id7500 = load i64, i64* %_i7492
  %_bop7502 = icmp slt i64 %_id7500, 0
  %_id7503 = load i64, i64* %_j7493
  %_bop7505 = icmp slt i64 %_id7503, 0
  %_bop7506 = or i1 %_bop7502, %_bop7505
  %_test7499 = icmp eq i1 %_bop7506, 0
  br i1 %_test7499, label %_else7497, label %_then7496
_then7496:
  %_str7508 = bitcast [1 x i8]* @_str7507 to i8*
  ret i8* %_str7508
_else7497:
  br label %_merge7498
_merge7498:
  %_id7511 = load i8*, i8** %_a7494
  %_fun7510 = call { i64, [0 x i64] }* @array_of_string(i8* %_id7511)
  store { i64, [0 x i64] }* %_fun7510, { i64, [0 x i64] }** %_a_chars7509
  %_id7515 = load i8*, i8** %_b7495
  %_fun7514 = call { i64, [0 x i64] }* @array_of_string(i8* %_id7515)
  store { i64, [0 x i64] }* %_fun7514, { i64, [0 x i64] }** %_b_chars7513
  %_id7518 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a_chars7509
  %_id7520 = load i64, i64* %_i7492
  %_ptr7522 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7518, i32 0, i32 1, i64 %_id7520
  %_load7523 = load i64, i64* %_ptr7522
  store i64 %_load7523, i64* %_last_char_a7517
  %_id7525 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_b_chars7513
  %_id7527 = load i64, i64* %_j7493
  %_ptr7529 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7525, i32 0, i32 1, i64 %_id7527
  %_load7530 = load i64, i64* %_ptr7529
  store i64 %_load7530, i64* %_last_char_b7524
  %_id7535 = load i64, i64* %_last_char_a7517
  %_id7537 = load i64, i64* %_last_char_b7524
  %_bop7539 = icmp eq i64 %_id7535, %_id7537
  %_test7534 = icmp eq i1 %_bop7539, 0
  br i1 %_test7534, label %_else7532, label %_then7531
_then7531:
  %_id7542 = load i8*, i8** %_b7495
  %_id7544 = load i8*, i8** %_a7494
  %_id7546 = load i64, i64* %_j7493
  %_bop7548 = sub i64 %_id7546, 1
  %_id7549 = load i64, i64* %_i7492
  %_bop7551 = sub i64 %_id7549, 1
  %_fun7541 = call i8* @lcs(i8* %_bop7551, i8* %_bop7548, i64 %_id7544, i64 %_id7542)
  store i8* %_fun7541, i8** %_prev_lcs7540
  %_id7552 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a_chars7509
  %_id7554 = load i64, i64* %_i7492
  %_ptr7556 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7552, i32 0, i32 1, i64 %_id7554
  %_load7557 = load i64, i64* %_ptr7556
  %_bitcast7559 = bitcast { i64, [1 x i64] }* @buf to { i64, [0 x i64] }*
  %_gep7561 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_bitcast7559, i32 0, i32 1, i32 0
  store i64 %_load7557, i64* %_gep7561
  %_bitcast7565 = bitcast { i64, [1 x i64] }* @buf to { i64, [0 x i64] }*
  %_fun7563 = call i8* @string_of_array({ i64, [0 x i64] }* %_bitcast7565)
  store i8* %_fun7563, i8** %_next_char7562
  %_id7567 = load i8*, i8** %_next_char7562
  %_id7569 = load i8*, i8** %_prev_lcs7540
  %_fun7566 = call i8* @string_cat(i8* %_id7569, i8* %_id7567)
  ret i8* %_fun7566
_else7532:
  br label %_merge7533
_merge7533:
  %_id7573 = load i8*, i8** %_b7495
  %_id7575 = load i8*, i8** %_a7494
  %_id7577 = load i64, i64* %_j7493
  %_bop7579 = sub i64 %_id7577, 1
  %_id7580 = load i64, i64* %_i7492
  %_fun7572 = call i8* @lcs(i8* %_id7580, i8* %_bop7579, i64 %_id7575, i64 %_id7573)
  store i8* %_fun7572, i8** %_left_lcs7571
  %_id7584 = load i8*, i8** %_b7495
  %_id7586 = load i8*, i8** %_a7494
  %_id7588 = load i64, i64* %_j7493
  %_id7590 = load i64, i64* %_i7492
  %_bop7592 = sub i64 %_id7590, 1
  %_fun7583 = call i8* @lcs(i8* %_bop7592, i8* %_id7588, i64 %_id7586, i64 %_id7584)
  store i8* %_fun7583, i8** %_right_lcs7582
  %_id7595 = load i8*, i8** %_left_lcs7571
  %_fun7594 = call i64 @length_of_string(i8* %_id7595)
  store i64 %_fun7594, i64* %_left_len7593
  %_id7599 = load i8*, i8** %_right_lcs7582
  %_fun7598 = call i64 @length_of_string(i8* %_id7599)
  store i64 %_fun7598, i64* %_right_len7597
  %_id7605 = load i64, i64* %_left_len7593
  %_id7607 = load i64, i64* %_right_len7597
  %_bop7609 = icmp slt i64 %_id7605, %_id7607
  %_test7604 = icmp eq i1 %_bop7609, 0
  br i1 %_test7604, label %_else7602, label %_then7601
_then7601:
  %_id7610 = load i8*, i8** %_right_lcs7582
  ret i8* %_id7610
_else7602:
  %_id7612 = load i8*, i8** %_left_lcs7571
  ret i8* %_id7612
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv7479 = alloca { i64, [0 x i8*] }*
  %_argc7478 = alloca i64
  %_tomato7480 = alloca i8*
  %_orating7483 = alloca i8*
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv7479
  store i64 %argc, i64* %_argc7478
  %_str7482 = bitcast [7 x i8]* @_str7481 to i8*
  store i8* %_str7482, i8** %_tomato7480
  %_str7485 = bitcast [8 x i8]* @_str7484 to i8*
  store i8* %_str7485, i8** %_orating7483
  %_id7488 = load i8*, i8** %_orating7483
  %_id7490 = load i8*, i8** %_tomato7480
  %_fun7487 = call i8* @lcs(i8* 5, i8* 6, i64 %_id7490, i64 %_id7488)
  call void @print_string(i8* %_fun7487)
  ret i64 0
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
