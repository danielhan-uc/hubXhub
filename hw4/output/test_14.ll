; generated from: atprograms/lib15.oat
target triple = "x86_64-apple-macosx10.10.0"
define i8* @sub(i8* %str, i64 %start, i64 %len) {
  %_len2956 = alloca i64
  %_start2955 = alloca i64
  %_str2954 = alloca i8*
  %_arr2957 = alloca { i64, [0 x i64] }*
  %_r2961 = alloca { i64, [0 x i64] }*
  %_i2966 = alloca i64
  store i64 %len, i64* %_len2956
  store i64 %start, i64* %_start2955
  store i8* %str, i8** %_str2954
  %_id2959 = load i8*, i8** %_str2954
  %_fun2958 = call { i64, [0 x i64] }* @array_of_string(i8* %_id2959)
  store { i64, [0 x i64] }* %_fun2958, { i64, [0 x i64] }** %_arr2957
  %_id2962 = load i64, i64* %_len2956
  %_raw_array2964 = call { i64, [0 x i64] }* @oat_alloc_array(i64 %_id2962)
  %_array2965 = bitcast { i64, [0 x i64] }* %_raw_array2964 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array2965, { i64, [0 x i64] }** %_r2961
  store i64 0, i64* %_i2966
  br label %_pre2970
_pre2970:
  %_id2974 = load i64, i64* %_i2966
  %_id2976 = load i64, i64* %_len2956
  %_bop2978 = icmp slt i64 %_id2974, %_id2976
  %_test2967 = icmp eq i1 %_bop2978, 0
  br i1 %_test2967, label %_post2968, label %_body2969
_body2969:
  %_id2979 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr2957
  %_id2981 = load i64, i64* %_i2966
  %_id2983 = load i64, i64* %_start2955
  %_bop2985 = add i64 %_id2981, %_id2983
  %_ptr2986 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id2979, i32 0, i32 1, i64 %_bop2985
  %_load2987 = load i64, i64* %_ptr2986
  %_id2988 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_r2961
  %_id2990 = load i64, i64* %_i2966
  %_gep2993 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id2988, i32 0, i32 1, i64 %_id2990
  store i64 %_load2987, i64* %_gep2993
  %_id2971 = load i64, i64* %_i2966
  %_bop2973 = add i64 %_id2971, 1
  store i64 %_bop2973, i64* %_i2966
  br label %_pre2970
_post2968:
  %_id2995 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_r2961
  %_fun2994 = call i8* @string_of_array({ i64, [0 x i64] }* %_id2995)
  ret i8* %_fun2994
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv2947 = alloca { i64, [0 x i8*] }*
  %_argc2946 = alloca i64
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv2947
  store i64 %argc, i64* %_argc2946
  %_id2950 = load { i64, [0 x i8*] }*, { i64, [0 x i8*] }** %_argv2947
  %_ptr2952 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_id2950, i32 0, i32 1, i32 1
  %_load2953 = load i8*, i8** %_ptr2952
  %_fun2949 = call i8* @sub(i64 %_load2953, i64 3, i8* 5)
  call void @print_string(i8* %_fun2949)
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
