; generated from: atprograms/lfsr.oat
target triple = "x86_64-apple-macosx10.10.0"
@lfsr_iterations = global i64 5
@lfsr_length = global i64 4
@lfsr_init_values = global { i64, [4 x i1] } { i64 4, [4 x i1] [ i1 1, i1 0, i1 1, i1 0 ] }
@_glob6070 = global i1 1
@_glob6071 = global i1 0
@_glob6072 = global i1 1
@_glob6073 = global i1 0
@_str6051 = global [2 x i8] c"T\00"
@_str6053 = global [2 x i8] c"F\00"
@_str6014 = global [2 x i8] c" \00"

define i1 @xor(i1 %x, i1 %y) {
  %_y6056 = alloca i1
  %_x6055 = alloca i1
  store i1 %y, i1* %_y6056
  store i1 %x, i1* %_x6055
  %_id6057 = load i1, i1* %_x6055
  %_id6059 = load i1, i1* %_y6056
  %_uop6061 = xor i1 1, %_id6059
  %_bop6062 = and i1 %_id6057, %_uop6061
  %_id6063 = load i1, i1* %_x6055
  %_uop6065 = xor i1 1, %_id6063
  %_id6066 = load i1, i1* %_y6056
  %_bop6068 = and i1 %_uop6065, %_id6066
  %_bop6069 = or i1 %_bop6062, %_bop6068
  ret i1 %_bop6069
}

define i8* @string_of_bool(i1 %b) {
  %_b6044 = alloca i1
  store i1 %b, i1* %_b6044
  %_id6049 = load i1, i1* %_b6044
  %_test6048 = icmp eq i1 %_id6049, 0
  br i1 %_test6048, label %_else6046, label %_then6045
_then6045:
  %_str6052 = bitcast [2 x i8]* @_str6051 to i8*
  ret i8* %_str6052
_else6046:
  %_str6054 = bitcast [2 x i8]* @_str6053 to i8*
  ret i8* %_str6054
}

define void @print_lfsr({ i64, [0 x i1] }* %lfsr_register, i64 %length) {
  %_length6022 = alloca i64
  %_lfsr_register6021 = alloca { i64, [0 x i1] }*
  %_i6023 = alloca i64
  store i64 %length, i64* %_length6022
  store { i64, [0 x i1] }* %lfsr_register, { i64, [0 x i1] }** %_lfsr_register6021
  store i64 0, i64* %_i6023
  br label %_pre6027
_pre6027:
  %_id6031 = load i64, i64* %_i6023
  %_id6033 = load i64, i64* %_length6022
  %_bop6035 = icmp slt i64 %_id6031, %_id6033
  %_test6024 = icmp eq i1 %_bop6035, 0
  br i1 %_test6024, label %_post6025, label %_body6026
_body6026:
  %_id6038 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register6021
  %_id6040 = load i64, i64* %_i6023
  %_ptr6042 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_id6038, i32 0, i32 1, i64 %_id6040
  %_load6043 = load i1, i1* %_ptr6042
  %_fun6037 = call i8* @string_of_bool(i1 %_load6043)
  call void @print_string(i8* %_fun6037)
  %_id6028 = load i64, i64* %_i6023
  %_bop6030 = add i64 %_id6028, 1
  store i64 %_bop6030, i64* %_i6023
  br label %_pre6027
_post6025:
  ret void
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv5915 = alloca { i64, [0 x i8*] }*
  %_argc5914 = alloca i64
  %_lfsr_register5916 = alloca { i64, [0 x i1] }*
  %_i5921 = alloca i64
  %_i5946 = alloca i64
  %_new_first5959 = alloca i1
  %_j5978 = alloca i64
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv5915
  store i64 %argc, i64* %_argc5914
  %_id5917 = load i64, i64* @lfsr_length
  %_raw_array5919 = call { i64, [0 x i64] }* @oat_alloc_array(i64 %_id5917)
  %_array5920 = bitcast { i64, [0 x i64] }* %_raw_array5919 to { i64, [0 x i1] }*
  store { i64, [0 x i1] }* %_array5920, { i64, [0 x i1] }** %_lfsr_register5916
  store i64 0, i64* %_i5921
  br label %_pre5925
_pre5925:
  %_id5929 = load i64, i64* %_i5921
  %_id5931 = load i64, i64* @lfsr_length
  %_bop5933 = icmp slt i64 %_id5929, %_id5931
  %_test5922 = icmp eq i1 %_bop5933, 0
  br i1 %_test5922, label %_post5923, label %_body5924
_body5924:
  %_bitcast5935 = bitcast { i64, [4 x i1] }* @lfsr_init_values to { i64, [0 x i1] }*
  %_id5936 = load i64, i64* %_i5921
  %_ptr5938 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_bitcast5935, i32 0, i32 1, i64 %_id5936
  %_load5939 = load i1, i1* %_ptr5938
  %_id5940 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register5916
  %_id5942 = load i64, i64* %_i5921
  %_gep5945 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_id5940, i32 0, i32 1, i64 %_id5942
  store i1 %_load5939, i1* %_gep5945
  %_id5926 = load i64, i64* %_i5921
  %_bop5928 = add i64 %_id5926, 1
  store i64 %_bop5928, i64* %_i5921
  br label %_pre5925
_post5923:
  store i64 0, i64* %_i5946
  br label %_pre5950
_pre5950:
  %_id5954 = load i64, i64* %_i5946
  %_id5956 = load i64, i64* @lfsr_iterations
  %_bop5958 = icmp slt i64 %_id5954, %_id5956
  %_test5947 = icmp eq i1 %_bop5958, 0
  br i1 %_test5947, label %_post5948, label %_body5949
_body5949:
  %_id5961 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register5916
  %_id5963 = load i64, i64* @lfsr_length
  %_bop5965 = sub i64 %_id5963, 2
  %_ptr5966 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_id5961, i32 0, i32 1, i64 %_bop5965
  %_load5967 = load i1, i1* %_ptr5966
  %_id5968 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register5916
  %_id5970 = load i64, i64* @lfsr_length
  %_bop5972 = sub i64 %_id5970, 1
  %_ptr5973 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_id5968, i32 0, i32 1, i64 %_bop5972
  %_load5974 = load i1, i1* %_ptr5973
  %_fun5960 = call i1 @xor(i1 %_load5974, i1 %_load5967)
  store i1 %_fun5960, i1* %_new_first5959
  %_id5975 = load i64, i64* @lfsr_length
  %_bop5977 = sub i64 %_id5975, 1
  store i64 %_bop5977, i64* %_j5978
  br label %_pre5982
_pre5982:
  %_id5986 = load i64, i64* %_j5978
  %_bop5988 = icmp sgt i64 %_id5986, 0
  %_test5979 = icmp eq i1 %_bop5988, 0
  br i1 %_test5979, label %_post5980, label %_body5981
_body5981:
  %_id5989 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register5916
  %_id5991 = load i64, i64* %_j5978
  %_bop5993 = sub i64 %_id5991, 1
  %_ptr5994 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_id5989, i32 0, i32 1, i64 %_bop5993
  %_load5995 = load i1, i1* %_ptr5994
  %_id5996 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register5916
  %_id5998 = load i64, i64* %_j5978
  %_gep6001 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_id5996, i32 0, i32 1, i64 %_id5998
  store i1 %_load5995, i1* %_gep6001
  %_id5983 = load i64, i64* %_j5978
  %_bop5985 = sub i64 %_id5983, 1
  store i64 %_bop5985, i64* %_j5978
  br label %_pre5982
_post5980:
  %_id6002 = load i1, i1* %_new_first5959
  %_id6004 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register5916
  %_gep6007 = getelementptr { i64, [0 x i1] }, { i64, [0 x i1] }* %_id6004, i32 0, i32 1, i32 0
  store i1 %_id6002, i1* %_gep6007
  %_id5951 = load i64, i64* %_i5946
  %_bop5953 = add i64 %_id5951, 1
  store i64 %_bop5953, i64* %_i5946
  br label %_pre5950
_post5948:
  %_id6009 = load i64, i64* @lfsr_length
  %_bitcast6012 = bitcast { i64, [4 x i1] }* @lfsr_init_values to { i64, [0 x i1] }*
  call void @print_lfsr(i64 %_bitcast6012, { i64, [0 x i1] }* %_id6009)
  %_str6015 = bitcast [2 x i8]* @_str6014 to i8*
  call void @print_string(i8* %_str6015)
  %_id6017 = load i64, i64* @lfsr_length
  %_id6019 = load { i64, [0 x i1] }*, { i64, [0 x i1] }** %_lfsr_register5916
  call void @print_lfsr(i64 %_id6019, { i64, [0 x i1] }* %_id6017)
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
