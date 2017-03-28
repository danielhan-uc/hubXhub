; generated from: atprograms/msort.oat
target triple = "x86_64-apple-macosx10.10.0"
@_str3622 = global [2 x i8] c" \00"
@_str3629 = global [2 x i8] c" \00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv3589 = alloca { i64, [0 x i8*] }*
  %_argc3588 = alloca i64
  %_i3590 = alloca i64
  %_a3591 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv3589
  store i64 %argc, i64* %_argc3588
  store i64 0, i64* %_i3590
  %_raw_array3592 = call { i64, [0 x i64] }* @oat_alloc_array(i64 10)
  %_array3593 = bitcast { i64, [0 x i64] }* %_raw_array3592 to { i64, [0 x i64] }*
  %_elt3594 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3593, i32 0, i32 1, i32 0
  store i64 126, i64* %_elt3594
  %_elt3596 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3593, i32 0, i32 1, i32 1
  store i64 125, i64* %_elt3596
  %_elt3598 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3593, i32 0, i32 1, i32 2
  store i64 124, i64* %_elt3598
  %_elt3600 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3593, i32 0, i32 1, i32 3
  store i64 123, i64* %_elt3600
  %_elt3602 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3593, i32 0, i32 1, i32 4
  store i64 122, i64* %_elt3602
  %_elt3604 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3593, i32 0, i32 1, i32 5
  store i64 121, i64* %_elt3604
  %_elt3606 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3593, i32 0, i32 1, i32 6
  store i64 120, i64* %_elt3606
  %_elt3608 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3593, i32 0, i32 1, i32 7
  store i64 119, i64* %_elt3608
  %_elt3610 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3593, i32 0, i32 1, i32 8
  store i64 118, i64* %_elt3610
  %_elt3612 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3593, i32 0, i32 1, i32 9
  store i64 117, i64* %_elt3612
  store { i64, [0 x i64] }* %_array3593, { i64, [0 x i64] }** %_a3591
  %_id3616 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3591
  %_fun3615 = call i8* @string_of_array({ i64, [0 x i64] }* %_id3616)
  call void @print_string(i8* %_fun3615)
  %_id3619 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3591
  call void @oat_mergesort(i64 %_id3619, i64 0, { i64, [0 x i64] }* 9)
  %_str3623 = bitcast [2 x i8]* @_str3622 to i8*
  call void @print_string(i8* %_str3623)
  %_id3626 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3591
  %_fun3625 = call i8* @string_of_array({ i64, [0 x i64] }* %_id3626)
  call void @print_string(i8* %_fun3625)
  %_str3630 = bitcast [2 x i8]* @_str3629 to i8*
  call void @print_string(i8* %_str3630)
  %_id3631 = load i64, i64* %_i3590
  ret i64 %_id3631
}

define void @oat_mergesort({ i64, [0 x i64] }* %a, i64 %low, i64 %high) {
  %_high3547 = alloca i64
  %_low3546 = alloca i64
  %_a3545 = alloca { i64, [0 x i64] }*
  %_mid3548 = alloca i64
  store i64 %high, i64* %_high3547
  store i64 %low, i64* %_low3546
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_a3545
  store i64 0, i64* %_mid3548
  %_id3553 = load i64, i64* %_low3546
  %_id3555 = load i64, i64* %_high3547
  %_bop3557 = icmp slt i64 %_id3553, %_id3555
  %_test3552 = icmp eq i1 %_bop3557, 0
  br i1 %_test3552, label %_else3550, label %_then3549
_then3549:
  %_id3558 = load i64, i64* %_low3546
  %_id3560 = load i64, i64* %_high3547
  %_bop3562 = add i64 %_id3558, %_id3560
  %_bop3563 = lshr i64 %_bop3562, 1
  store i64 %_bop3563, i64* %_mid3548
  %_id3565 = load i64, i64* %_mid3548
  %_id3567 = load i64, i64* %_low3546
  %_id3569 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3545
  call void @oat_mergesort(i64 %_id3569, i64 %_id3567, { i64, [0 x i64] }* %_id3565)
  %_id3572 = load i64, i64* %_high3547
  %_id3574 = load i64, i64* %_mid3548
  %_bop3576 = add i64 %_id3574, 1
  %_id3577 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3545
  call void @oat_mergesort(i64 %_id3577, i64 %_bop3576, { i64, [0 x i64] }* %_id3572)
  %_id3580 = load i64, i64* %_mid3548
  %_id3582 = load i64, i64* %_high3547
  %_id3584 = load i64, i64* %_low3546
  %_id3586 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3545
  call void @merge(i64 %_id3586, i64 %_id3584, i64 %_id3582, { i64, [0 x i64] }* %_id3580)
  br label %_merge3551
_else3550:
  br label %_merge3551
_merge3551:
  ret void
}

define void @merge({ i64, [0 x i64] }* %a, i64 %low, i64 %high, i64 %mid) {
  %_mid3383 = alloca i64
  %_high3382 = alloca i64
  %_low3381 = alloca i64
  %_a3380 = alloca { i64, [0 x i64] }*
  %_i3384 = alloca i64
  %_j3385 = alloca i64
  %_k3386 = alloca i64
  %_c3387 = alloca { i64, [0 x i64] }*
  store i64 %mid, i64* %_mid3383
  store i64 %high, i64* %_high3382
  store i64 %low, i64* %_low3381
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_a3380
  store i64 0, i64* %_i3384
  store i64 0, i64* %_j3385
  store i64 0, i64* %_k3386
  %_raw_array3388 = call { i64, [0 x i64] }* @oat_alloc_array(i64 50)
  %_array3389 = bitcast { i64, [0 x i64] }* %_raw_array3388 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array3389, { i64, [0 x i64] }** %_c3387
  %_id3390 = load i64, i64* %_low3381
  store i64 %_id3390, i64* %_i3384
  %_id3392 = load i64, i64* %_mid3383
  %_bop3394 = add i64 %_id3392, 1
  store i64 %_bop3394, i64* %_j3385
  %_id3395 = load i64, i64* %_low3381
  store i64 %_id3395, i64* %_k3386
  br label %_pre3400
_pre3400:
  %_id3401 = load i64, i64* %_i3384
  %_id3403 = load i64, i64* %_mid3383
  %_bop3405 = icmp sle i64 %_id3401, %_id3403
  %_id3406 = load i64, i64* %_j3385
  %_id3408 = load i64, i64* %_high3382
  %_bop3410 = icmp sle i64 %_id3406, %_id3408
  %_bop3411 = and i1 %_bop3405, %_bop3410
  %_test3397 = icmp eq i1 %_bop3411, 0
  br i1 %_test3397, label %_post3398, label %_body3399
_body3399:
  %_id3416 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3380
  %_id3418 = load i64, i64* %_i3384
  %_ptr3420 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3416, i32 0, i32 1, i64 %_id3418
  %_load3421 = load i64, i64* %_ptr3420
  %_id3422 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3380
  %_id3424 = load i64, i64* %_j3385
  %_ptr3426 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3422, i32 0, i32 1, i64 %_id3424
  %_load3427 = load i64, i64* %_ptr3426
  %_bop3428 = icmp slt i64 %_load3421, %_load3427
  %_test3415 = icmp eq i1 %_bop3428, 0
  br i1 %_test3415, label %_else3413, label %_then3412
_then3412:
  %_id3429 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3380
  %_id3431 = load i64, i64* %_i3384
  %_ptr3433 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3429, i32 0, i32 1, i64 %_id3431
  %_load3434 = load i64, i64* %_ptr3433
  %_id3435 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3387
  %_id3437 = load i64, i64* %_k3386
  %_gep3440 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3435, i32 0, i32 1, i64 %_id3437
  store i64 %_load3434, i64* %_gep3440
  %_id3441 = load i64, i64* %_k3386
  %_bop3443 = add i64 %_id3441, 1
  store i64 %_bop3443, i64* %_k3386
  %_id3444 = load i64, i64* %_i3384
  %_bop3446 = add i64 %_id3444, 1
  store i64 %_bop3446, i64* %_i3384
  br label %_merge3414
_else3413:
  %_id3447 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3380
  %_id3449 = load i64, i64* %_j3385
  %_ptr3451 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3447, i32 0, i32 1, i64 %_id3449
  %_load3452 = load i64, i64* %_ptr3451
  %_id3453 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3387
  %_id3455 = load i64, i64* %_k3386
  %_gep3458 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3453, i32 0, i32 1, i64 %_id3455
  store i64 %_load3452, i64* %_gep3458
  %_id3459 = load i64, i64* %_k3386
  %_bop3461 = add i64 %_id3459, 1
  store i64 %_bop3461, i64* %_k3386
  %_id3462 = load i64, i64* %_j3385
  %_bop3464 = add i64 %_id3462, 1
  store i64 %_bop3464, i64* %_j3385
  br label %_merge3414
_merge3414:
  br label %_pre3400
_post3398:
  br label %_pre3468
_pre3468:
  %_id3469 = load i64, i64* %_i3384
  %_id3471 = load i64, i64* %_mid3383
  %_bop3473 = icmp sle i64 %_id3469, %_id3471
  %_test3465 = icmp eq i1 %_bop3473, 0
  br i1 %_test3465, label %_post3466, label %_body3467
_body3467:
  %_id3474 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3380
  %_id3476 = load i64, i64* %_i3384
  %_ptr3478 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3474, i32 0, i32 1, i64 %_id3476
  %_load3479 = load i64, i64* %_ptr3478
  %_id3480 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3387
  %_id3482 = load i64, i64* %_k3386
  %_gep3485 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3480, i32 0, i32 1, i64 %_id3482
  store i64 %_load3479, i64* %_gep3485
  %_id3486 = load i64, i64* %_k3386
  %_bop3488 = add i64 %_id3486, 1
  store i64 %_bop3488, i64* %_k3386
  %_id3489 = load i64, i64* %_i3384
  %_bop3491 = add i64 %_id3489, 1
  store i64 %_bop3491, i64* %_i3384
  br label %_pre3468
_post3466:
  br label %_pre3495
_pre3495:
  %_id3496 = load i64, i64* %_j3385
  %_id3498 = load i64, i64* %_high3382
  %_bop3500 = icmp sle i64 %_id3496, %_id3498
  %_test3492 = icmp eq i1 %_bop3500, 0
  br i1 %_test3492, label %_post3493, label %_body3494
_body3494:
  %_id3501 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3380
  %_id3503 = load i64, i64* %_j3385
  %_ptr3505 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3501, i32 0, i32 1, i64 %_id3503
  %_load3506 = load i64, i64* %_ptr3505
  %_id3507 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3387
  %_id3509 = load i64, i64* %_k3386
  %_gep3512 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3507, i32 0, i32 1, i64 %_id3509
  store i64 %_load3506, i64* %_gep3512
  %_id3513 = load i64, i64* %_k3386
  %_bop3515 = add i64 %_id3513, 1
  store i64 %_bop3515, i64* %_k3386
  %_id3516 = load i64, i64* %_j3385
  %_bop3518 = add i64 %_id3516, 1
  store i64 %_bop3518, i64* %_j3385
  br label %_pre3495
_post3493:
  %_id3519 = load i64, i64* %_low3381
  store i64 %_id3519, i64* %_i3384
  br label %_pre3524
_pre3524:
  %_id3528 = load i64, i64* %_i3384
  %_id3530 = load i64, i64* %_k3386
  %_bop3532 = icmp slt i64 %_id3528, %_id3530
  %_test3521 = icmp eq i1 %_bop3532, 0
  br i1 %_test3521, label %_post3522, label %_body3523
_body3523:
  %_id3533 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3387
  %_id3535 = load i64, i64* %_i3384
  %_ptr3537 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3533, i32 0, i32 1, i64 %_id3535
  %_load3538 = load i64, i64* %_ptr3537
  %_id3539 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3380
  %_id3541 = load i64, i64* %_i3384
  %_gep3544 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3539, i32 0, i32 1, i64 %_id3541
  store i64 %_load3538, i64* %_gep3544
  %_id3525 = load i64, i64* %_i3384
  %_bop3527 = add i64 %_id3525, 1
  store i64 %_bop3527, i64* %_i3384
  br label %_pre3524
_post3522:
  ret void
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
