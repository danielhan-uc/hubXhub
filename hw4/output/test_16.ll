; generated from: atprograms/bsort.oat
target triple = "x86_64-apple-macosx10.10.0"
@_str3285 = global [2 x i8] c" \00"

define void @bubble_sort({ i64, [0 x i64] }* %numbers, i64 %array_size) {
  %_array_size3296 = alloca i64
  %_numbers3295 = alloca { i64, [0 x i64] }*
  %_temp3297 = alloca i64
  %_i3298 = alloca i64
  %_j3312 = alloca i64
  store i64 %array_size, i64* %_array_size3296
  store { i64, [0 x i64] }* %numbers, { i64, [0 x i64] }** %_numbers3295
  store i64 0, i64* %_temp3297
  %_id3299 = load i64, i64* %_array_size3296
  %_bop3301 = sub i64 %_id3299, 1
  store i64 %_bop3301, i64* %_i3298
  br label %_pre3305
_pre3305:
  %_id3309 = load i64, i64* %_i3298
  %_bop3311 = icmp sgt i64 %_id3309, 0
  %_test3302 = icmp eq i1 %_bop3311, 0
  br i1 %_test3302, label %_post3303, label %_body3304
_body3304:
  store i64 1, i64* %_j3312
  br label %_pre3316
_pre3316:
  %_id3320 = load i64, i64* %_j3312
  %_id3322 = load i64, i64* %_i3298
  %_bop3324 = icmp sle i64 %_id3320, %_id3322
  %_test3313 = icmp eq i1 %_bop3324, 0
  br i1 %_test3313, label %_post3314, label %_body3315
_body3315:
  %_id3329 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_numbers3295
  %_id3331 = load i64, i64* %_j3312
  %_bop3333 = sub i64 %_id3331, 1
  %_ptr3334 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3329, i32 0, i32 1, i64 %_bop3333
  %_load3335 = load i64, i64* %_ptr3334
  %_id3336 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_numbers3295
  %_id3338 = load i64, i64* %_i3298
  %_ptr3340 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3336, i32 0, i32 1, i64 %_id3338
  %_load3341 = load i64, i64* %_ptr3340
  %_bop3342 = icmp sgt i64 %_load3335, %_load3341
  %_test3328 = icmp eq i1 %_bop3342, 0
  br i1 %_test3328, label %_else3326, label %_then3325
_then3325:
  %_id3343 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_numbers3295
  %_id3345 = load i64, i64* %_j3312
  %_bop3347 = sub i64 %_id3345, 1
  %_ptr3348 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3343, i32 0, i32 1, i64 %_bop3347
  %_load3349 = load i64, i64* %_ptr3348
  store i64 %_load3349, i64* %_temp3297
  %_id3350 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_numbers3295
  %_id3352 = load i64, i64* %_i3298
  %_ptr3354 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3350, i32 0, i32 1, i64 %_id3352
  %_load3355 = load i64, i64* %_ptr3354
  %_id3356 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_numbers3295
  %_id3358 = load i64, i64* %_j3312
  %_bop3360 = sub i64 %_id3358, 1
  %_gep3362 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3356, i32 0, i32 1, i64 %_bop3360
  store i64 %_load3355, i64* %_gep3362
  %_id3363 = load i64, i64* %_temp3297
  %_id3365 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_numbers3295
  %_id3367 = load i64, i64* %_i3298
  %_gep3370 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3365, i32 0, i32 1, i64 %_id3367
  store i64 %_id3363, i64* %_gep3370
  br label %_merge3327
_else3326:
  br label %_merge3327
_merge3327:
  %_id3317 = load i64, i64* %_j3312
  %_bop3319 = add i64 %_id3317, 1
  store i64 %_bop3319, i64* %_j3312
  br label %_pre3316
_post3314:
  %_id3306 = load i64, i64* %_i3298
  %_bop3308 = sub i64 %_id3306, 1
  store i64 %_bop3308, i64* %_i3298
  br label %_pre3305
_post3303:
  ret void
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv3244 = alloca { i64, [0 x i8*] }*
  %_argc3243 = alloca i64
  %_a3245 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv3244
  store i64 %argc, i64* %_argc3243
  %_raw_array3246 = call { i64, [0 x i64] }* @oat_alloc_array(i64 8)
  %_array3247 = bitcast { i64, [0 x i64] }* %_raw_array3246 to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_array3247, { i64, [0 x i64] }** %_a3245
  %_id3248 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3245
  %_gep3251 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3248, i32 0, i32 1, i32 0
  store i64 121, i64* %_gep3251
  %_id3252 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3245
  %_gep3255 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3252, i32 0, i32 1, i32 1
  store i64 125, i64* %_gep3255
  %_id3256 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3245
  %_gep3259 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3256, i32 0, i32 1, i32 2
  store i64 120, i64* %_gep3259
  %_id3260 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3245
  %_gep3263 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3260, i32 0, i32 1, i32 3
  store i64 111, i64* %_gep3263
  %_id3264 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3245
  %_gep3267 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3264, i32 0, i32 1, i32 4
  store i64 116, i64* %_gep3267
  %_id3268 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3245
  %_gep3271 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3268, i32 0, i32 1, i32 5
  store i64 110, i64* %_gep3271
  %_id3272 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3245
  %_gep3275 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3272, i32 0, i32 1, i32 6
  store i64 117, i64* %_gep3275
  %_id3276 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3245
  %_gep3279 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3276, i32 0, i32 1, i32 7
  store i64 119, i64* %_gep3279
  %_id3282 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3245
  %_fun3281 = call i8* @string_of_array({ i64, [0 x i64] }* %_id3282)
  call void @print_string(i8* %_fun3281)
  %_str3286 = bitcast [2 x i8]* @_str3285 to i8*
  call void @print_string(i8* %_str3286)
  %_id3288 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3245
  call void @bubble_sort(i64 %_id3288, { i64, [0 x i64] }* 8)
  %_id3292 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3245
  %_fun3291 = call i8* @string_of_array({ i64, [0 x i64] }* %_id3292)
  call void @print_string(i8* %_fun3291)
  %_uop3294 = sub i64 0, 1
  ret i64 %_uop3294
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
