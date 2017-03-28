; generated from: atprograms/count_sort.oat
target triple = "x86_64-apple-macosx10.10.0"
@_str4844 = global [2 x i8] c"
\00"

define i64 @min({ i64, [0 x i64] }* %arr, i64 %len) {
  %_len5028 = alloca i64
  %_arr5027 = alloca { i64, [0 x i64] }*
  %_min5029 = alloca i64
  %_i5034 = alloca i64
  store i64 %len, i64* %_len5028
  store { i64, [0 x i64] }* %arr, { i64, [0 x i64] }** %_arr5027
  %_id5030 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5027
  %_ptr5032 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5030, i32 0, i32 1, i32 0
  %_load5033 = load i64, i64* %_ptr5032
  store i64 %_load5033, i64* %_min5029
  store i64 0, i64* %_i5034
  br label %_pre5038
_pre5038:
  %_id5042 = load i64, i64* %_i5034
  %_id5044 = load i64, i64* %_len5028
  %_bop5046 = icmp slt i64 %_id5042, %_id5044
  %_test5035 = icmp eq i1 %_bop5046, 0
  br i1 %_test5035, label %_post5036, label %_body5037
_body5037:
  %_id5051 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5027
  %_id5053 = load i64, i64* %_i5034
  %_ptr5055 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5051, i32 0, i32 1, i64 %_id5053
  %_load5056 = load i64, i64* %_ptr5055
  %_id5057 = load i64, i64* %_min5029
  %_bop5059 = icmp slt i64 %_load5056, %_id5057
  %_test5050 = icmp eq i1 %_bop5059, 0
  br i1 %_test5050, label %_else5048, label %_then5047
_then5047:
  %_id5060 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr5027
  %_id5062 = load i64, i64* %_i5034
  %_ptr5064 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5060, i32 0, i32 1, i64 %_id5062
  %_load5065 = load i64, i64* %_ptr5064
  store i64 %_load5065, i64* %_min5029
  br label %_merge5049
_else5048:
  br label %_merge5049
_merge5049:
  %_id5039 = load i64, i64* %_i5034
  %_bop5041 = add i64 %_id5039, 1
  store i64 %_bop5041, i64* %_i5034
  br label %_pre5038
_post5036:
  %_id5066 = load i64, i64* %_min5029
  ret i64 %_id5066
}

define i64 @max({ i64, [0 x i64] }* %arr, i64 %len) {
  %_len4987 = alloca i64
  %_arr4986 = alloca { i64, [0 x i64] }*
  %_max4988 = alloca i64
  %_i4993 = alloca i64
  store i64 %len, i64* %_len4987
  store { i64, [0 x i64] }* %arr, { i64, [0 x i64] }** %_arr4986
  %_id4989 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4986
  %_ptr4991 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id4989, i32 0, i32 1, i32 0
  %_load4992 = load i64, i64* %_ptr4991
  store i64 %_load4992, i64* %_max4988
  store i64 0, i64* %_i4993
  br label %_pre4997
_pre4997:
  %_id5001 = load i64, i64* %_i4993
  %_id5003 = load i64, i64* %_len4987
  %_bop5005 = icmp slt i64 %_id5001, %_id5003
  %_test4994 = icmp eq i1 %_bop5005, 0
  br i1 %_test4994, label %_post4995, label %_body4996
_body4996:
  %_id5010 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4986
  %_id5012 = load i64, i64* %_i4993
  %_ptr5014 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5010, i32 0, i32 1, i64 %_id5012
  %_load5015 = load i64, i64* %_ptr5014
  %_id5016 = load i64, i64* %_max4988
  %_bop5018 = icmp sgt i64 %_load5015, %_id5016
  %_test5009 = icmp eq i1 %_bop5018, 0
  br i1 %_test5009, label %_else5007, label %_then5006
_then5006:
  %_id5019 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4986
  %_id5021 = load i64, i64* %_i4993
  %_ptr5023 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id5019, i32 0, i32 1, i64 %_id5021
  %_load5024 = load i64, i64* %_ptr5023
  store i64 %_load5024, i64* %_max4988
  br label %_merge5008
_else5007:
  br label %_merge5008
_merge5008:
  %_id4998 = load i64, i64* %_i4993
  %_bop5000 = add i64 %_id4998, 1
  store i64 %_bop5000, i64* %_i4993
  br label %_pre4997
_post4995:
  %_id5025 = load i64, i64* %_max4988
  ret i64 %_id5025
}

define { i64, [0 x i64] }* @count_sort({ i64, [0 x i64] }* %arr, i64 %len) {
  %_len4857 = alloca i64
  %_arr4856 = alloca { i64, [0 x i64] }*
  %_min4858 = alloca i64
  %_max4864 = alloca i64
  %_counts4870 = alloca { i64, [0 x i64] }*
  %_i4879 = alloca i64
  %_i4919 = alloca i64
  %_j4922 = alloca i64
  %_out4923 = alloca { i64, [0 x i64] }*
  store i64 %len, i64* %_len4857
  store { i64, [0 x i64] }* %arr, { i64, [0 x i64] }** %_arr4856
  %_id4860 = load i64, i64* %_len4857
  %_id4862 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4856
  %_fun4859 = call i64 @min(i64 %_id4862, { i64, [0 x i64] }* %_id4860)
  store i64 %_fun4859, i64* %_min4858
  %_id4866 = load i64, i64* %_len4857
  %_id4868 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4856
  %_fun4865 = call i64 @max(i64 %_id4868, { i64, [0 x i64] }* %_id4866)
  store i64 %_fun4865, i64* %_max4864
  %_id4871 = load i64, i64* %_max4864
  %_id4873 = load i64, i64* %_min4858
  %_bop4875 = sub i64 %_id4871, %_id4873
  %_bop4876 = add i64 %_bop4875, 1
  %_raw_array4877 = call { i64, [0 x i64] }* @oat_alloc_array(i64 %_bop4876)
  %_array4878 = bitcast { i64, [0 x i64] }* %_raw_array4877 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array4878, { i64, [0 x i64] }** %_counts4870
  store i64 0, i64* %_i4879
  br label %_pre4883
_pre4883:
  %_id4887 = load i64, i64* %_i4879
  %_id4889 = load i64, i64* %_len4857
  %_bop4891 = icmp slt i64 %_id4887, %_id4889
  %_test4880 = icmp eq i1 %_bop4891, 0
  br i1 %_test4880, label %_post4881, label %_body4882
_body4882:
  %_id4892 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_counts4870
  %_id4894 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4856
  %_id4896 = load i64, i64* %_i4879
  %_ptr4898 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id4894, i32 0, i32 1, i64 %_id4896
  %_load4899 = load i64, i64* %_ptr4898
  %_id4900 = load i64, i64* %_min4858
  %_bop4902 = sub i64 %_load4899, %_id4900
  %_ptr4903 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id4892, i32 0, i32 1, i64 %_bop4902
  %_load4904 = load i64, i64* %_ptr4903
  %_bop4905 = add i64 %_load4904, 1
  %_id4906 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_counts4870
  %_id4908 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4856
  %_id4910 = load i64, i64* %_i4879
  %_ptr4912 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id4908, i32 0, i32 1, i64 %_id4910
  %_load4913 = load i64, i64* %_ptr4912
  %_id4914 = load i64, i64* %_min4858
  %_bop4916 = sub i64 %_load4913, %_id4914
  %_gep4918 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id4906, i32 0, i32 1, i64 %_bop4916
  store i64 %_bop4905, i64* %_gep4918
  %_id4884 = load i64, i64* %_i4879
  %_bop4886 = add i64 %_id4884, 1
  store i64 %_bop4886, i64* %_i4879
  br label %_pre4883
_post4881:
  %_id4920 = load i64, i64* %_min4858
  store i64 %_id4920, i64* %_i4919
  store i64 0, i64* %_j4922
  %_id4924 = load i64, i64* %_len4857
  %_raw_array4926 = call { i64, [0 x i64] }* @oat_alloc_array(i64 %_id4924)
  %_array4927 = bitcast { i64, [0 x i64] }* %_raw_array4926 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array4927, { i64, [0 x i64] }** %_out4923
  br label %_pre4931
_pre4931:
  %_id4932 = load i64, i64* %_i4919
  %_id4934 = load i64, i64* %_max4864
  %_bop4936 = icmp sle i64 %_id4932, %_id4934
  %_test4928 = icmp eq i1 %_bop4936, 0
  br i1 %_test4928, label %_post4929, label %_body4930
_body4930:
  %_id4941 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_counts4870
  %_id4943 = load i64, i64* %_i4919
  %_id4945 = load i64, i64* %_min4858
  %_bop4947 = sub i64 %_id4943, %_id4945
  %_ptr4948 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id4941, i32 0, i32 1, i64 %_bop4947
  %_load4949 = load i64, i64* %_ptr4948
  %_bop4950 = icmp sgt i64 %_load4949, 0
  %_test4940 = icmp eq i1 %_bop4950, 0
  br i1 %_test4940, label %_else4938, label %_then4937
_then4937:
  %_id4951 = load i64, i64* %_i4919
  %_id4953 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_out4923
  %_id4955 = load i64, i64* %_j4922
  %_gep4958 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id4953, i32 0, i32 1, i64 %_id4955
  store i64 %_id4951, i64* %_gep4958
  %_id4959 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_counts4870
  %_id4961 = load i64, i64* %_i4919
  %_id4963 = load i64, i64* %_min4858
  %_bop4965 = sub i64 %_id4961, %_id4963
  %_ptr4966 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id4959, i32 0, i32 1, i64 %_bop4965
  %_load4967 = load i64, i64* %_ptr4966
  %_bop4968 = sub i64 %_load4967, 1
  %_id4969 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_counts4870
  %_id4971 = load i64, i64* %_i4919
  %_id4973 = load i64, i64* %_min4858
  %_bop4975 = sub i64 %_id4971, %_id4973
  %_gep4977 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id4969, i32 0, i32 1, i64 %_bop4975
  store i64 %_bop4968, i64* %_gep4977
  %_id4978 = load i64, i64* %_j4922
  %_bop4980 = add i64 %_id4978, 1
  store i64 %_bop4980, i64* %_j4922
  br label %_merge4939
_else4938:
  %_id4981 = load i64, i64* %_i4919
  %_bop4983 = add i64 %_id4981, 1
  store i64 %_bop4983, i64* %_i4919
  br label %_merge4939
_merge4939:
  br label %_pre4931
_post4929:
  %_id4984 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_out4923
  ret { i64, [0 x i64] }* %_id4984
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv4816 = alloca { i64, [0 x i8*] }*
  %_argc4815 = alloca i64
  %_arr4817 = alloca { i64, [0 x i64] }*
  %_len4838 = alloca i64
  %_sorted4846 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv4816
  store i64 %argc, i64* %_argc4815
  %_raw_array4818 = call { i64, [0 x i64] }* @oat_alloc_array(i64 9)
  %_array4819 = bitcast { i64, [0 x i64] }* %_raw_array4818 to { i64, [0 x i64] }*
  %_elt4820 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4819, i32 0, i32 1, i32 0
  store i64 65, i64* %_elt4820
  %_elt4822 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4819, i32 0, i32 1, i32 1
  store i64 70, i64* %_elt4822
  %_elt4824 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4819, i32 0, i32 1, i32 2
  store i64 72, i64* %_elt4824
  %_elt4826 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4819, i32 0, i32 1, i32 3
  store i64 90, i64* %_elt4826
  %_elt4828 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4819, i32 0, i32 1, i32 4
  store i64 65, i64* %_elt4828
  %_elt4830 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4819, i32 0, i32 1, i32 5
  store i64 65, i64* %_elt4830
  %_elt4832 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4819, i32 0, i32 1, i32 6
  store i64 69, i64* %_elt4832
  %_elt4834 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4819, i32 0, i32 1, i32 7
  store i64 89, i64* %_elt4834
  %_elt4836 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4819, i32 0, i32 1, i32 8
  store i64 67, i64* %_elt4836
  store { i64, [0 x i64] }* %_array4819, { i64, [0 x i64] }** %_arr4817
  store i64 9, i64* %_len4838
  %_id4841 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4817
  %_fun4840 = call i8* @string_of_array({ i64, [0 x i64] }* %_id4841)
  call void @print_string(i8* %_fun4840)
  %_str4845 = bitcast [2 x i8]* @_str4844 to i8*
  call void @print_string(i8* %_str4845)
  %_id4848 = load i64, i64* %_len4838
  %_id4850 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr4817
  %_fun4847 = call { i64, [0 x i64] }* @count_sort(i64 %_id4850, { i64, [0 x i64] }* %_id4848)
  store { i64, [0 x i64] }* %_fun4847, { i64, [0 x i64] }** %_sorted4846
  %_id4854 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_sorted4846
  %_fun4853 = call i8* @string_of_array({ i64, [0 x i64] }* %_id4854)
  call void @print_string(i8* %_fun4853)
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
