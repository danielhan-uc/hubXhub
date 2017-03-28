; generated from: atprograms/determinant_size2.oat
target triple = "x86_64-apple-macosx10.10.0"
define i64 @compute_determinant({ i64, [0 x { i64, [0 x i64] }*] }* %matrix, i64 %n) {
  %_n5097 = alloca i64
  %_matrix5096 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_sum5098 = alloca i64
  %_multiplier5099 = alloca i64
  %_k5114 = alloca i64
  %_length5127 = alloca i64
  %_b5131 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i5136 = alloca i64
  %_j5159 = alloca i64
  %_l5182 = alloca i64
  %_m5195 = alloca i64
  %_o5232 = alloca i64
  %_p5246 = alloca i64
  store i64 %n, i64* %_n5097
  store { i64, [0 x { i64, [0 x i64] }*] }* %matrix, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix5096
  store i64 0, i64* %_sum5098
  %_uop5100 = sub i64 0, 1
  store i64 %_uop5100, i64* %_multiplier5099
  %_id5105 = load i64, i64* %_n5097
  %_bop5107 = icmp eq i64 %_id5105, 1
  %_test5104 = icmp eq i1 %_bop5107, 0
  br i1 %_test5104, label %_else5102, label %_then5101
_then5101:
  %_id5108 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix5096
  %_ptr5110 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id5108, i32 0, i32 1, i32 0
  %_load5111 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr5110
  %_ptr5112 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load5111, i32 0, i32 1, i32 0
  %_load5113 = load i64, i64* %_ptr5112
  store i64 %_load5113, i64* %_sum5098
  br label %_merge5103
_else5102:
  store i64 0, i64* %_k5114
  br label %_pre5118
_pre5118:
  %_id5122 = load i64, i64* %_k5114
  %_id5124 = load i64, i64* %_n5097
  %_bop5126 = icmp slt i64 %_id5122, %_id5124
  %_test5115 = icmp eq i1 %_bop5126, 0
  br i1 %_test5115, label %_post5116, label %_body5117
_body5117:
  %_id5128 = load i64, i64* %_n5097
  %_bop5130 = sub i64 %_id5128, 1
  store i64 %_bop5130, i64* %_length5127
  %_id5132 = load i64, i64* %_length5127
  %_raw_array5134 = call { i64, [0 x i64] }* @oat_alloc_array(i64 %_id5132)
  %_array5135 = bitcast { i64, [0 x i64] }* %_raw_array5134 to { i64, [0 x { i64, [0 x i64] }*] }*
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array5135, { i64, [0 x { i64, [0 x i64] }*] }** %_b5131
  store i64 0, i64* %_i5136
  br label %_pre5140
_pre5140:
  %_id5144 = load i64, i64* %_i5136
  %_id5146 = load i64, i64* %_length5127
  %_bop5148 = icmp slt i64 %_id5144, %_id5146
  %_test5137 = icmp eq i1 %_bop5148, 0
  br i1 %_test5137, label %_post5138, label %_body5139
_body5139:
  %_id5149 = load i64, i64* %_length5127
  %_raw_array5151 = call { i64, [0 x i64] }* @oat_alloc_array(i64 %_id5149)
  %_array5152 = bitcast { i64, [0 x i64] }* %_raw_array5151 to { i64, [0 x i64] }*
  %_id5153 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b5131
  %_id5155 = load i64, i64* %_i5136
  %_gep5158 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id5153, i32 0, i32 1, i64 %_id5155
  store { i64, [0 x i64] }* %_array5152, { i64, [0 x i64] }** %_gep5158
  store i64 0, i64* %_j5159
  br label %_pre5163
_pre5163:
  %_id5167 = load i64, i64* %_j5159
  %_id5169 = load i64, i64* %_length5127
  %_bop5171 = icmp slt i64 %_id5167, %_id5169
  %_test5160 = icmp eq i1 %_bop5171, 0
  br i1 %_test5160, label %_post5161, label %_body5162
_body5162:
  %_id5172 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b5131
  %_id5174 = load i64, i64* %_i5136
  %_ptr5176 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id5172, i32 0, i32 1, i64 %_id5174
  %_load5177 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr5176
  %_id5178 = load i64, i64* %_j5159
  %_gep5181 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load5177, i32 0, i32 1, i64 %_id5178
  store i64 1, i64* %_gep5181
  %_id5164 = load i64, i64* %_j5159
  %_bop5166 = add i64 %_id5164, 1
  store i64 %_bop5166, i64* %_j5159
  br label %_pre5163
_post5161:
  %_id5141 = load i64, i64* %_i5136
  %_bop5143 = add i64 %_id5141, 1
  store i64 %_bop5143, i64* %_i5136
  br label %_pre5140
_post5138:
  store i64 0, i64* %_l5182
  br label %_pre5186
_pre5186:
  %_id5190 = load i64, i64* %_l5182
  %_id5192 = load i64, i64* %_k5114
  %_bop5194 = icmp slt i64 %_id5190, %_id5192
  %_test5183 = icmp eq i1 %_bop5194, 0
  br i1 %_test5183, label %_post5184, label %_body5185
_body5185:
  store i64 0, i64* %_m5195
  br label %_pre5199
_pre5199:
  %_id5203 = load i64, i64* %_m5195
  %_id5205 = load i64, i64* %_n5097
  %_bop5207 = sub i64 %_id5205, 1
  %_bop5208 = icmp slt i64 %_id5203, %_bop5207
  %_test5196 = icmp eq i1 %_bop5208, 0
  br i1 %_test5196, label %_post5197, label %_body5198
_body5198:
  %_id5209 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix5096
  %_id5211 = load i64, i64* %_m5195
  %_bop5213 = add i64 %_id5211, 1
  %_ptr5214 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id5209, i32 0, i32 1, i64 %_bop5213
  %_load5215 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr5214
  %_id5216 = load i64, i64* %_l5182
  %_ptr5218 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load5215, i32 0, i32 1, i64 %_id5216
  %_load5219 = load i64, i64* %_ptr5218
  %_id5220 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b5131
  %_id5222 = load i64, i64* %_m5195
  %_ptr5224 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id5220, i32 0, i32 1, i64 %_id5222
  %_load5225 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr5224
  %_id5226 = load i64, i64* %_l5182
  %_gep5229 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load5225, i32 0, i32 1, i64 %_id5226
  store i64 %_load5219, i64* %_gep5229
  %_id5200 = load i64, i64* %_m5195
  %_bop5202 = add i64 %_id5200, 1
  store i64 %_bop5202, i64* %_m5195
  br label %_pre5199
_post5197:
  %_id5187 = load i64, i64* %_l5182
  %_bop5189 = add i64 %_id5187, 1
  store i64 %_bop5189, i64* %_l5182
  br label %_pre5186
_post5184:
  %_id5230 = load i64, i64* %_k5114
  store i64 %_id5230, i64* %_o5232
  br label %_pre5236
_pre5236:
  %_id5240 = load i64, i64* %_o5232
  %_id5242 = load i64, i64* %_n5097
  %_bop5244 = sub i64 %_id5242, 1
  %_bop5245 = icmp slt i64 %_id5240, %_bop5244
  %_test5233 = icmp eq i1 %_bop5245, 0
  br i1 %_test5233, label %_post5234, label %_body5235
_body5235:
  store i64 0, i64* %_p5246
  br label %_pre5250
_pre5250:
  %_id5254 = load i64, i64* %_p5246
  %_id5256 = load i64, i64* %_n5097
  %_bop5258 = sub i64 %_id5256, 1
  %_bop5259 = icmp slt i64 %_id5254, %_bop5258
  %_test5247 = icmp eq i1 %_bop5259, 0
  br i1 %_test5247, label %_post5248, label %_body5249
_body5249:
  %_id5260 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix5096
  %_id5262 = load i64, i64* %_p5246
  %_bop5264 = add i64 %_id5262, 1
  %_ptr5265 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id5260, i32 0, i32 1, i64 %_bop5264
  %_load5266 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr5265
  %_id5267 = load i64, i64* %_o5232
  %_bop5269 = add i64 %_id5267, 1
  %_ptr5270 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load5266, i32 0, i32 1, i64 %_bop5269
  %_load5271 = load i64, i64* %_ptr5270
  %_id5272 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b5131
  %_id5274 = load i64, i64* %_p5246
  %_ptr5276 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id5272, i32 0, i32 1, i64 %_id5274
  %_load5277 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr5276
  %_id5278 = load i64, i64* %_o5232
  %_gep5281 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load5277, i32 0, i32 1, i64 %_id5278
  store i64 %_load5271, i64* %_gep5281
  %_id5251 = load i64, i64* %_p5246
  %_bop5253 = add i64 %_id5251, 1
  store i64 %_bop5253, i64* %_p5246
  br label %_pre5250
_post5248:
  %_id5237 = load i64, i64* %_o5232
  %_bop5239 = add i64 %_id5237, 1
  store i64 %_bop5239, i64* %_o5232
  br label %_pre5236
_post5234:
  %_id5282 = load i64, i64* %_multiplier5099
  %_uop5284 = sub i64 0, 1
  %_bop5285 = mul i64 %_id5282, %_uop5284
  store i64 %_bop5285, i64* %_multiplier5099
  %_id5286 = load i64, i64* %_sum5098
  %_id5288 = load i64, i64* %_multiplier5099
  %_id5290 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix5096
  %_ptr5292 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id5290, i32 0, i32 1, i32 0
  %_load5293 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr5292
  %_id5294 = load i64, i64* %_k5114
  %_ptr5296 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load5293, i32 0, i32 1, i64 %_id5294
  %_load5297 = load i64, i64* %_ptr5296
  %_bop5298 = mul i64 %_id5288, %_load5297
  %_id5300 = load i64, i64* %_n5097
  %_bop5302 = sub i64 %_id5300, 1
  %_id5303 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b5131
  %_fun5299 = call i64 @compute_determinant(i64 %_id5303, { i64, [0 x { i64, [0 x i64] }*] }* %_bop5302)
  %_bop5305 = mul i64 %_bop5298, %_fun5299
  %_bop5306 = add i64 %_id5286, %_bop5305
  store i64 %_bop5306, i64* %_sum5098
  %_id5119 = load i64, i64* %_k5114
  %_bop5121 = add i64 %_id5119, 1
  store i64 %_bop5121, i64* %_k5114
  br label %_pre5118
_post5116:
  br label %_merge5103
_merge5103:
  %_id5307 = load i64, i64* %_sum5098
  ret i64 %_id5307
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv5073 = alloca { i64, [0 x i8*] }*
  %_argc5072 = alloca i64
  %_matrix5074 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv5073
  store i64 %argc, i64* %_argc5072
  %_raw_array5075 = call { i64, [0 x i64] }* @oat_alloc_array(i64 2)
  %_array5076 = bitcast { i64, [0 x i64] }* %_raw_array5075 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array5079 = call { i64, [0 x i64] }* @oat_alloc_array(i64 2)
  %_array5080 = bitcast { i64, [0 x i64] }* %_raw_array5079 to { i64, [0 x i64] }*
  %_elt5081 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5080, i32 0, i32 1, i32 0
  store i64 20, i64* %_elt5081
  %_elt5083 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5080, i32 0, i32 1, i32 1
  store i64 2, i64* %_elt5083
  %_elt5077 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array5076, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array5080, { i64, [0 x i64] }** %_elt5077
  %_raw_array5087 = call { i64, [0 x i64] }* @oat_alloc_array(i64 2)
  %_array5088 = bitcast { i64, [0 x i64] }* %_raw_array5087 to { i64, [0 x i64] }*
  %_elt5089 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5088, i32 0, i32 1, i32 0
  store i64 3, i64* %_elt5089
  %_elt5091 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array5088, i32 0, i32 1, i32 1
  store i64 5, i64* %_elt5091
  %_elt5085 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array5076, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array5088, { i64, [0 x i64] }** %_elt5085
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array5076, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix5074
  %_id5094 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_matrix5074
  %_fun5093 = call i64 @compute_determinant(i64 %_id5094, { i64, [0 x { i64, [0 x i64] }*] }* 2)
  ret i64 %_fun5093
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
