; generated from: atprograms/msort2.oat
target triple = "x86_64-apple-macosx10.10.0"
@_str3884 = global [2 x i8] c" \00"
@_str3891 = global [2 x i8] c" \00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv3851 = alloca { i64, [0 x i8*] }*
  %_argc3850 = alloca i64
  %_a3852 = alloca { i64, [0 x i64] }*
  %_i3875 = alloca i64
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv3851
  store i64 %argc, i64* %_argc3850
  %_raw_array3853 = call { i64, [0 x i64] }* @oat_alloc_array(i64 10)
  %_array3854 = bitcast { i64, [0 x i64] }* %_raw_array3853 to { i64, [0 x i64] }*
  %_elt3855 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3854, i32 0, i32 1, i32 0
  store i64 126, i64* %_elt3855
  %_elt3857 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3854, i32 0, i32 1, i32 1
  store i64 125, i64* %_elt3857
  %_elt3859 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3854, i32 0, i32 1, i32 2
  store i64 124, i64* %_elt3859
  %_elt3861 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3854, i32 0, i32 1, i32 3
  store i64 123, i64* %_elt3861
  %_elt3863 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3854, i32 0, i32 1, i32 4
  store i64 122, i64* %_elt3863
  %_elt3865 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3854, i32 0, i32 1, i32 5
  store i64 121, i64* %_elt3865
  %_elt3867 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3854, i32 0, i32 1, i32 6
  store i64 120, i64* %_elt3867
  %_elt3869 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3854, i32 0, i32 1, i32 7
  store i64 119, i64* %_elt3869
  %_elt3871 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3854, i32 0, i32 1, i32 8
  store i64 118, i64* %_elt3871
  %_elt3873 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3854, i32 0, i32 1, i32 9
  store i64 117, i64* %_elt3873
  store { i64, [0 x i64] }* %_array3854, { i64, [0 x i64] }** %_a3852
  store i64 0, i64* %_i3875
  %_id3878 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3852
  %_fun3877 = call i8* @string_of_array({ i64, [0 x i64] }* %_id3878)
  call void @print_string(i8* %_fun3877)
  %_id3881 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3852
  call void @oat_mergesort(i64 %_id3881, i64 0, { i64, [0 x i64] }* 9)
  %_str3885 = bitcast [2 x i8]* @_str3884 to i8*
  call void @print_string(i8* %_str3885)
  %_id3888 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3852
  %_fun3887 = call i8* @string_of_array({ i64, [0 x i64] }* %_id3888)
  call void @print_string(i8* %_fun3887)
  %_str3892 = bitcast [2 x i8]* @_str3891 to i8*
  call void @print_string(i8* %_str3892)
  %_id3893 = load i64, i64* %_i3875
  ret i64 %_id3893
}

define void @oat_mergesort({ i64, [0 x i64] }* %a, i64 %low, i64 %high) {
  %_high3809 = alloca i64
  %_low3808 = alloca i64
  %_a3807 = alloca { i64, [0 x i64] }*
  %_mid3810 = alloca i64
  store i64 %high, i64* %_high3809
  store i64 %low, i64* %_low3808
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_a3807
  store i64 0, i64* %_mid3810
  %_id3815 = load i64, i64* %_low3808
  %_id3817 = load i64, i64* %_high3809
  %_bop3819 = icmp slt i64 %_id3815, %_id3817
  %_test3814 = icmp eq i1 %_bop3819, 0
  br i1 %_test3814, label %_else3812, label %_then3811
_then3811:
  %_id3820 = load i64, i64* %_low3808
  %_id3822 = load i64, i64* %_high3809
  %_bop3824 = add i64 %_id3820, %_id3822
  %_bop3825 = lshr i64 %_bop3824, 1
  store i64 %_bop3825, i64* %_mid3810
  %_id3827 = load i64, i64* %_mid3810
  %_id3829 = load i64, i64* %_low3808
  %_id3831 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3807
  call void @oat_mergesort(i64 %_id3831, i64 %_id3829, { i64, [0 x i64] }* %_id3827)
  %_id3834 = load i64, i64* %_high3809
  %_id3836 = load i64, i64* %_mid3810
  %_bop3838 = add i64 %_id3836, 1
  %_id3839 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3807
  call void @oat_mergesort(i64 %_id3839, i64 %_bop3838, { i64, [0 x i64] }* %_id3834)
  %_id3842 = load i64, i64* %_mid3810
  %_id3844 = load i64, i64* %_high3809
  %_id3846 = load i64, i64* %_low3808
  %_id3848 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3807
  call void @merge(i64 %_id3848, i64 %_id3846, i64 %_id3844, { i64, [0 x i64] }* %_id3842)
  br label %_merge3813
_else3812:
  br label %_merge3813
_merge3813:
  ret void
}

define void @merge({ i64, [0 x i64] }* %a, i64 %low, i64 %high, i64 %mid) {
  %_mid3645 = alloca i64
  %_high3644 = alloca i64
  %_low3643 = alloca i64
  %_a3642 = alloca { i64, [0 x i64] }*
  %_i3646 = alloca i64
  %_j3647 = alloca i64
  %_k3648 = alloca i64
  %_c3649 = alloca { i64, [0 x i64] }*
  store i64 %mid, i64* %_mid3645
  store i64 %high, i64* %_high3644
  store i64 %low, i64* %_low3643
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_a3642
  store i64 0, i64* %_i3646
  store i64 0, i64* %_j3647
  store i64 0, i64* %_k3648
  %_raw_array3650 = call { i64, [0 x i64] }* @oat_alloc_array(i64 50)
  %_array3651 = bitcast { i64, [0 x i64] }* %_raw_array3650 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array3651, { i64, [0 x i64] }** %_c3649
  %_id3652 = load i64, i64* %_low3643
  store i64 %_id3652, i64* %_i3646
  %_id3654 = load i64, i64* %_mid3645
  %_bop3656 = add i64 %_id3654, 1
  store i64 %_bop3656, i64* %_j3647
  %_id3657 = load i64, i64* %_low3643
  store i64 %_id3657, i64* %_k3648
  br label %_pre3662
_pre3662:
  %_id3663 = load i64, i64* %_i3646
  %_id3665 = load i64, i64* %_mid3645
  %_bop3667 = icmp sle i64 %_id3663, %_id3665
  %_id3668 = load i64, i64* %_j3647
  %_id3670 = load i64, i64* %_high3644
  %_bop3672 = icmp sle i64 %_id3668, %_id3670
  %_bop3673 = and i1 %_bop3667, %_bop3672
  %_test3659 = icmp eq i1 %_bop3673, 0
  br i1 %_test3659, label %_post3660, label %_body3661
_body3661:
  %_id3678 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3642
  %_id3680 = load i64, i64* %_i3646
  %_ptr3682 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3678, i32 0, i32 1, i64 %_id3680
  %_load3683 = load i64, i64* %_ptr3682
  %_id3684 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3642
  %_id3686 = load i64, i64* %_j3647
  %_ptr3688 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3684, i32 0, i32 1, i64 %_id3686
  %_load3689 = load i64, i64* %_ptr3688
  %_bop3690 = icmp slt i64 %_load3683, %_load3689
  %_test3677 = icmp eq i1 %_bop3690, 0
  br i1 %_test3677, label %_else3675, label %_then3674
_then3674:
  %_id3691 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3642
  %_id3693 = load i64, i64* %_i3646
  %_ptr3695 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3691, i32 0, i32 1, i64 %_id3693
  %_load3696 = load i64, i64* %_ptr3695
  %_id3697 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3649
  %_id3699 = load i64, i64* %_k3648
  %_gep3702 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3697, i32 0, i32 1, i64 %_id3699
  store i64 %_load3696, i64* %_gep3702
  %_id3703 = load i64, i64* %_k3648
  %_bop3705 = add i64 %_id3703, 1
  store i64 %_bop3705, i64* %_k3648
  %_id3706 = load i64, i64* %_i3646
  %_bop3708 = add i64 %_id3706, 1
  store i64 %_bop3708, i64* %_i3646
  br label %_merge3676
_else3675:
  %_id3709 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3642
  %_id3711 = load i64, i64* %_j3647
  %_ptr3713 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3709, i32 0, i32 1, i64 %_id3711
  %_load3714 = load i64, i64* %_ptr3713
  %_id3715 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3649
  %_id3717 = load i64, i64* %_k3648
  %_gep3720 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3715, i32 0, i32 1, i64 %_id3717
  store i64 %_load3714, i64* %_gep3720
  %_id3721 = load i64, i64* %_k3648
  %_bop3723 = add i64 %_id3721, 1
  store i64 %_bop3723, i64* %_k3648
  %_id3724 = load i64, i64* %_j3647
  %_bop3726 = add i64 %_id3724, 1
  store i64 %_bop3726, i64* %_j3647
  br label %_merge3676
_merge3676:
  br label %_pre3662
_post3660:
  br label %_pre3730
_pre3730:
  %_id3731 = load i64, i64* %_i3646
  %_id3733 = load i64, i64* %_mid3645
  %_bop3735 = icmp sle i64 %_id3731, %_id3733
  %_test3727 = icmp eq i1 %_bop3735, 0
  br i1 %_test3727, label %_post3728, label %_body3729
_body3729:
  %_id3736 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3642
  %_id3738 = load i64, i64* %_i3646
  %_ptr3740 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3736, i32 0, i32 1, i64 %_id3738
  %_load3741 = load i64, i64* %_ptr3740
  %_id3742 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3649
  %_id3744 = load i64, i64* %_k3648
  %_gep3747 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3742, i32 0, i32 1, i64 %_id3744
  store i64 %_load3741, i64* %_gep3747
  %_id3748 = load i64, i64* %_k3648
  %_bop3750 = add i64 %_id3748, 1
  store i64 %_bop3750, i64* %_k3648
  %_id3751 = load i64, i64* %_i3646
  %_bop3753 = add i64 %_id3751, 1
  store i64 %_bop3753, i64* %_i3646
  br label %_pre3730
_post3728:
  br label %_pre3757
_pre3757:
  %_id3758 = load i64, i64* %_j3647
  %_id3760 = load i64, i64* %_high3644
  %_bop3762 = icmp sle i64 %_id3758, %_id3760
  %_test3754 = icmp eq i1 %_bop3762, 0
  br i1 %_test3754, label %_post3755, label %_body3756
_body3756:
  %_id3763 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3642
  %_id3765 = load i64, i64* %_j3647
  %_ptr3767 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3763, i32 0, i32 1, i64 %_id3765
  %_load3768 = load i64, i64* %_ptr3767
  %_id3769 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3649
  %_id3771 = load i64, i64* %_k3648
  %_gep3774 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3769, i32 0, i32 1, i64 %_id3771
  store i64 %_load3768, i64* %_gep3774
  %_id3775 = load i64, i64* %_k3648
  %_bop3777 = add i64 %_id3775, 1
  store i64 %_bop3777, i64* %_k3648
  %_id3778 = load i64, i64* %_j3647
  %_bop3780 = add i64 %_id3778, 1
  store i64 %_bop3780, i64* %_j3647
  br label %_pre3757
_post3755:
  %_id3781 = load i64, i64* %_low3643
  store i64 %_id3781, i64* %_i3646
  br label %_pre3786
_pre3786:
  %_id3790 = load i64, i64* %_i3646
  %_id3792 = load i64, i64* %_k3648
  %_bop3794 = icmp slt i64 %_id3790, %_id3792
  %_test3783 = icmp eq i1 %_bop3794, 0
  br i1 %_test3783, label %_post3784, label %_body3785
_body3785:
  %_id3795 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_c3649
  %_id3797 = load i64, i64* %_i3646
  %_ptr3799 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3795, i32 0, i32 1, i64 %_id3797
  %_load3800 = load i64, i64* %_ptr3799
  %_id3801 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3642
  %_id3803 = load i64, i64* %_i3646
  %_gep3806 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3801, i32 0, i32 1, i64 %_id3803
  store i64 %_load3800, i64* %_gep3806
  %_id3787 = load i64, i64* %_i3646
  %_bop3789 = add i64 %_id3787, 1
  store i64 %_bop3789, i64* %_i3646
  br label %_pre3786
_post3784:
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
