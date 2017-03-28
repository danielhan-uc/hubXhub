; generated from: atprograms/gnomesort.oat
target triple = "x86_64-apple-macosx10.10.0"
define void @gnomeSort({ i64, [0 x i64] }* %a, i64 %len) {
  %_len6124 = alloca i64
  %_a6123 = alloca { i64, [0 x i64] }*
  %_i6125 = alloca i64
  %_j6126 = alloca i64
  %_tmp6159 = alloca i64
  store i64 %len, i64* %_len6124
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_a6123
  store i64 1, i64* %_i6125
  store i64 2, i64* %_j6126
  br label %_pre6130
_pre6130:
  %_id6131 = load i64, i64* %_i6125
  %_id6133 = load i64, i64* %_len6124
  %_bop6135 = icmp slt i64 %_id6131, %_id6133
  %_test6127 = icmp eq i1 %_bop6135, 0
  br i1 %_test6127, label %_post6128, label %_body6129
_body6129:
  %_id6140 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a6123
  %_id6142 = load i64, i64* %_i6125
  %_bop6144 = sub i64 %_id6142, 1
  %_ptr6145 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id6140, i32 0, i32 1, i64 %_bop6144
  %_load6146 = load i64, i64* %_ptr6145
  %_id6147 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a6123
  %_id6149 = load i64, i64* %_i6125
  %_ptr6151 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id6147, i32 0, i32 1, i64 %_id6149
  %_load6152 = load i64, i64* %_ptr6151
  %_bop6153 = icmp sle i64 %_load6146, %_load6152
  %_test6139 = icmp eq i1 %_bop6153, 0
  br i1 %_test6139, label %_else6137, label %_then6136
_then6136:
  %_id6154 = load i64, i64* %_j6126
  store i64 %_id6154, i64* %_i6125
  %_id6156 = load i64, i64* %_j6126
  %_bop6158 = add i64 %_id6156, 1
  store i64 %_bop6158, i64* %_j6126
  br label %_merge6138
_else6137:
  %_id6160 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a6123
  %_id6162 = load i64, i64* %_i6125
  %_bop6164 = sub i64 %_id6162, 1
  %_ptr6165 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id6160, i32 0, i32 1, i64 %_bop6164
  %_load6166 = load i64, i64* %_ptr6165
  store i64 %_load6166, i64* %_tmp6159
  %_id6167 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a6123
  %_id6169 = load i64, i64* %_i6125
  %_ptr6171 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id6167, i32 0, i32 1, i64 %_id6169
  %_load6172 = load i64, i64* %_ptr6171
  %_id6173 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a6123
  %_id6175 = load i64, i64* %_i6125
  %_bop6177 = sub i64 %_id6175, 1
  %_gep6179 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id6173, i32 0, i32 1, i64 %_bop6177
  store i64 %_load6172, i64* %_gep6179
  %_id6180 = load i64, i64* %_tmp6159
  %_id6182 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a6123
  %_id6184 = load i64, i64* %_i6125
  %_gep6187 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id6182, i32 0, i32 1, i64 %_id6184
  store i64 %_id6180, i64* %_gep6187
  %_id6188 = load i64, i64* %_i6125
  %_bop6190 = sub i64 %_id6188, 1
  store i64 %_bop6190, i64* %_i6125
  %_id6195 = load i64, i64* %_i6125
  %_bop6197 = icmp eq i64 %_id6195, 0
  %_test6194 = icmp eq i1 %_bop6197, 0
  br i1 %_test6194, label %_else6192, label %_then6191
_then6191:
  %_id6198 = load i64, i64* %_j6126
  store i64 %_id6198, i64* %_i6125
  %_id6200 = load i64, i64* %_j6126
  %_bop6202 = add i64 %_id6200, 1
  store i64 %_bop6202, i64* %_j6126
  br label %_merge6193
_else6192:
  br label %_merge6193
_merge6193:
  br label %_merge6138
_merge6138:
  br label %_pre6130
_post6128:
  ret void
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv6079 = alloca { i64, [0 x i8*] }*
  %_argc6078 = alloca i64
  %_arr6080 = alloca { i64, [0 x i64] }*
  %_len6099 = alloca i64
  %_i6105 = alloca i64
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv6079
  store i64 %argc, i64* %_argc6078
  %_raw_array6081 = call { i64, [0 x i64] }* @oat_alloc_array(i64 8)
  %_array6082 = bitcast { i64, [0 x i64] }* %_raw_array6081 to { i64, [0 x i64] }*
  %_elt6083 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6082, i32 0, i32 1, i32 0
  store i64 5, i64* %_elt6083
  %_elt6085 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6082, i32 0, i32 1, i32 1
  store i64 200, i64* %_elt6085
  %_elt6087 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6082, i32 0, i32 1, i32 2
  store i64 1, i64* %_elt6087
  %_elt6089 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6082, i32 0, i32 1, i32 3
  store i64 65, i64* %_elt6089
  %_elt6091 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6082, i32 0, i32 1, i32 4
  store i64 30, i64* %_elt6091
  %_elt6093 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6082, i32 0, i32 1, i32 5
  store i64 99, i64* %_elt6093
  %_elt6095 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6082, i32 0, i32 1, i32 6
  store i64 2, i64* %_elt6095
  %_elt6097 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6082, i32 0, i32 1, i32 7
  store i64 0, i64* %_elt6097
  store { i64, [0 x i64] }* %_array6082, { i64, [0 x i64] }** %_arr6080
  store i64 8, i64* %_len6099
  %_id6101 = load i64, i64* %_len6099
  %_id6103 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr6080
  call void @gnomeSort(i64 %_id6103, { i64, [0 x i64] }* %_id6101)
  store i64 0, i64* %_i6105
  br label %_pre6109
_pre6109:
  %_id6113 = load i64, i64* %_i6105
  %_bop6115 = icmp slt i64 %_id6113, 8
  %_test6106 = icmp eq i1 %_bop6115, 0
  br i1 %_test6106, label %_post6107, label %_body6108
_body6108:
  %_id6117 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_arr6080
  %_id6119 = load i64, i64* %_i6105
  %_ptr6121 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id6117, i32 0, i32 1, i64 %_id6119
  %_load6122 = load i64, i64* %_ptr6121
  call void @print_int(i64 %_load6122)
  %_id6110 = load i64, i64* %_i6105
  %_bop6112 = add i64 %_id6110, 1
  store i64 %_bop6112, i64* %_i6105
  br label %_pre6109
_post6107:
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
