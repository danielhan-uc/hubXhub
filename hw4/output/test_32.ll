; generated from: atprograms/insertion_sort.oat
target triple = "x86_64-apple-macosx10.10.0"
define { i64, [0 x i64] }* @insert({ i64, [0 x i64] }* %partial, i64 %length, i64 %insertee) {
  %_insertee7688 = alloca i64
  %_length7687 = alloca i64
  %_partial7686 = alloca { i64, [0 x i64] }*
  %_inserted7689 = alloca { i64, [0 x i64] }*
  %_i7695 = alloca i64
  %_not_yet_inserted7716 = alloca i1
  %_i7734 = alloca i64
  store i64 %insertee, i64* %_insertee7688
  store i64 %length, i64* %_length7687
  store { i64, [0 x i64] }* %partial, { i64, [0 x i64] }** %_partial7686
  %_id7690 = load i64, i64* %_length7687
  %_bop7692 = add i64 %_id7690, 1
  %_raw_array7693 = call { i64, [0 x i64] }* @oat_alloc_array(i64 %_bop7692)
  %_array7694 = bitcast { i64, [0 x i64] }* %_raw_array7693 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array7694, { i64, [0 x i64] }** %_inserted7689
  store i64 0, i64* %_i7695
  br label %_pre7699
_pre7699:
  %_id7703 = load i64, i64* %_i7695
  %_id7705 = load i64, i64* %_length7687
  %_bop7707 = add i64 %_id7705, 1
  %_bop7708 = icmp slt i64 %_id7703, %_bop7707
  %_test7696 = icmp eq i1 %_bop7708, 0
  br i1 %_test7696, label %_post7697, label %_body7698
_body7698:
  %_uop7709 = sub i64 0, 1
  %_id7710 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted7689
  %_id7712 = load i64, i64* %_i7695
  %_gep7715 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7710, i32 0, i32 1, i64 %_id7712
  store i64 %_uop7709, i64* %_gep7715
  %_id7700 = load i64, i64* %_i7695
  %_bop7702 = add i64 %_id7700, 1
  store i64 %_bop7702, i64* %_i7695
  br label %_pre7699
_post7697:
  store i1 1, i1* %_not_yet_inserted7716
  %_id7721 = load i64, i64* %_insertee7688
  %_id7723 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_partial7686
  %_ptr7725 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7723, i32 0, i32 1, i32 0
  %_load7726 = load i64, i64* %_ptr7725
  %_bop7727 = icmp slt i64 %_id7721, %_load7726
  %_test7720 = icmp eq i1 %_bop7727, 0
  br i1 %_test7720, label %_else7718, label %_then7717
_then7717:
  store i1 0, i1* %_not_yet_inserted7716
  %_id7728 = load i64, i64* %_insertee7688
  %_id7730 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted7689
  %_gep7733 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7730, i32 0, i32 1, i32 0
  store i64 %_id7728, i64* %_gep7733
  br label %_merge7719
_else7718:
  br label %_merge7719
_merge7719:
  store i64 0, i64* %_i7734
  br label %_pre7738
_pre7738:
  %_id7742 = load i64, i64* %_i7734
  %_id7744 = load i64, i64* %_length7687
  %_bop7746 = icmp slt i64 %_id7742, %_id7744
  %_test7735 = icmp eq i1 %_bop7746, 0
  br i1 %_test7735, label %_post7736, label %_body7737
_body7737:
  %_id7751 = load i1, i1* %_not_yet_inserted7716
  %_test7750 = icmp eq i1 %_id7751, 0
  br i1 %_test7750, label %_else7748, label %_then7747
_then7747:
  %_id7757 = load i64, i64* %_insertee7688
  %_id7759 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_partial7686
  %_id7761 = load i64, i64* %_i7734
  %_ptr7763 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7759, i32 0, i32 1, i64 %_id7761
  %_load7764 = load i64, i64* %_ptr7763
  %_bop7765 = icmp sgt i64 %_id7757, %_load7764
  %_test7756 = icmp eq i1 %_bop7765, 0
  br i1 %_test7756, label %_else7754, label %_then7753
_then7753:
  store i1 0, i1* %_not_yet_inserted7716
  %_id7766 = load i64, i64* %_insertee7688
  %_id7768 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted7689
  %_id7770 = load i64, i64* %_i7734
  %_bop7772 = add i64 %_id7770, 1
  %_gep7774 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7768, i32 0, i32 1, i64 %_bop7772
  store i64 %_id7766, i64* %_gep7774
  %_id7775 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_partial7686
  %_id7777 = load i64, i64* %_i7734
  %_ptr7779 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7775, i32 0, i32 1, i64 %_id7777
  %_load7780 = load i64, i64* %_ptr7779
  %_id7781 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted7689
  %_id7783 = load i64, i64* %_i7734
  %_gep7786 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7781, i32 0, i32 1, i64 %_id7783
  store i64 %_load7780, i64* %_gep7786
  br label %_merge7755
_else7754:
  %_id7787 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_partial7686
  %_id7789 = load i64, i64* %_i7734
  %_ptr7791 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7787, i32 0, i32 1, i64 %_id7789
  %_load7792 = load i64, i64* %_ptr7791
  %_id7793 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted7689
  %_id7795 = load i64, i64* %_i7734
  %_gep7798 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7793, i32 0, i32 1, i64 %_id7795
  store i64 %_load7792, i64* %_gep7798
  br label %_merge7755
_merge7755:
  br label %_merge7749
_else7748:
  %_id7799 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_partial7686
  %_id7801 = load i64, i64* %_i7734
  %_ptr7803 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7799, i32 0, i32 1, i64 %_id7801
  %_load7804 = load i64, i64* %_ptr7803
  %_id7805 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted7689
  %_id7807 = load i64, i64* %_i7734
  %_bop7809 = add i64 %_id7807, 1
  %_gep7811 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7805, i32 0, i32 1, i64 %_bop7809
  store i64 %_load7804, i64* %_gep7811
  br label %_merge7749
_merge7749:
  %_id7739 = load i64, i64* %_i7734
  %_bop7741 = add i64 %_id7739, 1
  store i64 %_bop7741, i64* %_i7734
  br label %_pre7738
_post7736:
  %_id7812 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_inserted7689
  ret { i64, [0 x i64] }* %_id7812
}

define { i64, [0 x i64] }* @insort({ i64, [0 x i64] }* %unsorted, i64 %len) {
  %_len7648 = alloca i64
  %_unsorted7647 = alloca { i64, [0 x i64] }*
  %_out7649 = alloca { i64, [0 x i64] }*
  %_i7660 = alloca i64
  store i64 %len, i64* %_len7648
  store { i64, [0 x i64] }* %unsorted, { i64, [0 x i64] }** %_unsorted7647
  %_raw_array7650 = call { i64, [0 x i64] }* @oat_alloc_array(i64 1)
  %_array7651 = bitcast { i64, [0 x i64] }* %_raw_array7650 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array7651, { i64, [0 x i64] }** %_out7649
  %_id7652 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_unsorted7647
  %_ptr7654 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7652, i32 0, i32 1, i32 0
  %_load7655 = load i64, i64* %_ptr7654
  %_id7656 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_out7649
  %_gep7659 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7656, i32 0, i32 1, i32 0
  store i64 %_load7655, i64* %_gep7659
  store i64 1, i64* %_i7660
  br label %_pre7664
_pre7664:
  %_id7668 = load i64, i64* %_i7660
  %_id7670 = load i64, i64* %_len7648
  %_bop7672 = icmp slt i64 %_id7668, %_id7670
  %_test7661 = icmp eq i1 %_bop7672, 0
  br i1 %_test7661, label %_post7662, label %_body7663
_body7663:
  %_id7674 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_unsorted7647
  %_id7676 = load i64, i64* %_i7660
  %_ptr7678 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7674, i32 0, i32 1, i64 %_id7676
  %_load7679 = load i64, i64* %_ptr7678
  %_id7680 = load i64, i64* %_i7660
  %_id7682 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_out7649
  %_fun7673 = call { i64, [0 x i64] }* @insert(i64 %_id7682, i64 %_id7680, { i64, [0 x i64] }* %_load7679)
  store { i64, [0 x i64] }* %_fun7673, { i64, [0 x i64] }** %_out7649
  %_id7665 = load i64, i64* %_i7660
  %_bop7667 = add i64 %_id7665, 1
  store i64 %_bop7667, i64* %_i7660
  br label %_pre7664
_post7662:
  %_id7684 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_out7649
  ret { i64, [0 x i64] }* %_id7684
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv7623 = alloca { i64, [0 x i8*] }*
  %_argc7622 = alloca i64
  %_array7624 = alloca { i64, [0 x i64] }*
  %_result7639 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv7623
  store i64 %argc, i64* %_argc7622
  %_raw_array7625 = call { i64, [0 x i64] }* @oat_alloc_array(i64 6)
  %_array7626 = bitcast { i64, [0 x i64] }* %_raw_array7625 to { i64, [0 x i64] }*
  %_elt7627 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7626, i32 0, i32 1, i32 0
  store i64 13, i64* %_elt7627
  %_elt7629 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7626, i32 0, i32 1, i32 1
  store i64 42, i64* %_elt7629
  %_elt7631 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7626, i32 0, i32 1, i32 2
  store i64 32, i64* %_elt7631
  %_elt7633 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7626, i32 0, i32 1, i32 3
  store i64 3, i64* %_elt7633
  %_elt7635 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7626, i32 0, i32 1, i32 4
  store i64 2, i64* %_elt7635
  %_elt7637 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7626, i32 0, i32 1, i32 5
  store i64 6, i64* %_elt7637
  store { i64, [0 x i64] }* %_array7626, { i64, [0 x i64] }** %_array7624
  %_id7641 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array7624
  %_fun7640 = call { i64, [0 x i64] }* @insort(i64 %_id7641, { i64, [0 x i64] }* 6)
  store { i64, [0 x i64] }* %_fun7640, { i64, [0 x i64] }** %_result7639
  %_id7643 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_result7639
  %_ptr7645 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7643, i32 0, i32 1, i32 5
  %_load7646 = load i64, i64* %_ptr7645
  ret i64 %_load7646
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
