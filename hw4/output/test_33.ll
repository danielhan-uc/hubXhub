; generated from: atprograms/maxsubsequence.oat
target triple = "x86_64-apple-macosx10.10.0"
define i64 @maxsum({ i64, [0 x i64] }* %arr, i64 %size) {
  %_size7844 = alloca i64
  %_arr7843 = alloca { i64, [0 x i64] }*
  %_maxarr7845 = alloca { i64, [0 x i64] }*
  %_maxs7850 = alloca i64
  %_i7859 = alloca i64
  %_j7872 = alloca i64
  store i64 %size, i64* %_size7844
  store { i64, [0 x i64] }* %arr, { i64, [0 x i64] }** %_arr7843
  %_id7846 = load i64, i64* %_size7844
  %_raw_array7848 = call { i64, [0 x i64] }* @oat_alloc_array(i64 %_id7846)
  %_array7849 = bitcast { i64, [0 x i64] }* %_raw_array7848 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array7849, { i64, [0 x i64] }** %_maxarr7845
  store i64 0, i64* %_maxs7850
  %_id7851 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr7843
  %_ptr7853 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7851, i32 0, i32 1, i32 0
  %_load7854 = load i64, i64* %_ptr7853
  %_id7855 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr7845
  %_gep7858 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7855, i32 0, i32 1, i32 0
  store i64 %_load7854, i64* %_gep7858
  store i64 0, i64* %_i7859
  br label %_pre7863
_pre7863:
  %_id7867 = load i64, i64* %_i7859
  %_id7869 = load i64, i64* %_size7844
  %_bop7871 = icmp slt i64 %_id7867, %_id7869
  %_test7860 = icmp eq i1 %_bop7871, 0
  br i1 %_test7860, label %_post7861, label %_body7862
_body7862:
  store i64 0, i64* %_j7872
  br label %_pre7876
_pre7876:
  %_id7880 = load i64, i64* %_j7872
  %_id7882 = load i64, i64* %_i7859
  %_bop7884 = icmp slt i64 %_id7880, %_id7882
  %_test7873 = icmp eq i1 %_bop7884, 0
  br i1 %_test7873, label %_post7874, label %_body7875
_body7875:
  %_id7889 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr7843
  %_id7891 = load i64, i64* %_i7859
  %_ptr7893 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7889, i32 0, i32 1, i64 %_id7891
  %_load7894 = load i64, i64* %_ptr7893
  %_id7895 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr7843
  %_id7897 = load i64, i64* %_j7872
  %_ptr7899 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7895, i32 0, i32 1, i64 %_id7897
  %_load7900 = load i64, i64* %_ptr7899
  %_bop7901 = icmp sgt i64 %_load7894, %_load7900
  %_id7902 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr7845
  %_id7904 = load i64, i64* %_i7859
  %_ptr7906 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7902, i32 0, i32 1, i64 %_id7904
  %_load7907 = load i64, i64* %_ptr7906
  %_id7908 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr7845
  %_id7910 = load i64, i64* %_j7872
  %_ptr7912 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7908, i32 0, i32 1, i64 %_id7910
  %_load7913 = load i64, i64* %_ptr7912
  %_id7914 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr7843
  %_id7916 = load i64, i64* %_i7859
  %_ptr7918 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7914, i32 0, i32 1, i64 %_id7916
  %_load7919 = load i64, i64* %_ptr7918
  %_bop7920 = add i64 %_load7913, %_load7919
  %_bop7921 = icmp slt i64 %_load7907, %_bop7920
  %_bop7922 = and i1 %_bop7901, %_bop7921
  %_test7888 = icmp eq i1 %_bop7922, 0
  br i1 %_test7888, label %_else7886, label %_then7885
_then7885:
  %_id7923 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr7845
  %_id7925 = load i64, i64* %_j7872
  %_ptr7927 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7923, i32 0, i32 1, i64 %_id7925
  %_load7928 = load i64, i64* %_ptr7927
  %_id7929 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr7843
  %_id7931 = load i64, i64* %_i7859
  %_ptr7933 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7929, i32 0, i32 1, i64 %_id7931
  %_load7934 = load i64, i64* %_ptr7933
  %_bop7935 = add i64 %_load7928, %_load7934
  %_id7936 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr7845
  %_id7938 = load i64, i64* %_i7859
  %_gep7941 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7936, i32 0, i32 1, i64 %_id7938
  store i64 %_bop7935, i64* %_gep7941
  br label %_merge7887
_else7886:
  br label %_merge7887
_merge7887:
  %_id7877 = load i64, i64* %_j7872
  %_bop7879 = add i64 %_id7877, 1
  store i64 %_bop7879, i64* %_j7872
  br label %_pre7876
_post7874:
  %_id7946 = load i64, i64* %_maxs7850
  %_id7948 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr7845
  %_id7950 = load i64, i64* %_i7859
  %_ptr7952 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7948, i32 0, i32 1, i64 %_id7950
  %_load7953 = load i64, i64* %_ptr7952
  %_bop7954 = icmp slt i64 %_id7946, %_load7953
  %_test7945 = icmp eq i1 %_bop7954, 0
  br i1 %_test7945, label %_else7943, label %_then7942
_then7942:
  %_id7955 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_maxarr7845
  %_id7957 = load i64, i64* %_i7859
  %_ptr7959 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id7955, i32 0, i32 1, i64 %_id7957
  %_load7960 = load i64, i64* %_ptr7959
  store i64 %_load7960, i64* %_maxs7850
  br label %_merge7944
_else7943:
  br label %_merge7944
_merge7944:
  %_id7864 = load i64, i64* %_i7859
  %_bop7866 = add i64 %_id7864, 1
  store i64 %_bop7866, i64* %_i7859
  br label %_pre7863
_post7861:
  %_id7961 = load i64, i64* %_maxs7850
  ret i64 %_id7961
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv7819 = alloca { i64, [0 x i8*] }*
  %_argc7818 = alloca i64
  %_array7820 = alloca { i64, [0 x i64] }*
  %_max_ans7837 = alloca i64
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv7819
  store i64 %argc, i64* %_argc7818
  %_raw_array7821 = call { i64, [0 x i64] }* @oat_alloc_array(i64 7)
  %_array7822 = bitcast { i64, [0 x i64] }* %_raw_array7821 to { i64, [0 x i64] }*
  %_elt7823 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7822, i32 0, i32 1, i32 0
  store i64 1, i64* %_elt7823
  %_elt7825 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7822, i32 0, i32 1, i32 1
  store i64 101, i64* %_elt7825
  %_elt7827 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7822, i32 0, i32 1, i32 2
  store i64 2, i64* %_elt7827
  %_elt7829 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7822, i32 0, i32 1, i32 3
  store i64 3, i64* %_elt7829
  %_elt7831 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7822, i32 0, i32 1, i32 4
  store i64 101, i64* %_elt7831
  %_elt7833 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7822, i32 0, i32 1, i32 5
  store i64 4, i64* %_elt7833
  %_elt7835 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7822, i32 0, i32 1, i32 6
  store i64 5, i64* %_elt7835
  store { i64, [0 x i64] }* %_array7822, { i64, [0 x i64] }** %_array7820
  %_id7839 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_array7820
  %_fun7838 = call i64 @maxsum(i64 %_id7839, { i64, [0 x i64] }* 7)
  store i64 %_fun7838, i64* %_max_ans7837
  %_id7841 = load i64, i64* %_max_ans7837
  ret i64 %_id7841
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
