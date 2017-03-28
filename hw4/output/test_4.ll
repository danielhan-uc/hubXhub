; generated from: atprograms/selectionsort.oat
target triple = "x86_64-apple-macosx10.10.0"
define i64 @getminindex({ i64, [0 x i64] }* %a, i64 %s, i64 %b) {
  %_b3996 = alloca i64
  %_s3995 = alloca i64
  %_a3994 = alloca { i64, [0 x i64] }*
  %_i3997 = alloca i64
  %_min4000 = alloca i64
  %_mi4007 = alloca i64
  store i64 %b, i64* %_b3996
  store i64 %s, i64* %_s3995
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_a3994
  %_id3998 = load i64, i64* %_s3995
  store i64 %_id3998, i64* %_i3997
  %_id4001 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3994
  %_id4003 = load i64, i64* %_s3995
  %_ptr4005 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id4001, i32 0, i32 1, i64 %_id4003
  %_load4006 = load i64, i64* %_ptr4005
  store i64 %_load4006, i64* %_min4000
  %_id4008 = load i64, i64* %_s3995
  store i64 %_id4008, i64* %_mi4007
  br label %_pre4013
_pre4013:
  %_id4017 = load i64, i64* %_i3997
  %_id4019 = load i64, i64* %_b3996
  %_bop4021 = icmp slt i64 %_id4017, %_id4019
  %_test4010 = icmp eq i1 %_bop4021, 0
  br i1 %_test4010, label %_post4011, label %_body4012
_body4012:
  %_id4026 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3994
  %_id4028 = load i64, i64* %_i3997
  %_ptr4030 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id4026, i32 0, i32 1, i64 %_id4028
  %_load4031 = load i64, i64* %_ptr4030
  %_id4032 = load i64, i64* %_min4000
  %_bop4034 = icmp slt i64 %_load4031, %_id4032
  %_test4025 = icmp eq i1 %_bop4034, 0
  br i1 %_test4025, label %_else4023, label %_then4022
_then4022:
  %_id4035 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3994
  %_id4037 = load i64, i64* %_i3997
  %_ptr4039 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id4035, i32 0, i32 1, i64 %_id4037
  %_load4040 = load i64, i64* %_ptr4039
  store i64 %_load4040, i64* %_min4000
  %_id4041 = load i64, i64* %_i3997
  store i64 %_id4041, i64* %_mi4007
  br label %_merge4024
_else4023:
  br label %_merge4024
_merge4024:
  %_id4014 = load i64, i64* %_i3997
  %_bop4016 = add i64 %_id4014, 1
  store i64 %_bop4016, i64* %_i3997
  br label %_pre4013
_post4011:
  %_id4043 = load i64, i64* %_mi4007
  ret i64 %_id4043
}

define void @selectionsort({ i64, [0 x i64] }* %a, i64 %s) {
  %_s3945 = alloca i64
  %_a3944 = alloca { i64, [0 x i64] }*
  %_t3946 = alloca i64
  %_mi3947 = alloca i64
  %_i3948 = alloca i64
  store i64 %s, i64* %_s3945
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_a3944
  store i64 0, i64* %_t3946
  store i64 0, i64* %_mi3947
  store i64 0, i64* %_i3948
  br label %_pre3952
_pre3952:
  %_id3956 = load i64, i64* %_i3948
  %_id3958 = load i64, i64* %_s3945
  %_bop3960 = icmp slt i64 %_id3956, %_id3958
  %_test3949 = icmp eq i1 %_bop3960, 0
  br i1 %_test3949, label %_post3950, label %_body3951
_body3951:
  %_id3962 = load i64, i64* %_s3945
  %_id3964 = load i64, i64* %_i3948
  %_id3966 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3944
  %_fun3961 = call i64 @getminindex({ i64, [0 x i64] }* %_id3966, i64 %_id3964, i64 %_id3962)
  store i64 %_fun3961, i64* %_mi3947
  %_id3968 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3944
  %_id3970 = load i64, i64* %_i3948
  %_ptr3972 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3968, i32 0, i32 1, i64 %_id3970
  %_load3973 = load i64, i64* %_ptr3972
  store i64 %_load3973, i64* %_t3946
  %_id3974 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3944
  %_id3976 = load i64, i64* %_mi3947
  %_ptr3978 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3974, i32 0, i32 1, i64 %_id3976
  %_load3979 = load i64, i64* %_ptr3978
  %_id3980 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3944
  %_id3982 = load i64, i64* %_i3948
  %_gep3985 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3980, i32 0, i32 1, i64 %_id3982
  store i64 %_load3979, i64* %_gep3985
  %_id3986 = load i64, i64* %_t3946
  %_id3988 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3944
  %_id3990 = load i64, i64* %_mi3947
  %_gep3993 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3988, i32 0, i32 1, i64 %_id3990
  store i64 %_id3986, i64* %_gep3993
  %_id3953 = load i64, i64* %_i3948
  %_bop3955 = add i64 %_id3953, 1
  store i64 %_bop3955, i64* %_i3948
  br label %_pre3952
_post3950:
  ret void
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv3903 = alloca { i64, [0 x i8*] }*
  %_argc3902 = alloca i64
  %_ar3904 = alloca { i64, [0 x i64] }*
  %_i3926 = alloca i64
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv3903
  store i64 %argc, i64* %_argc3902
  %_raw_array3905 = call { i64, [0 x i64] }* @oat_alloc_array(i64 8)
  %_array3906 = bitcast { i64, [0 x i64] }* %_raw_array3905 to { i64, [0 x i64] }*
  %_elt3907 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3906, i32 0, i32 1, i32 0
  store i64 5, i64* %_elt3907
  %_elt3909 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3906, i32 0, i32 1, i32 1
  store i64 200, i64* %_elt3909
  %_elt3911 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3906, i32 0, i32 1, i32 2
  store i64 1, i64* %_elt3911
  %_elt3913 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3906, i32 0, i32 1, i32 3
  store i64 65, i64* %_elt3913
  %_elt3915 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3906, i32 0, i32 1, i32 4
  store i64 30, i64* %_elt3915
  %_elt3917 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3906, i32 0, i32 1, i32 5
  store i64 99, i64* %_elt3917
  %_elt3919 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3906, i32 0, i32 1, i32 6
  store i64 2, i64* %_elt3919
  %_elt3921 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3906, i32 0, i32 1, i32 7
  store i64 0, i64* %_elt3921
  store { i64, [0 x i64] }* %_array3906, { i64, [0 x i64] }** %_ar3904
  %_id3924 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ar3904
  call void @selectionsort(i64 %_id3924, { i64, [0 x i64] }* 8)
  store i64 0, i64* %_i3926
  br label %_pre3930
_pre3930:
  %_id3934 = load i64, i64* %_i3926
  %_bop3936 = icmp slt i64 %_id3934, 8
  %_test3927 = icmp eq i1 %_bop3936, 0
  br i1 %_test3927, label %_post3928, label %_body3929
_body3929:
  %_id3938 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ar3904
  %_id3940 = load i64, i64* %_i3926
  %_ptr3942 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3938, i32 0, i32 1, i64 %_id3940
  %_load3943 = load i64, i64* %_ptr3942
  call void @print_int(i64 %_load3943)
  %_id3931 = load i64, i64* %_i3926
  %_bop3933 = add i64 %_id3931, 1
  store i64 %_bop3933, i64* %_i3926
  br label %_pre3930
_post3928:
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
