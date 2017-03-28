; generated from: atprograms/matrixmult.oat
target triple = "x86_64-apple-macosx10.10.0"
@_str4097 = global [2 x i8] c" \00"
@_str4100 = global [2 x i8] c"	\00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv4267 = alloca { i64, [0 x i8*] }*
  %_argc4266 = alloca i64
  %_a4268 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_b4291 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_c4330 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv4267
  store i64 %argc, i64* %_argc4266
  %_raw_array4269 = call { i64, [0 x i64] }* @oat_alloc_array(i64 2)
  %_array4270 = bitcast { i64, [0 x i64] }* %_raw_array4269 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array4273 = call { i64, [0 x i64] }* @oat_alloc_array(i64 3)
  %_array4274 = bitcast { i64, [0 x i64] }* %_raw_array4273 to { i64, [0 x i64] }*
  %_elt4275 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4274, i32 0, i32 1, i32 0
  store i64 1, i64* %_elt4275
  %_elt4277 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4274, i32 0, i32 1, i32 1
  store i64 3, i64* %_elt4277
  %_elt4279 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4274, i32 0, i32 1, i32 2
  store i64 4, i64* %_elt4279
  %_elt4271 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4270, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array4274, { i64, [0 x i64] }** %_elt4271
  %_raw_array4283 = call { i64, [0 x i64] }* @oat_alloc_array(i64 3)
  %_array4284 = bitcast { i64, [0 x i64] }* %_raw_array4283 to { i64, [0 x i64] }*
  %_elt4285 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4284, i32 0, i32 1, i32 0
  store i64 2, i64* %_elt4285
  %_elt4287 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4284, i32 0, i32 1, i32 1
  store i64 0, i64* %_elt4287
  %_elt4289 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4284, i32 0, i32 1, i32 2
  store i64 1, i64* %_elt4289
  %_elt4281 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4270, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array4284, { i64, [0 x i64] }** %_elt4281
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4270, { i64, [0 x { i64, [0 x i64] }*] }** %_a4268
  %_raw_array4292 = call { i64, [0 x i64] }* @oat_alloc_array(i64 3)
  %_array4293 = bitcast { i64, [0 x i64] }* %_raw_array4292 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array4296 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array4297 = bitcast { i64, [0 x i64] }* %_raw_array4296 to { i64, [0 x i64] }*
  %_elt4298 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4297, i32 0, i32 1, i32 0
  store i64 1, i64* %_elt4298
  %_elt4300 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4297, i32 0, i32 1, i32 1
  store i64 2, i64* %_elt4300
  %_elt4302 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4297, i32 0, i32 1, i32 2
  store i64 3, i64* %_elt4302
  %_elt4304 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4297, i32 0, i32 1, i32 3
  store i64 1, i64* %_elt4304
  %_elt4294 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4293, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array4297, { i64, [0 x i64] }** %_elt4294
  %_raw_array4308 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array4309 = bitcast { i64, [0 x i64] }* %_raw_array4308 to { i64, [0 x i64] }*
  %_elt4310 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4309, i32 0, i32 1, i32 0
  store i64 2, i64* %_elt4310
  %_elt4312 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4309, i32 0, i32 1, i32 1
  store i64 2, i64* %_elt4312
  %_elt4314 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4309, i32 0, i32 1, i32 2
  store i64 2, i64* %_elt4314
  %_elt4316 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4309, i32 0, i32 1, i32 3
  store i64 2, i64* %_elt4316
  %_elt4306 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4293, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array4309, { i64, [0 x i64] }** %_elt4306
  %_raw_array4320 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array4321 = bitcast { i64, [0 x i64] }* %_raw_array4320 to { i64, [0 x i64] }*
  %_elt4322 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4321, i32 0, i32 1, i32 0
  store i64 3, i64* %_elt4322
  %_elt4324 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4321, i32 0, i32 1, i32 1
  store i64 2, i64* %_elt4324
  %_elt4326 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4321, i32 0, i32 1, i32 2
  store i64 1, i64* %_elt4326
  %_elt4328 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4321, i32 0, i32 1, i32 3
  store i64 4, i64* %_elt4328
  %_elt4318 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4293, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array4321, { i64, [0 x i64] }** %_elt4318
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4293, { i64, [0 x { i64, [0 x i64] }*] }** %_b4291
  %_raw_array4331 = call { i64, [0 x i64] }* @oat_alloc_array(i64 2)
  %_array4332 = bitcast { i64, [0 x i64] }* %_raw_array4331 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array4335 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array4336 = bitcast { i64, [0 x i64] }* %_raw_array4335 to { i64, [0 x i64] }*
  %_elt4337 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4336, i32 0, i32 1, i32 0
  store i64 0, i64* %_elt4337
  %_elt4339 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4336, i32 0, i32 1, i32 1
  store i64 0, i64* %_elt4339
  %_elt4341 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4336, i32 0, i32 1, i32 2
  store i64 0, i64* %_elt4341
  %_elt4343 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4336, i32 0, i32 1, i32 3
  store i64 0, i64* %_elt4343
  %_elt4333 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4332, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array4336, { i64, [0 x i64] }** %_elt4333
  %_raw_array4347 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array4348 = bitcast { i64, [0 x i64] }* %_raw_array4347 to { i64, [0 x i64] }*
  %_elt4349 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4348, i32 0, i32 1, i32 0
  store i64 0, i64* %_elt4349
  %_elt4351 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4348, i32 0, i32 1, i32 1
  store i64 0, i64* %_elt4351
  %_elt4353 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4348, i32 0, i32 1, i32 2
  store i64 0, i64* %_elt4353
  %_elt4355 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array4348, i32 0, i32 1, i32 3
  store i64 0, i64* %_elt4355
  %_elt4345 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array4332, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array4348, { i64, [0 x i64] }** %_elt4345
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array4332, { i64, [0 x { i64, [0 x i64] }*] }** %_c4330
  %_id4358 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_c4330
  %_id4360 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b4291
  %_id4362 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a4268
  call void @matrix_Mult({ i64, [0 x { i64, [0 x i64] }*] }* %_id4362, { i64, [0 x { i64, [0 x i64] }*] }* %_id4360, { i64, [0 x { i64, [0 x i64] }*] }* %_id4358)
  %_id4365 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_c4330
  call void @prnNx4(i64 %_id4365, { i64, [0 x { i64, [0 x i64] }*] }* 2)
  %_id4368 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_c4330
  %_id4370 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_b4291
  %_id4372 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a4268
  call void @matrix_MultAlt({ i64, [0 x { i64, [0 x i64] }*] }* %_id4372, { i64, [0 x { i64, [0 x i64] }*] }* %_id4370, { i64, [0 x { i64, [0 x i64] }*] }* %_id4368)
  %_id4375 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_c4330
  call void @prnNx4(i64 %_id4375, { i64, [0 x { i64, [0 x i64] }*] }* 2)
  ret i64 0
}

define void @matrix_Mult({ i64, [0 x { i64, [0 x i64] }*] }* %a1, { i64, [0 x { i64, [0 x i64] }*] }* %a2, { i64, [0 x { i64, [0 x i64] }*] }* %a3) {
  %_a34190 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_a24189 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_a14188 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i4191 = alloca i64
  %_j4202 = alloca i64
  %_k4213 = alloca i64
  store { i64, [0 x { i64, [0 x i64] }*] }* %a3, { i64, [0 x { i64, [0 x i64] }*] }** %_a34190
  store { i64, [0 x { i64, [0 x i64] }*] }* %a2, { i64, [0 x { i64, [0 x i64] }*] }** %_a24189
  store { i64, [0 x { i64, [0 x i64] }*] }* %a1, { i64, [0 x { i64, [0 x i64] }*] }** %_a14188
  store i64 0, i64* %_i4191
  br label %_pre4195
_pre4195:
  %_id4199 = load i64, i64* %_i4191
  %_bop4201 = icmp slt i64 %_id4199, 2
  %_test4192 = icmp eq i1 %_bop4201, 0
  br i1 %_test4192, label %_post4193, label %_body4194
_body4194:
  store i64 0, i64* %_j4202
  br label %_pre4206
_pre4206:
  %_id4210 = load i64, i64* %_j4202
  %_bop4212 = icmp slt i64 %_id4210, 4
  %_test4203 = icmp eq i1 %_bop4212, 0
  br i1 %_test4203, label %_post4204, label %_body4205
_body4205:
  store i64 0, i64* %_k4213
  br label %_pre4217
_pre4217:
  %_id4221 = load i64, i64* %_k4213
  %_bop4223 = icmp slt i64 %_id4221, 3
  %_test4214 = icmp eq i1 %_bop4223, 0
  br i1 %_test4214, label %_post4215, label %_body4216
_body4216:
  %_id4224 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a34190
  %_id4226 = load i64, i64* %_i4191
  %_ptr4228 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id4224, i32 0, i32 1, i64 %_id4226
  %_load4229 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr4228
  %_id4230 = load i64, i64* %_j4202
  %_ptr4232 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load4229, i32 0, i32 1, i64 %_id4230
  %_load4233 = load i64, i64* %_ptr4232
  %_id4234 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a14188
  %_id4236 = load i64, i64* %_i4191
  %_ptr4238 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id4234, i32 0, i32 1, i64 %_id4236
  %_load4239 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr4238
  %_id4240 = load i64, i64* %_k4213
  %_ptr4242 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load4239, i32 0, i32 1, i64 %_id4240
  %_load4243 = load i64, i64* %_ptr4242
  %_id4244 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a24189
  %_id4246 = load i64, i64* %_k4213
  %_ptr4248 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id4244, i32 0, i32 1, i64 %_id4246
  %_load4249 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr4248
  %_id4250 = load i64, i64* %_j4202
  %_ptr4252 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load4249, i32 0, i32 1, i64 %_id4250
  %_load4253 = load i64, i64* %_ptr4252
  %_bop4254 = mul i64 %_load4243, %_load4253
  %_bop4255 = add i64 %_load4233, %_bop4254
  %_id4256 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a34190
  %_id4258 = load i64, i64* %_i4191
  %_ptr4260 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id4256, i32 0, i32 1, i64 %_id4258
  %_load4261 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr4260
  %_id4262 = load i64, i64* %_j4202
  %_gep4265 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load4261, i32 0, i32 1, i64 %_id4262
  store i64 %_bop4255, i64* %_gep4265
  %_id4218 = load i64, i64* %_k4213
  %_bop4220 = add i64 %_id4218, 1
  store i64 %_bop4220, i64* %_k4213
  br label %_pre4217
_post4215:
  %_id4207 = load i64, i64* %_j4202
  %_bop4209 = add i64 %_id4207, 1
  store i64 %_bop4209, i64* %_j4202
  br label %_pre4206
_post4204:
  %_id4196 = load i64, i64* %_i4191
  %_bop4198 = add i64 %_id4196, 1
  store i64 %_bop4198, i64* %_i4191
  br label %_pre4195
_post4193:
  ret void
}

define void @matrix_MultAlt({ i64, [0 x { i64, [0 x i64] }*] }* %a1, { i64, [0 x { i64, [0 x i64] }*] }* %a2, { i64, [0 x { i64, [0 x i64] }*] }* %a3) {
  %_a34146 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_a24145 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_a14144 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i4147 = alloca i64
  %_j4158 = alloca i64
  store { i64, [0 x { i64, [0 x i64] }*] }* %a3, { i64, [0 x { i64, [0 x i64] }*] }** %_a34146
  store { i64, [0 x { i64, [0 x i64] }*] }* %a2, { i64, [0 x { i64, [0 x i64] }*] }** %_a24145
  store { i64, [0 x { i64, [0 x i64] }*] }* %a1, { i64, [0 x { i64, [0 x i64] }*] }** %_a14144
  store i64 0, i64* %_i4147
  br label %_pre4151
_pre4151:
  %_id4155 = load i64, i64* %_i4147
  %_bop4157 = icmp slt i64 %_id4155, 2
  %_test4148 = icmp eq i1 %_bop4157, 0
  br i1 %_test4148, label %_post4149, label %_body4150
_body4150:
  store i64 0, i64* %_j4158
  br label %_pre4162
_pre4162:
  %_id4166 = load i64, i64* %_j4158
  %_bop4168 = icmp slt i64 %_id4166, 4
  %_test4159 = icmp eq i1 %_bop4168, 0
  br i1 %_test4159, label %_post4160, label %_body4161
_body4161:
  %_id4170 = load i64, i64* %_j4158
  %_id4172 = load i64, i64* %_i4147
  %_id4174 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a24145
  %_id4176 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a14144
  %_fun4169 = call i64 @dot3({ i64, [0 x { i64, [0 x i64] }*] }* %_id4176, { i64, [0 x { i64, [0 x i64] }*] }* %_id4174, i64 %_id4172, i64 %_id4170)
  %_id4178 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a34146
  %_id4180 = load i64, i64* %_i4147
  %_ptr4182 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id4178, i32 0, i32 1, i64 %_id4180
  %_load4183 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr4182
  %_id4184 = load i64, i64* %_j4158
  %_gep4187 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load4183, i32 0, i32 1, i64 %_id4184
  store i64 %_fun4169, i64* %_gep4187
  %_id4163 = load i64, i64* %_j4158
  %_bop4165 = add i64 %_id4163, 1
  store i64 %_bop4165, i64* %_j4158
  br label %_pre4162
_post4160:
  %_id4152 = load i64, i64* %_i4147
  %_bop4154 = add i64 %_id4152, 1
  store i64 %_bop4154, i64* %_i4147
  br label %_pre4151
_post4149:
  ret void
}

define i64 @dot3({ i64, [0 x { i64, [0 x i64] }*] }* %a1, { i64, [0 x { i64, [0 x i64] }*] }* %a2, i64 %row, i64 %col) {
  %_col4105 = alloca i64
  %_row4104 = alloca i64
  %_a24103 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_a14102 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_sum4106 = alloca i64
  %_k4107 = alloca i64
  store i64 %col, i64* %_col4105
  store i64 %row, i64* %_row4104
  store { i64, [0 x { i64, [0 x i64] }*] }* %a2, { i64, [0 x { i64, [0 x i64] }*] }** %_a24103
  store { i64, [0 x { i64, [0 x i64] }*] }* %a1, { i64, [0 x { i64, [0 x i64] }*] }** %_a14102
  store i64 0, i64* %_sum4106
  store i64 0, i64* %_k4107
  br label %_pre4111
_pre4111:
  %_id4115 = load i64, i64* %_k4107
  %_bop4117 = icmp slt i64 %_id4115, 3
  %_test4108 = icmp eq i1 %_bop4117, 0
  br i1 %_test4108, label %_post4109, label %_body4110
_body4110:
  %_id4118 = load i64, i64* %_sum4106
  %_id4120 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a14102
  %_id4122 = load i64, i64* %_row4104
  %_ptr4124 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id4120, i32 0, i32 1, i64 %_id4122
  %_load4125 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr4124
  %_id4126 = load i64, i64* %_k4107
  %_ptr4128 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load4125, i32 0, i32 1, i64 %_id4126
  %_load4129 = load i64, i64* %_ptr4128
  %_id4130 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_a24103
  %_id4132 = load i64, i64* %_k4107
  %_ptr4134 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id4130, i32 0, i32 1, i64 %_id4132
  %_load4135 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr4134
  %_id4136 = load i64, i64* %_col4105
  %_ptr4138 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load4135, i32 0, i32 1, i64 %_id4136
  %_load4139 = load i64, i64* %_ptr4138
  %_bop4140 = mul i64 %_load4129, %_load4139
  %_bop4141 = add i64 %_id4118, %_bop4140
  store i64 %_bop4141, i64* %_sum4106
  %_id4112 = load i64, i64* %_k4107
  %_bop4114 = add i64 %_id4112, 1
  store i64 %_bop4114, i64* %_k4107
  br label %_pre4111
_post4109:
  %_id4142 = load i64, i64* %_sum4106
  ret i64 %_id4142
}

define void @prnNx4({ i64, [0 x { i64, [0 x i64] }*] }* %ar, i64 %n) {
  %_n4060 = alloca i64
  %_ar4059 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i4061 = alloca i64
  %_j4074 = alloca i64
  store i64 %n, i64* %_n4060
  store { i64, [0 x { i64, [0 x i64] }*] }* %ar, { i64, [0 x { i64, [0 x i64] }*] }** %_ar4059
  store i64 0, i64* %_i4061
  br label %_pre4065
_pre4065:
  %_id4069 = load i64, i64* %_i4061
  %_id4071 = load i64, i64* %_n4060
  %_bop4073 = icmp slt i64 %_id4069, %_id4071
  %_test4062 = icmp eq i1 %_bop4073, 0
  br i1 %_test4062, label %_post4063, label %_body4064
_body4064:
  store i64 0, i64* %_j4074
  br label %_pre4078
_pre4078:
  %_id4082 = load i64, i64* %_j4074
  %_bop4084 = icmp slt i64 %_id4082, 4
  %_test4075 = icmp eq i1 %_bop4084, 0
  br i1 %_test4075, label %_post4076, label %_body4077
_body4077:
  %_id4086 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_ar4059
  %_id4088 = load i64, i64* %_i4061
  %_ptr4090 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id4086, i32 0, i32 1, i64 %_id4088
  %_load4091 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr4090
  %_id4092 = load i64, i64* %_j4074
  %_ptr4094 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load4091, i32 0, i32 1, i64 %_id4092
  %_load4095 = load i64, i64* %_ptr4094
  call void @print_int(i64 %_load4095)
  %_str4098 = bitcast [2 x i8]* @_str4097 to i8*
  call void @print_string(i8* %_str4098)
  %_id4079 = load i64, i64* %_j4074
  %_bop4081 = add i64 %_id4079, 1
  store i64 %_bop4081, i64* %_j4074
  br label %_pre4078
_post4076:
  %_str4101 = bitcast [2 x i8]* @_str4100 to i8*
  call void @print_string(i8* %_str4101)
  %_id4066 = load i64, i64* %_i4061
  %_bop4068 = add i64 %_id4066, 1
  store i64 %_bop4068, i64* %_i4061
  br label %_pre4065
_post4063:
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
