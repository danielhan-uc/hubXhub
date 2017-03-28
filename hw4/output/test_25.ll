; generated from: atprograms/heap.oat
target triple = "x86_64-apple-macosx10.10.0"
define void @min_heapify({ i64, [0 x i64] }* %array, i64 %i, i64 %len) {
  %_len5679 = alloca i64
  %_i5678 = alloca i64
  %_array5677 = alloca { i64, [0 x i64] }*
  %_l5680 = alloca i64
  %_r5684 = alloca i64
  %_tmp5688 = alloca i64
  %_m5689 = alloca i64
  store i64 %len, i64* %_len5679
  store i64 %i, i64* %_i5678
  store { i64, [0 x i64] }* %array, { i64, [0 x i64] }** %_array5677
  %_id5681 = load i64, i64* %_i5678
  %_bop5683 = mul i64 %_id5681, 2
  store i64 %_bop5683, i64* %_l5680
  %_id5685 = load i64, i64* %_i5678
  %_bop5687 = add i64 %_id5685, 1
  store i64 %_bop5687, i64* %_r5684
  store i64 0, i64* %_tmp5688
  %_id5690 = load i64, i64* %_i5678
  store i64 %_id5690, i64* %_m5689
  %_id5696 = load i64, i64* %_l5680
  %_id5698 = load i64, i64* %_len5679
  %_bop5700 = icmp slt i64 %_id5696, %_id5698
  %_test5695 = icmp eq i1 %_bop5700, 0
  br i1 %_test5695, label %_else5693, label %_then5692
_then5692:
  %_id5705 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5677
  %_id5707 = load i64, i64* %_l5680
  %_ptr5709 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5705, i32 0, i32 1, i64 %_id5707
  %_load5710 = load i64, i64* %_ptr5709
  %_id5711 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5677
  %_id5713 = load i64, i64* %_m5689
  %_ptr5715 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5711, i32 0, i32 1, i64 %_id5713
  %_load5716 = load i64, i64* %_ptr5715
  %_bop5717 = icmp sgt i64 %_load5710, %_load5716
  %_test5704 = icmp eq i1 %_bop5717, 0
  br i1 %_test5704, label %_else5702, label %_then5701
_then5701:
  %_id5718 = load i64, i64* %_l5680
  store i64 %_id5718, i64* %_m5689
  br label %_merge5703
_else5702:
  br label %_merge5703
_merge5703:
  br label %_merge5694
_else5693:
  br label %_merge5694
_merge5694:
  %_id5724 = load i64, i64* %_r5684
  %_id5726 = load i64, i64* %_len5679
  %_bop5728 = icmp slt i64 %_id5724, %_id5726
  %_test5723 = icmp eq i1 %_bop5728, 0
  br i1 %_test5723, label %_else5721, label %_then5720
_then5720:
  %_id5733 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5677
  %_id5735 = load i64, i64* %_r5684
  %_ptr5737 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5733, i32 0, i32 1, i64 %_id5735
  %_load5738 = load i64, i64* %_ptr5737
  %_id5739 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5677
  %_id5741 = load i64, i64* %_m5689
  %_ptr5743 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5739, i32 0, i32 1, i64 %_id5741
  %_load5744 = load i64, i64* %_ptr5743
  %_bop5745 = icmp sgt i64 %_load5738, %_load5744
  %_test5732 = icmp eq i1 %_bop5745, 0
  br i1 %_test5732, label %_else5730, label %_then5729
_then5729:
  %_id5746 = load i64, i64* %_r5684
  store i64 %_id5746, i64* %_m5689
  br label %_merge5731
_else5730:
  br label %_merge5731
_merge5731:
  br label %_merge5722
_else5721:
  br label %_merge5722
_merge5722:
  %_id5752 = load i64, i64* %_m5689
  %_id5754 = load i64, i64* %_i5678
  %_bop5756 = icmp ne i64 %_id5752, %_id5754
  %_test5751 = icmp eq i1 %_bop5756, 0
  br i1 %_test5751, label %_else5749, label %_then5748
_then5748:
  %_id5757 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5677
  %_id5759 = load i64, i64* %_i5678
  %_ptr5761 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5757, i32 0, i32 1, i64 %_id5759
  %_load5762 = load i64, i64* %_ptr5761
  store i64 %_load5762, i64* %_tmp5688
  %_id5763 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5677
  %_id5765 = load i64, i64* %_m5689
  %_ptr5767 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5763, i32 0, i32 1, i64 %_id5765
  %_load5768 = load i64, i64* %_ptr5767
  %_id5769 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5677
  %_id5771 = load i64, i64* %_i5678
  %_gep5774 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5769, i32 0, i32 1, i64 %_id5771
  store i64 %_load5768, i64* %_gep5774
  %_id5775 = load i64, i64* %_tmp5688
  %_id5777 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5677
  %_id5779 = load i64, i64* %_m5689
  %_gep5782 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5777, i32 0, i32 1, i64 %_id5779
  store i64 %_id5775, i64* %_gep5782
  %_id5784 = load i64, i64* %_len5679
  %_id5786 = load i64, i64* %_m5689
  %_id5788 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5677
  call void @min_heapify(i64 %_id5788, i64 %_id5786, { i64, [0 x i64] }* %_id5784)
  br label %_merge5750
_else5749:
  br label %_merge5750
_merge5750:
  ret void
}

define void @make_min_heap({ i64, [0 x i64] }* %array, i64 %len) {
  %_len5656 = alloca i64
  %_array5655 = alloca { i64, [0 x i64] }*
  %_i5659 = alloca i64
  store i64 %len, i64* %_len5656
  store { i64, [0 x i64] }* %array, { i64, [0 x i64] }** %_array5655
  %_id5657 = load i64, i64* %_len5656
  store i64 %_id5657, i64* %_i5659
  br label %_pre5663
_pre5663:
  %_id5667 = load i64, i64* %_i5659
  %_bop5669 = icmp sge i64 %_id5667, 1
  %_test5660 = icmp eq i1 %_bop5669, 0
  br i1 %_test5660, label %_post5661, label %_body5662
_body5662:
  %_id5671 = load i64, i64* %_len5656
  %_id5673 = load i64, i64* %_i5659
  %_id5675 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5655
  call void @min_heapify(i64 %_id5675, i64 %_id5673, { i64, [0 x i64] }* %_id5671)
  %_id5664 = load i64, i64* %_i5659
  %_bop5666 = sub i64 %_id5664, 1
  store i64 %_bop5666, i64* %_i5659
  br label %_pre5663
_post5661:
  ret void
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv5570 = alloca { i64, [0 x i8*] }*
  %_argc5569 = alloca i64
  %_array5571 = alloca { i64, [0 x i64] }*
  %_end_result5596 = alloca { i64, [0 x i64] }*
  %_same5624 = alloca i64
  %_i5625 = alloca i64
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv5570
  store i64 %argc, i64* %_argc5569
  %_raw_array5572 = call { i64, [0 x i64] }* @oat_alloc_array(i64 11)
  %_array5573 = bitcast { i64, [0 x i64] }* %_raw_array5572 to { i64, [0 x i64] }*
  %_elt5574 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5573, i32 0, i32 1, i32 0
  store i64 0, i64* %_elt5574
  %_elt5576 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5573, i32 0, i32 1, i32 1
  store i64 9, i64* %_elt5576
  %_elt5578 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5573, i32 0, i32 1, i32 2
  store i64 1, i64* %_elt5578
  %_elt5580 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5573, i32 0, i32 1, i32 3
  store i64 2, i64* %_elt5580
  %_elt5582 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5573, i32 0, i32 1, i32 4
  store i64 8, i64* %_elt5582
  %_elt5584 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5573, i32 0, i32 1, i32 5
  store i64 10, i64* %_elt5584
  %_elt5586 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5573, i32 0, i32 1, i32 6
  store i64 7, i64* %_elt5586
  %_elt5588 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5573, i32 0, i32 1, i32 7
  store i64 3, i64* %_elt5588
  %_elt5590 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5573, i32 0, i32 1, i32 8
  store i64 6, i64* %_elt5590
  %_elt5592 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5573, i32 0, i32 1, i32 9
  store i64 4, i64* %_elt5592
  %_elt5594 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5573, i32 0, i32 1, i32 10
  store i64 5, i64* %_elt5594
  store { i64, [0 x i64] }* %_array5573, { i64, [0 x i64] }** %_array5571
  %_raw_array5597 = call { i64, [0 x i64] }* @oat_alloc_array(i64 11)
  %_array5598 = bitcast { i64, [0 x i64] }* %_raw_array5597 to { i64, [0 x i64] }*
  %_elt5599 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5598, i32 0, i32 1, i32 0
  store i64 0, i64* %_elt5599
  %_elt5601 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5598, i32 0, i32 1, i32 1
  store i64 1, i64* %_elt5601
  %_elt5603 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5598, i32 0, i32 1, i32 2
  store i64 4, i64* %_elt5603
  %_elt5605 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5598, i32 0, i32 1, i32 3
  store i64 2, i64* %_elt5605
  %_elt5607 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5598, i32 0, i32 1, i32 4
  store i64 8, i64* %_elt5607
  %_elt5609 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5598, i32 0, i32 1, i32 5
  store i64 5, i64* %_elt5609
  %_elt5611 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5598, i32 0, i32 1, i32 6
  store i64 7, i64* %_elt5611
  %_elt5613 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5598, i32 0, i32 1, i32 7
  store i64 3, i64* %_elt5613
  %_elt5615 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5598, i32 0, i32 1, i32 8
  store i64 6, i64* %_elt5615
  %_elt5617 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5598, i32 0, i32 1, i32 9
  store i64 9, i64* %_elt5617
  %_elt5619 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5598, i32 0, i32 1, i32 10
  store i64 10, i64* %_elt5619
  store { i64, [0 x i64] }* %_array5598, { i64, [0 x i64] }** %_end_result5596
  %_id5622 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5571
  call void @make_min_heap(i64 %_id5622, { i64, [0 x i64] }* 10)
  store i64 0, i64* %_same5624
  store i64 0, i64* %_i5625
  br label %_pre5629
_pre5629:
  %_id5633 = load i64, i64* %_i5625
  %_bop5635 = icmp slt i64 %_id5633, 11
  %_test5626 = icmp eq i1 %_bop5635, 0
  br i1 %_test5626, label %_post5627, label %_body5628
_body5628:
  %_id5640 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array5571
  %_id5642 = load i64, i64* %_i5625
  %_ptr5644 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5640, i32 0, i32 1, i64 %_id5642
  %_load5645 = load i64, i64* %_ptr5644
  %_id5646 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_end_result5596
  %_id5648 = load i64, i64* %_i5625
  %_ptr5650 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5646, i32 0, i32 1, i64 %_id5648
  %_load5651 = load i64, i64* %_ptr5650
  %_bop5652 = icmp ne i64 %_load5645, %_load5651
  %_test5639 = icmp eq i1 %_bop5652, 0
  br i1 %_test5639, label %_else5637, label %_then5636
_then5636:
  store i64 1, i64* %_same5624
  br label %_merge5638
_else5637:
  br label %_merge5638
_merge5638:
  %_id5630 = load i64, i64* %_i5625
  %_bop5632 = add i64 %_id5630, 1
  store i64 %_bop5632, i64* %_i5625
  br label %_pre5629
_post5627:
  %_id5653 = load i64, i64* %_same5624
  ret i64 %_id5653
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
