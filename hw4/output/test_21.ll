; generated from: atprograms/binary_search.oat
target triple = "x86_64-apple-macosx10.10.0"
@_str4436 = global [9 x i8] c"Correct!\00"

define i64 @euclid_division(i64 %numerator, i64 %denominator) {
  %_denominator4505 = alloca i64
  %_numerator4504 = alloca i64
  %_quotient4520 = alloca i64
  %_remainder4521 = alloca i64
  store i64 %denominator, i64* %_denominator4505
  store i64 %numerator, i64* %_numerator4504
  %_id4510 = load i64, i64* %_denominator4505
  %_bop4512 = icmp slt i64 %_id4510, 0
  %_test4509 = icmp eq i1 %_bop4512, 0
  br i1 %_test4509, label %_else4507, label %_then4506
_then4506:
  %_id4514 = load i64, i64* %_denominator4505
  %_uop4516 = sub i64 0, %_id4514
  %_id4517 = load i64, i64* %_numerator4504
  %_fun4513 = call i64 @euclid_division(i64 %_id4517, i64 %_uop4516)
  %_uop4519 = sub i64 0, %_fun4513
  ret i64 %_uop4519
_else4507:
  br label %_merge4508
_merge4508:
  store i64 0, i64* %_quotient4520
  %_id4522 = load i64, i64* %_numerator4504
  store i64 %_id4522, i64* %_remainder4521
  %_id4528 = load i64, i64* %_numerator4504
  %_bop4530 = icmp slt i64 %_id4528, 0
  %_test4527 = icmp eq i1 %_bop4530, 0
  br i1 %_test4527, label %_else4525, label %_then4524
_then4524:
  %_id4531 = load i64, i64* %_numerator4504
  %_uop4533 = sub i64 0, %_id4531
  store i64 %_uop4533, i64* %_remainder4521
  br label %_pre4537
_pre4537:
  %_id4538 = load i64, i64* %_remainder4521
  %_id4540 = load i64, i64* %_denominator4505
  %_bop4542 = icmp sge i64 %_id4538, %_id4540
  %_test4534 = icmp eq i1 %_bop4542, 0
  br i1 %_test4534, label %_post4535, label %_body4536
_body4536:
  %_id4543 = load i64, i64* %_quotient4520
  %_bop4545 = add i64 %_id4543, 1
  store i64 %_bop4545, i64* %_quotient4520
  %_id4546 = load i64, i64* %_remainder4521
  %_id4548 = load i64, i64* %_denominator4505
  %_bop4550 = sub i64 %_id4546, %_id4548
  store i64 %_bop4550, i64* %_remainder4521
  br label %_pre4537
_post4535:
  %_id4555 = load i64, i64* %_remainder4521
  %_bop4557 = icmp eq i64 %_id4555, 0
  %_test4554 = icmp eq i1 %_bop4557, 0
  br i1 %_test4554, label %_else4552, label %_then4551
_then4551:
  %_id4558 = load i64, i64* %_quotient4520
  %_uop4560 = sub i64 0, %_id4558
  ret i64 %_uop4560
_else4552:
  %_id4561 = load i64, i64* %_quotient4520
  %_uop4563 = sub i64 0, %_id4561
  %_bop4564 = sub i64 %_uop4563, 1
  ret i64 %_bop4564
_merge4553:
  br label %_merge4526
_else4525:
  br label %_merge4526
_merge4526:
  br label %_pre4568
_pre4568:
  %_id4569 = load i64, i64* %_remainder4521
  %_id4571 = load i64, i64* %_denominator4505
  %_bop4573 = icmp sge i64 %_id4569, %_id4571
  %_test4565 = icmp eq i1 %_bop4573, 0
  br i1 %_test4565, label %_post4566, label %_body4567
_body4567:
  %_id4574 = load i64, i64* %_quotient4520
  %_bop4576 = add i64 %_id4574, 1
  store i64 %_bop4576, i64* %_quotient4520
  %_id4577 = load i64, i64* %_remainder4521
  %_id4579 = load i64, i64* %_denominator4505
  %_bop4581 = sub i64 %_id4577, %_id4579
  store i64 %_bop4581, i64* %_remainder4521
  br label %_pre4568
_post4566:
  %_id4582 = load i64, i64* %_quotient4520
  ret i64 %_id4582
}

define i1 @binary_search({ i64, [0 x i64] }* %input, i64 %key, i64 %min, i64 %max) {
  %_max4441 = alloca i64
  %_min4440 = alloca i64
  %_key4439 = alloca i64
  %_input4438 = alloca { i64, [0 x i64] }*
  %_midpt4451 = alloca i64
  store i64 %max, i64* %_max4441
  store i64 %min, i64* %_min4440
  store i64 %key, i64* %_key4439
  store { i64, [0 x i64] }* %input, { i64, [0 x i64] }** %_input4438
  %_id4446 = load i64, i64* %_max4441
  %_id4448 = load i64, i64* %_min4440
  %_bop4450 = icmp slt i64 %_id4446, %_id4448
  %_test4445 = icmp eq i1 %_bop4450, 0
  br i1 %_test4445, label %_else4443, label %_then4442
_then4442:
  ret i1 0
_else4443:
  br label %_merge4444
_merge4444:
  %_id4453 = load i64, i64* %_max4441
  %_id4455 = load i64, i64* %_min4440
  %_bop4457 = add i64 %_id4453, %_id4455
  %_fun4452 = call i64 @euclid_division(i64 %_bop4457, i64 2)
  store i64 %_fun4452, i64* %_midpt4451
  %_id4462 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_input4438
  %_id4464 = load i64, i64* %_midpt4451
  %_ptr4466 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id4462, i32 0, i32 1, i64 %_id4464
  %_load4467 = load i64, i64* %_ptr4466
  %_id4468 = load i64, i64* %_key4439
  %_bop4470 = icmp sgt i64 %_load4467, %_id4468
  %_test4461 = icmp eq i1 %_bop4470, 0
  br i1 %_test4461, label %_else4459, label %_then4458
_then4458:
  %_id4472 = load i64, i64* %_midpt4451
  %_bop4474 = sub i64 %_id4472, 1
  %_id4475 = load i64, i64* %_min4440
  %_id4477 = load i64, i64* %_key4439
  %_id4479 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_input4438
  %_fun4471 = call i1 @binary_search(i64 %_id4479, i64 %_id4477, i64 %_id4475, { i64, [0 x i64] }* %_bop4474)
  ret i1 %_fun4471
_else4459:
  br label %_merge4460
_merge4460:
  %_id4485 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_input4438
  %_id4487 = load i64, i64* %_midpt4451
  %_ptr4489 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id4485, i32 0, i32 1, i64 %_id4487
  %_load4490 = load i64, i64* %_ptr4489
  %_id4491 = load i64, i64* %_key4439
  %_bop4493 = icmp slt i64 %_load4490, %_id4491
  %_test4484 = icmp eq i1 %_bop4493, 0
  br i1 %_test4484, label %_else4482, label %_then4481
_then4481:
  %_id4495 = load i64, i64* %_max4441
  %_id4497 = load i64, i64* %_midpt4451
  %_bop4499 = add i64 %_id4497, 1
  %_id4500 = load i64, i64* %_key4439
  %_id4502 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_input4438
  %_fun4494 = call i1 @binary_search(i64 %_id4502, i64 %_id4500, i64 %_bop4499, { i64, [0 x i64] }* %_id4495)
  ret i1 %_fun4494
_else4482:
  ret i1 1
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv4386 = alloca { i64, [0 x i8*] }*
  %_argc4385 = alloca i64
  %_test_array4387 = alloca { i64, [0 x i64] }*
  %_i4390 = alloca i64
  %_even4411 = alloca i1
  %_odd4415 = alloca i1
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv4386
  store i64 %argc, i64* %_argc4385
  %_raw_array4388 = call { i64, [0 x i64] }* @oat_alloc_array(i64 100)
  %_array4389 = bitcast { i64, [0 x i64] }* %_raw_array4388 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array4389, { i64, [0 x i64] }** %_test_array4387
  store i64 0, i64* %_i4390
  br label %_pre4394
_pre4394:
  %_id4398 = load i64, i64* %_i4390
  %_bop4400 = icmp slt i64 %_id4398, 100
  %_test4391 = icmp eq i1 %_bop4400, 0
  br i1 %_test4391, label %_post4392, label %_body4393
_body4393:
  %_id4401 = load i64, i64* %_i4390
  %_bop4403 = mul i64 2, %_id4401
  %_bop4404 = add i64 %_bop4403, 1
  %_id4405 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_test_array4387
  %_id4407 = load i64, i64* %_i4390
  %_gep4410 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id4405, i32 0, i32 1, i64 %_id4407
  store i64 %_bop4404, i64* %_gep4410
  %_id4395 = load i64, i64* %_i4390
  %_bop4397 = add i64 %_id4395, 1
  store i64 %_bop4397, i64* %_i4390
  br label %_pre4394
_post4392:
  %_id4413 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_test_array4387
  %_fun4412 = call i1 @binary_search(i64 %_id4413, i64 80, i64 0, { i64, [0 x i64] }* 99)
  store i1 %_fun4412, i1* %_even4411
  %_id4417 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_test_array4387
  %_fun4416 = call i1 @binary_search(i64 %_id4417, i64 81, i64 0, { i64, [0 x i64] }* 99)
  store i1 %_fun4416, i1* %_odd4415
  %_id4423 = load i1, i1* %_even4411
  %_id4425 = load i1, i1* %_odd4415
  %_bop4427 = and i1 %_id4423, %_id4425
  %_uop4428 = xor i1 1, %_bop4427
  %_id4429 = load i1, i1* %_even4411
  %_id4431 = load i1, i1* %_odd4415
  %_bop4433 = or i1 %_id4429, %_id4431
  %_bop4434 = and i1 %_uop4428, %_bop4433
  %_test4422 = icmp eq i1 %_bop4434, 0
  br i1 %_test4422, label %_else4420, label %_then4419
_then4419:
  %_str4437 = bitcast [9 x i8]* @_str4436 to i8*
  call void @print_string(i8* %_str4437)
  br label %_merge4421
_else4420:
  br label %_merge4421
_merge4421:
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
