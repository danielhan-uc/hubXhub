; generated from: atprograms/life.oat
target triple = "x86_64-apple-macosx10.10.0"
@len = global i64 4

define i64 @check({ i64, [0 x { i64, [0 x i64] }*] }* %board, i64 %i, i64 %j, i64 %count) {
  %_count7433 = alloca i64
  %_j7432 = alloca i64
  %_i7431 = alloca i64
  %_board7430 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %count, i64* %_count7433
  store i64 %j, i64* %_j7432
  store i64 %i, i64* %_i7431
  store { i64, [0 x { i64, [0 x i64] }*] }* %board, { i64, [0 x { i64, [0 x i64] }*] }** %_board7430
  %_id7438 = load i64, i64* %_i7431
  %_bop7440 = icmp sge i64 %_id7438, 0
  %_id7441 = load i64, i64* %_j7432
  %_bop7443 = icmp sge i64 %_id7441, 0
  %_bop7444 = and i1 %_bop7440, %_bop7443
  %_id7445 = load i64, i64* %_i7431
  %_id7447 = load i64, i64* @len
  %_bop7449 = icmp slt i64 %_id7445, %_id7447
  %_bop7450 = and i1 %_bop7444, %_bop7449
  %_id7451 = load i64, i64* %_j7432
  %_id7453 = load i64, i64* @len
  %_bop7455 = icmp slt i64 %_id7451, %_id7453
  %_bop7456 = and i1 %_bop7450, %_bop7455
  %_test7437 = icmp eq i1 %_bop7456, 0
  br i1 %_test7437, label %_else7435, label %_then7434
_then7434:
  %_id7457 = load i64, i64* %_count7433
  %_id7459 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_board7430
  %_id7461 = load i64, i64* %_i7431
  %_ptr7463 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id7459, i32 0, i32 1, i64 %_id7461
  %_load7464 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr7463
  %_id7465 = load i64, i64* %_j7432
  %_ptr7467 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load7464, i32 0, i32 1, i64 %_id7465
  %_load7468 = load i64, i64* %_ptr7467
  %_bop7469 = add i64 %_id7457, %_load7468
  ret i64 %_bop7469
_else7435:
  %_id7470 = load i64, i64* %_count7433
  ret i64 %_id7470
}

define i64 @val_at({ i64, [0 x { i64, [0 x i64] }*] }* %board, i64 %i, i64 %j) {
  %_j7305 = alloca i64
  %_i7304 = alloca i64
  %_board7303 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_alive7306 = alloca i64
  %_count7317 = alloca i64
  store i64 %j, i64* %_j7305
  store i64 %i, i64* %_i7304
  store { i64, [0 x { i64, [0 x i64] }*] }* %board, { i64, [0 x { i64, [0 x i64] }*] }** %_board7303
  %_id7307 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_board7303
  %_id7309 = load i64, i64* %_i7304
  %_ptr7311 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id7307, i32 0, i32 1, i64 %_id7309
  %_load7312 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr7311
  %_id7313 = load i64, i64* %_j7305
  %_ptr7315 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load7312, i32 0, i32 1, i64 %_id7313
  %_load7316 = load i64, i64* %_ptr7315
  store i64 %_load7316, i64* %_alive7306
  store i64 0, i64* %_count7317
  %_id7319 = load i64, i64* %_count7317
  %_id7321 = load i64, i64* %_j7305
  %_bop7323 = sub i64 %_id7321, 1
  %_id7324 = load i64, i64* %_i7304
  %_bop7326 = sub i64 %_id7324, 1
  %_id7327 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_board7303
  %_fun7318 = call i64 @check(i64 %_id7327, i64 %_bop7326, i64 %_bop7323, { i64, [0 x { i64, [0 x i64] }*] }* %_id7319)
  store i64 %_fun7318, i64* %_count7317
  %_id7330 = load i64, i64* %_count7317
  %_id7332 = load i64, i64* %_j7305
  %_id7334 = load i64, i64* %_i7304
  %_bop7336 = sub i64 %_id7334, 1
  %_id7337 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_board7303
  %_fun7329 = call i64 @check(i64 %_id7337, i64 %_bop7336, i64 %_id7332, { i64, [0 x { i64, [0 x i64] }*] }* %_id7330)
  store i64 %_fun7329, i64* %_count7317
  %_id7340 = load i64, i64* %_count7317
  %_id7342 = load i64, i64* %_j7305
  %_bop7344 = add i64 %_id7342, 1
  %_id7345 = load i64, i64* %_i7304
  %_bop7347 = sub i64 %_id7345, 1
  %_id7348 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_board7303
  %_fun7339 = call i64 @check(i64 %_id7348, i64 %_bop7347, i64 %_bop7344, { i64, [0 x { i64, [0 x i64] }*] }* %_id7340)
  store i64 %_fun7339, i64* %_count7317
  %_id7351 = load i64, i64* %_count7317
  %_id7353 = load i64, i64* %_j7305
  %_bop7355 = sub i64 %_id7353, 1
  %_id7356 = load i64, i64* %_i7304
  %_id7358 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_board7303
  %_fun7350 = call i64 @check(i64 %_id7358, i64 %_id7356, i64 %_bop7355, { i64, [0 x { i64, [0 x i64] }*] }* %_id7351)
  store i64 %_fun7350, i64* %_count7317
  %_id7361 = load i64, i64* %_count7317
  %_id7363 = load i64, i64* %_j7305
  %_bop7365 = add i64 %_id7363, 1
  %_id7366 = load i64, i64* %_i7304
  %_id7368 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_board7303
  %_fun7360 = call i64 @check(i64 %_id7368, i64 %_id7366, i64 %_bop7365, { i64, [0 x { i64, [0 x i64] }*] }* %_id7361)
  store i64 %_fun7360, i64* %_count7317
  %_id7371 = load i64, i64* %_count7317
  %_id7373 = load i64, i64* %_j7305
  %_bop7375 = sub i64 %_id7373, 1
  %_id7376 = load i64, i64* %_i7304
  %_bop7378 = add i64 %_id7376, 1
  %_id7379 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_board7303
  %_fun7370 = call i64 @check(i64 %_id7379, i64 %_bop7378, i64 %_bop7375, { i64, [0 x { i64, [0 x i64] }*] }* %_id7371)
  store i64 %_fun7370, i64* %_count7317
  %_id7382 = load i64, i64* %_count7317
  %_id7384 = load i64, i64* %_j7305
  %_id7386 = load i64, i64* %_i7304
  %_bop7388 = add i64 %_id7386, 1
  %_id7389 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_board7303
  %_fun7381 = call i64 @check(i64 %_id7389, i64 %_bop7388, i64 %_id7384, { i64, [0 x { i64, [0 x i64] }*] }* %_id7382)
  store i64 %_fun7381, i64* %_count7317
  %_id7392 = load i64, i64* %_count7317
  %_id7394 = load i64, i64* %_j7305
  %_bop7396 = add i64 %_id7394, 1
  %_id7397 = load i64, i64* %_i7304
  %_bop7399 = add i64 %_id7397, 1
  %_id7400 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_board7303
  %_fun7391 = call i64 @check(i64 %_id7400, i64 %_bop7399, i64 %_bop7396, { i64, [0 x { i64, [0 x i64] }*] }* %_id7392)
  store i64 %_fun7391, i64* %_count7317
  %_id7406 = load i64, i64* %_alive7306
  %_bop7408 = icmp eq i64 %_id7406, 1
  %_test7405 = icmp eq i1 %_bop7408, 0
  br i1 %_test7405, label %_else7403, label %_then7402
_then7402:
  %_id7413 = load i64, i64* %_count7317
  %_bop7415 = icmp slt i64 %_id7413, 2
  %_test7412 = icmp eq i1 %_bop7415, 0
  br i1 %_test7412, label %_else7410, label %_then7409
_then7409:
  ret i64 0
_else7410:
  %_id7420 = load i64, i64* %_count7317
  %_bop7422 = icmp slt i64 %_id7420, 4
  %_test7419 = icmp eq i1 %_bop7422, 0
  br i1 %_test7419, label %_else7417, label %_then7416
_then7416:
  ret i64 1
_else7417:
  br label %_merge7418
_merge7418:
  br label %_merge7411
_merge7411:
  ret i64 0
_else7403:
  br label %_merge7404
_merge7404:
  %_id7427 = load i64, i64* %_count7317
  %_bop7429 = icmp eq i64 %_id7427, 3
  %_test7426 = icmp eq i1 %_bop7429, 0
  br i1 %_test7426, label %_else7424, label %_then7423
_then7423:
  ret i64 1
_else7424:
  ret i64 0
_merge7425:
  ret i64 0
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv7164 = alloca { i64, [0 x i8*] }*
  %_argc7163 = alloca i64
  %_board7165 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_new_board7216 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i7219 = alloca i64
  %_j7238 = alloca i64
  %_i7266 = alloca i64
  %_j7279 = alloca i64
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv7164
  store i64 %argc, i64* %_argc7163
  %_raw_array7166 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array7167 = bitcast { i64, [0 x i64] }* %_raw_array7166 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array7170 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array7171 = bitcast { i64, [0 x i64] }* %_raw_array7170 to { i64, [0 x i64] }*
  %_elt7172 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7171, i32 0, i32 1, i32 0
  store i64 0, i64* %_elt7172
  %_elt7174 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7171, i32 0, i32 1, i32 1
  store i64 0, i64* %_elt7174
  %_elt7176 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7171, i32 0, i32 1, i32 2
  store i64 0, i64* %_elt7176
  %_elt7178 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7171, i32 0, i32 1, i32 3
  store i64 0, i64* %_elt7178
  %_elt7168 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array7167, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array7171, { i64, [0 x i64] }** %_elt7168
  %_raw_array7182 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array7183 = bitcast { i64, [0 x i64] }* %_raw_array7182 to { i64, [0 x i64] }*
  %_elt7184 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7183, i32 0, i32 1, i32 0
  store i64 0, i64* %_elt7184
  %_elt7186 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7183, i32 0, i32 1, i32 1
  store i64 1, i64* %_elt7186
  %_elt7188 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7183, i32 0, i32 1, i32 2
  store i64 1, i64* %_elt7188
  %_elt7190 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7183, i32 0, i32 1, i32 3
  store i64 1, i64* %_elt7190
  %_elt7180 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array7167, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array7183, { i64, [0 x i64] }** %_elt7180
  %_raw_array7194 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array7195 = bitcast { i64, [0 x i64] }* %_raw_array7194 to { i64, [0 x i64] }*
  %_elt7196 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7195, i32 0, i32 1, i32 0
  store i64 1, i64* %_elt7196
  %_elt7198 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7195, i32 0, i32 1, i32 1
  store i64 1, i64* %_elt7198
  %_elt7200 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7195, i32 0, i32 1, i32 2
  store i64 1, i64* %_elt7200
  %_elt7202 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7195, i32 0, i32 1, i32 3
  store i64 0, i64* %_elt7202
  %_elt7192 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array7167, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array7195, { i64, [0 x i64] }** %_elt7192
  %_raw_array7206 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array7207 = bitcast { i64, [0 x i64] }* %_raw_array7206 to { i64, [0 x i64] }*
  %_elt7208 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7207, i32 0, i32 1, i32 0
  store i64 0, i64* %_elt7208
  %_elt7210 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7207, i32 0, i32 1, i32 1
  store i64 0, i64* %_elt7210
  %_elt7212 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7207, i32 0, i32 1, i32 2
  store i64 0, i64* %_elt7212
  %_elt7214 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array7207, i32 0, i32 1, i32 3
  store i64 0, i64* %_elt7214
  %_elt7204 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array7167, i32 0, i32 1, i32 3
  store { i64, [0 x i64] }* %_array7207, { i64, [0 x i64] }** %_elt7204
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array7167, { i64, [0 x { i64, [0 x i64] }*] }** %_board7165
  %_raw_array7217 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array7218 = bitcast { i64, [0 x i64] }* %_raw_array7217 to { i64, [0 x { i64, [0 x i64] }*] }*
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array7218, { i64, [0 x { i64, [0 x i64] }*] }** %_new_board7216
  store i64 0, i64* %_i7219
  br label %_pre7223
_pre7223:
  %_id7227 = load i64, i64* %_i7219
  %_bop7229 = icmp slt i64 %_id7227, 4
  %_test7220 = icmp eq i1 %_bop7229, 0
  br i1 %_test7220, label %_post7221, label %_body7222
_body7222:
  %_raw_array7230 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array7231 = bitcast { i64, [0 x i64] }* %_raw_array7230 to { i64, [0 x i64] }*
  %_id7232 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_new_board7216
  %_id7234 = load i64, i64* %_i7219
  %_gep7237 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id7232, i32 0, i32 1, i64 %_id7234
  store { i64, [0 x i64] }* %_array7231, { i64, [0 x i64] }** %_gep7237
  store i64 0, i64* %_j7238
  br label %_pre7242
_pre7242:
  %_id7246 = load i64, i64* %_j7238
  %_bop7248 = icmp slt i64 %_id7246, 4
  %_test7239 = icmp eq i1 %_bop7248, 0
  br i1 %_test7239, label %_post7240, label %_body7241
_body7241:
  %_id7250 = load i64, i64* %_j7238
  %_id7252 = load i64, i64* %_i7219
  %_id7254 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_board7165
  %_fun7249 = call i64 @val_at(i64 %_id7254, i64 %_id7252, { i64, [0 x { i64, [0 x i64] }*] }* %_id7250)
  %_id7256 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_new_board7216
  %_id7258 = load i64, i64* %_i7219
  %_ptr7260 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id7256, i32 0, i32 1, i64 %_id7258
  %_load7261 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr7260
  %_id7262 = load i64, i64* %_j7238
  %_gep7265 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load7261, i32 0, i32 1, i64 %_id7262
  store i64 %_fun7249, i64* %_gep7265
  %_id7243 = load i64, i64* %_j7238
  %_bop7245 = add i64 %_id7243, 1
  store i64 %_bop7245, i64* %_j7238
  br label %_pre7242
_post7240:
  %_id7224 = load i64, i64* %_i7219
  %_bop7226 = add i64 %_id7224, 1
  store i64 %_bop7226, i64* %_i7219
  br label %_pre7223
_post7221:
  store i64 0, i64* %_i7266
  br label %_pre7270
_pre7270:
  %_id7274 = load i64, i64* %_i7266
  %_id7276 = load i64, i64* @len
  %_bop7278 = icmp slt i64 %_id7274, %_id7276
  %_test7267 = icmp eq i1 %_bop7278, 0
  br i1 %_test7267, label %_post7268, label %_body7269
_body7269:
  store i64 0, i64* %_j7279
  br label %_pre7283
_pre7283:
  %_id7287 = load i64, i64* %_j7279
  %_id7289 = load i64, i64* @len
  %_bop7291 = icmp slt i64 %_id7287, %_id7289
  %_test7280 = icmp eq i1 %_bop7291, 0
  br i1 %_test7280, label %_post7281, label %_body7282
_body7282:
  %_id7293 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_new_board7216
  %_id7295 = load i64, i64* %_i7266
  %_ptr7297 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id7293, i32 0, i32 1, i64 %_id7295
  %_load7298 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr7297
  %_id7299 = load i64, i64* %_j7279
  %_ptr7301 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load7298, i32 0, i32 1, i64 %_id7299
  %_load7302 = load i64, i64* %_ptr7301
  call void @print_int(i64 %_load7302)
  %_id7284 = load i64, i64* %_j7279
  %_bop7286 = add i64 %_id7284, 1
  store i64 %_bop7286, i64* %_j7279
  br label %_pre7283
_post7281:
  %_id7271 = load i64, i64* %_i7266
  %_bop7273 = add i64 %_id7271, 1
  store i64 %_bop7273, i64* %_i7266
  br label %_pre7270
_post7268:
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
