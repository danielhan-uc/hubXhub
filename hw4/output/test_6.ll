; generated from: atprograms/bubble_sort.oat
target triple = "x86_64-apple-macosx10.10.0"
define void @bubble_sort({ i64, [0 x i64] }* %arr, i64 %len) {
  %_len5493 = alloca i64
  %_arr5492 = alloca { i64, [0 x i64] }*
  %_swapped5494 = alloca i1
  %_i5501 = alloca i64
  %_temp5533 = alloca i64
  store i64 %len, i64* %_len5493
  store { i64, [0 x i64] }* %arr, { i64, [0 x i64] }** %_arr5492
  store i1 1, i1* %_swapped5494
  br label %_pre5498
_pre5498:
  %_id5499 = load i1, i1* %_swapped5494
  %_test5495 = icmp eq i1 %_id5499, 0
  br i1 %_test5495, label %_post5496, label %_body5497
_body5497:
  store i1 0, i1* %_swapped5494
  store i64 0, i64* %_i5501
  br label %_pre5505
_pre5505:
  %_id5509 = load i64, i64* %_i5501
  %_id5511 = load i64, i64* %_len5493
  %_bop5513 = sub i64 %_id5511, 1
  %_bop5514 = icmp slt i64 %_id5509, %_bop5513
  %_test5502 = icmp eq i1 %_bop5514, 0
  br i1 %_test5502, label %_post5503, label %_body5504
_body5504:
  %_id5519 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5492
  %_id5521 = load i64, i64* %_i5501
  %_ptr5523 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5519, i32 0, i32 1, i64 %_id5521
  %_load5524 = load i64, i64* %_ptr5523
  %_id5525 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5492
  %_id5527 = load i64, i64* %_i5501
  %_bop5529 = add i64 %_id5527, 1
  %_ptr5530 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5525, i32 0, i32 1, i64 %_bop5529
  %_load5531 = load i64, i64* %_ptr5530
  %_bop5532 = icmp sgt i64 %_load5524, %_load5531
  %_test5518 = icmp eq i1 %_bop5532, 0
  br i1 %_test5518, label %_else5516, label %_then5515
_then5515:
  %_id5534 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5492
  %_id5536 = load i64, i64* %_i5501
  %_ptr5538 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5534, i32 0, i32 1, i64 %_id5536
  %_load5539 = load i64, i64* %_ptr5538
  store i64 %_load5539, i64* %_temp5533
  %_id5540 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5492
  %_id5542 = load i64, i64* %_i5501
  %_bop5544 = add i64 %_id5542, 1
  %_ptr5545 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5540, i32 0, i32 1, i64 %_bop5544
  %_load5546 = load i64, i64* %_ptr5545
  %_id5547 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5492
  %_id5549 = load i64, i64* %_i5501
  %_gep5552 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5547, i32 0, i32 1, i64 %_id5549
  store i64 %_load5546, i64* %_gep5552
  %_id5553 = load i64, i64* %_temp5533
  %_id5555 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5492
  %_id5557 = load i64, i64* %_i5501
  %_bop5559 = add i64 %_id5557, 1
  %_gep5561 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5555, i32 0, i32 1, i64 %_bop5559
  store i64 %_id5553, i64* %_gep5561
  store i1 1, i1* %_swapped5494
  br label %_merge5517
_else5516:
  br label %_merge5517
_merge5517:
  %_id5506 = load i64, i64* %_i5501
  %_bop5508 = add i64 %_id5506, 1
  store i64 %_bop5508, i64* %_i5501
  br label %_pre5505
_post5503:
  br label %_pre5498
_post5496:
  ret void
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv5403 = alloca { i64, [0 x i8*] }*
  %_argc5402 = alloca i64
  %_arr5404 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i5407 = alloca i64
  %_j5426 = alloca i64
  %_val5453 = alloca i64
  %_i5454 = alloca i64
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv5403
  store i64 %argc, i64* %_argc5402
  %_raw_array5405 = call { i64, [0 x i64] }* @oat_alloc_array(i64 10)
  %_array5406 = bitcast { i64, [0 x i64] }* %_raw_array5405 to { i64, [0 x { i64, [0 x i64] }*] }*
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array5406, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5404
  store i64 0, i64* %_i5407
  br label %_pre5411
_pre5411:
  %_id5415 = load i64, i64* %_i5407
  %_bop5417 = icmp slt i64 %_id5415, 10
  %_test5408 = icmp eq i1 %_bop5417, 0
  br i1 %_test5408, label %_post5409, label %_body5410
_body5410:
  %_raw_array5418 = call { i64, [0 x i64] }* @oat_alloc_array(i64 10)
  %_array5419 = bitcast { i64, [0 x i64] }* %_raw_array5418 to { i64, [0 x i64] }*
  %_id5420 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5404
  %_id5422 = load i64, i64* %_i5407
  %_gep5425 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id5420, i32 0, i32 1, i64 %_id5422
  store { i64, [0 x i64] }* %_array5419, { i64, [0 x i64] }** %_gep5425
  store i64 0, i64* %_j5426
  br label %_pre5430
_pre5430:
  %_id5434 = load i64, i64* %_j5426
  %_bop5436 = icmp slt i64 %_id5434, 10
  %_test5427 = icmp eq i1 %_bop5436, 0
  br i1 %_test5427, label %_post5428, label %_body5429
_body5429:
  %_id5437 = load i64, i64* %_i5407
  %_bop5439 = mul i64 10, %_id5437
  %_id5440 = load i64, i64* %_j5426
  %_bop5442 = sub i64 %_bop5439, %_id5440
  %_id5443 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5404
  %_id5445 = load i64, i64* %_i5407
  %_ptr5447 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id5443, i32 0, i32 1, i64 %_id5445
  %_load5448 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr5447
  %_id5449 = load i64, i64* %_j5426
  %_gep5452 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load5448, i32 0, i32 1, i64 %_id5449
  store i64 %_bop5442, i64* %_gep5452
  %_id5431 = load i64, i64* %_j5426
  %_bop5433 = add i64 %_id5431, 1
  store i64 %_bop5433, i64* %_j5426
  br label %_pre5430
_post5428:
  %_id5412 = load i64, i64* %_i5407
  %_bop5414 = add i64 %_id5412, 1
  store i64 %_bop5414, i64* %_i5407
  br label %_pre5411
_post5409:
  store i64 0, i64* %_val5453
  store i64 0, i64* %_i5454
  br label %_pre5458
_pre5458:
  %_id5462 = load i64, i64* %_i5454
  %_bop5464 = icmp slt i64 %_id5462, 10
  %_test5455 = icmp eq i1 %_bop5464, 0
  br i1 %_test5455, label %_post5456, label %_body5457
_body5457:
  %_id5466 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5404
  %_id5468 = load i64, i64* %_i5454
  %_ptr5470 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id5466, i32 0, i32 1, i64 %_id5468
  %_load5471 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr5470
  call void @bubble_sort(i64 %_load5471, { i64, [0 x i64] }* 10)
  %_id5472 = load i64, i64* %_val5453
  %_id5474 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr5404
  %_id5476 = load i64, i64* %_i5454
  %_ptr5478 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id5474, i32 0, i32 1, i64 %_id5476
  %_load5479 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr5478
  %_id5480 = load i64, i64* %_i5454
  %_ptr5482 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load5479, i32 0, i32 1, i64 %_id5480
  %_load5483 = load i64, i64* %_ptr5482
  %_bop5484 = add i64 %_id5472, %_load5483
  store i64 %_bop5484, i64* %_val5453
  %_id5459 = load i64, i64* %_i5454
  %_bop5461 = add i64 %_id5459, 1
  store i64 %_bop5461, i64* %_i5454
  br label %_pre5458
_post5456:
  %_id5489 = load i64, i64* %_val5453
  %_bop5491 = icmp eq i64 %_id5489, 405
  %_test5488 = icmp eq i1 %_bop5491, 0
  br i1 %_test5488, label %_else5486, label %_then5485
_then5485:
  ret i64 1
_else5486:
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
