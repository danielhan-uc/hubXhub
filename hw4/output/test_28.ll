; generated from: atprograms/josh_joyce_test.oat
target triple = "x86_64-apple-macosx10.10.0"
@arr1 = global { i64, [4 x i64] } { i64 4, [4 x i64] [ i64 1, i64 2, i64 3, i64 4 ] }
@_glob6263 = global i64 1
@_glob6264 = global i64 2
@_glob6265 = global i64 3
@_glob6266 = global i64 4
@arr2 = global { i64, [4 x i64] } { i64 4, [4 x i64] [ i64 1, i64 2, i64 3, i64 5 ] }
@_glob6259 = global i64 1
@_glob6260 = global i64 2
@_glob6261 = global i64 3
@_glob6262 = global i64 5

define i64 @arrcheck({ i64, [0 x i64] }* %ar1, { i64, [0 x i64] }* %ar2, i64 %len) {
  %_len6225 = alloca i64
  %_ar26224 = alloca { i64, [0 x i64] }*
  %_ar16223 = alloca { i64, [0 x i64] }*
  %_val6226 = alloca i64
  %_i6227 = alloca i64
  store i64 %len, i64* %_len6225
  store { i64, [0 x i64] }* %ar2, { i64, [0 x i64] }** %_ar26224
  store { i64, [0 x i64] }* %ar1, { i64, [0 x i64] }** %_ar16223
  store i64 0, i64* %_val6226
  store i64 0, i64* %_i6227
  br label %_pre6231
_pre6231:
  %_id6235 = load i64, i64* %_i6227
  %_id6237 = load i64, i64* %_len6225
  %_bop6239 = icmp slt i64 %_id6235, %_id6237
  %_test6228 = icmp eq i1 %_bop6239, 0
  br i1 %_test6228, label %_post6229, label %_body6230
_body6230:
  %_id6244 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ar16223
  %_id6246 = load i64, i64* %_i6227
  %_ptr6248 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id6244, i32 0, i32 1, i64 %_id6246
  %_load6249 = load i64, i64* %_ptr6248
  %_id6250 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ar26224
  %_id6252 = load i64, i64* %_i6227
  %_ptr6254 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id6250, i32 0, i32 1, i64 %_id6252
  %_load6255 = load i64, i64* %_ptr6254
  %_bop6256 = icmp ne i64 %_load6249, %_load6255
  %_test6243 = icmp eq i1 %_bop6256, 0
  br i1 %_test6243, label %_else6241, label %_then6240
_then6240:
  store i64 1, i64* %_val6226
  br label %_merge6242
_else6241:
  br label %_merge6242
_merge6242:
  %_id6232 = load i64, i64* %_i6227
  %_bop6234 = add i64 %_id6232, 1
  store i64 %_bop6234, i64* %_i6227
  br label %_pre6231
_post6229:
  %_id6257 = load i64, i64* %_val6226
  ret i64 %_id6257
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv6209 = alloca { i64, [0 x i8*] }*
  %_argc6208 = alloca i64
  %_val6210 = alloca i64
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv6209
  store i64 %argc, i64* %_argc6208
  store i64 1, i64* %_val6210
  %_bitcast6217 = bitcast { i64, [4 x i64] }* @arr2 to { i64, [0 x i64] }*
  %_bitcast6219 = bitcast { i64, [4 x i64] }* @arr1 to { i64, [0 x i64] }*
  %_fun6215 = call i64 @arrcheck(i64 %_bitcast6219, { i64, [0 x i64] }* %_bitcast6217, { i64, [0 x i64] }* 4)
  %_bop6220 = icmp eq i64 %_fun6215, 1
  %_test6214 = icmp eq i1 %_bop6220, 0
  br i1 %_test6214, label %_else6212, label %_then6211
_then6211:
  store i64 0, i64* %_val6210
  br label %_merge6213
_else6212:
  br label %_merge6213
_merge6213:
  %_id6221 = load i64, i64* %_val6210
  ret i64 %_id6221
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
