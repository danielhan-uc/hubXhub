; generated from: hw5programs/compile_struct_array.oat
target triple = "x86_64-apple-macosx10.10.0"
%Test = type { { i64, [0 x i64] }*, i64, { i64, [0 x i64] }* }

@arr_x = global { i64, [3 x i64] }* @_global_arr6183
@_global_arr6183 = global { i64, [3 x i64] } { i64 3, [3 x i64] [ i64 3, i64 4, i64 5 ] }
@arr_z = global { i64, [3 x i64] }* @_global_arr6182
@_global_arr6182 = global { i64, [3 x i64] } { i64 3, [3 x i64] [ i64 4, i64 5, i64 6 ] }

define i64 @program(i64 %_argc6157, { i64, [0 x i8*] }* %_argv6155) {
  %_argc6158 = alloca i64
  %_argv6156 = alloca { i64, [0 x i8*] }*
  %_t6166 = alloca %Test*
  store i64 %_argc6157, i64* %_argc6158
  store { i64, [0 x i8*] }* %_argv6155, { i64, [0 x i8*] }** %_argv6156
  %_raw_struct6159 = call i64* @oat_malloc(i64 24)
  %_struct6160 = bitcast i64* %_raw_struct6159 to %Test*
  %_arr_x6161 = load { i64, [3 x i64] }*, { i64, [3 x i64] }** @arr_x
  %_find6162 = getelementptr %Test, %Test* %_struct6160, i32 0, i32 0
  store { i64, [3 x i64] }* %_arr_x6161, { i64, [3 x i64] }** %_find6162
  %_find6163 = getelementptr %Test, %Test* %_struct6160, i32 0, i32 1
  store i64 3, i64* %_find6163
  %_arr_z6164 = load { i64, [3 x i64] }*, { i64, [3 x i64] }** @arr_z
  %_find6165 = getelementptr %Test, %Test* %_struct6160, i32 0, i32 2
  store { i64, [3 x i64] }* %_arr_z6164, { i64, [3 x i64] }** %_find6165
  store %Test* %_struct6160, %Test** %_t6166
  %_t6167 = load %Test*, %Test** %_t6166
  %_tmp6168 = bitcast %Test* %_t6167 to i64*
  %_index_ptr6169 = getelementptr %Test, %Test* %_t6167, i32 0, i32 0
  %_proj6170 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr6169
  %_tmp6171 = bitcast { i64, [0 x i64] }* %_proj6170 to i64*
  call void @oat_assert_array_length(i64* %_tmp6171, i64 0)
  %_index_ptr6172 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_proj6170, i32 0, i32 1, i32 0
  %_index6173 = load i64, i64* %_index_ptr6172
  %_t6174 = load %Test*, %Test** %_t6166
  %_tmp6175 = bitcast %Test* %_t6174 to i64*
  %_index_ptr6176 = getelementptr %Test, %Test* %_t6174, i32 0, i32 2
  %_proj6177 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_index_ptr6176
  %_tmp6178 = bitcast { i64, [0 x i64] }* %_proj6177 to i64*
  call void @oat_assert_array_length(i64* %_tmp6178, i64 1)
  %_index_ptr6179 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_proj6177, i32 0, i32 1, i32 1
  %_index6180 = load i64, i64* %_index_ptr6179
  %_bop6181 = mul i64 %_index6173, %_index6180
  ret i64 %_bop6181
}


declare i64* @oat_malloc(i64)
declare i64* @oat_alloc_array(i64)
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
