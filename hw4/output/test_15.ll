; generated from: atprograms/qsort.oat
target triple = "x86_64-apple-macosx10.10.0"
define void @quick_sort({ i64, [0 x i64] }* %a, i64 %l, i64 %r) {
  %_r3205 = alloca i64
  %_l3204 = alloca i64
  %_a3203 = alloca { i64, [0 x i64] }*
  %_j3206 = alloca i64
  store i64 %r, i64* %_r3205
  store i64 %l, i64* %_l3204
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_a3203
  store i64 0, i64* %_j3206
  %_id3211 = load i64, i64* %_l3204
  %_id3213 = load i64, i64* %_r3205
  %_bop3215 = icmp slt i64 %_id3211, %_id3213
  %_test3210 = icmp eq i1 %_bop3215, 0
  br i1 %_test3210, label %_else3208, label %_then3207
_then3207:
  %_id3217 = load i64, i64* %_r3205
  %_id3219 = load i64, i64* %_l3204
  %_id3221 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3203
  %_fun3216 = call i64 @partition(i64 %_id3221, i64 %_id3219, { i64, [0 x i64] }* %_id3217)
  store i64 %_fun3216, i64* %_j3206
  %_id3224 = load i64, i64* %_j3206
  %_bop3226 = sub i64 %_id3224, 1
  %_id3227 = load i64, i64* %_l3204
  %_id3229 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3203
  call void @quick_sort(i64 %_id3229, i64 %_id3227, { i64, [0 x i64] }* %_bop3226)
  %_id3232 = load i64, i64* %_r3205
  %_id3234 = load i64, i64* %_j3206
  %_bop3236 = add i64 %_id3234, 1
  %_id3237 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3203
  call void @quick_sort(i64 %_id3237, i64 %_bop3236, { i64, [0 x i64] }* %_id3232)
  br label %_merge3209
_else3208:
  br label %_merge3209
_merge3209:
  ret void
}

define i64 @partition({ i64, [0 x i64] }* %a, i64 %l, i64 %r) {
  %_r3065 = alloca i64
  %_l3064 = alloca i64
  %_a3063 = alloca { i64, [0 x i64] }*
  %_pivot3066 = alloca i64
  %_i3073 = alloca i64
  %_j3076 = alloca i64
  %_t3080 = alloca i64
  %_done3081 = alloca i64
  store i64 %r, i64* %_r3065
  store i64 %l, i64* %_l3064
  store { i64, [0 x i64] }* %a, { i64, [0 x i64] }** %_a3063
  %_id3067 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3063
  %_id3069 = load i64, i64* %_l3064
  %_ptr3071 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3067, i32 0, i32 1, i64 %_id3069
  %_load3072 = load i64, i64* %_ptr3071
  store i64 %_load3072, i64* %_pivot3066
  %_id3074 = load i64, i64* %_l3064
  store i64 %_id3074, i64* %_i3073
  %_id3077 = load i64, i64* %_r3065
  %_bop3079 = add i64 %_id3077, 1
  store i64 %_bop3079, i64* %_j3076
  store i64 0, i64* %_t3080
  store i64 0, i64* %_done3081
  br label %_pre3085
_pre3085:
  %_id3086 = load i64, i64* %_done3081
  %_bop3088 = icmp eq i64 %_id3086, 0
  %_test3082 = icmp eq i1 %_bop3088, 0
  br i1 %_test3082, label %_post3083, label %_body3084
_body3084:
  %_id3089 = load i64, i64* %_i3073
  %_bop3091 = add i64 %_id3089, 1
  store i64 %_bop3091, i64* %_i3073
  br label %_pre3095
_pre3095:
  %_id3096 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3063
  %_id3098 = load i64, i64* %_i3073
  %_ptr3100 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3096, i32 0, i32 1, i64 %_id3098
  %_load3101 = load i64, i64* %_ptr3100
  %_id3102 = load i64, i64* %_pivot3066
  %_bop3104 = icmp sle i64 %_load3101, %_id3102
  %_id3105 = load i64, i64* %_i3073
  %_id3107 = load i64, i64* %_r3065
  %_bop3109 = icmp sle i64 %_id3105, %_id3107
  %_bop3110 = and i1 %_bop3104, %_bop3109
  %_test3092 = icmp eq i1 %_bop3110, 0
  br i1 %_test3092, label %_post3093, label %_body3094
_body3094:
  %_id3111 = load i64, i64* %_i3073
  %_bop3113 = add i64 %_id3111, 1
  store i64 %_bop3113, i64* %_i3073
  br label %_pre3095
_post3093:
  %_id3114 = load i64, i64* %_j3076
  %_bop3116 = sub i64 %_id3114, 1
  store i64 %_bop3116, i64* %_j3076
  br label %_pre3120
_pre3120:
  %_id3121 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3063
  %_id3123 = load i64, i64* %_j3076
  %_ptr3125 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3121, i32 0, i32 1, i64 %_id3123
  %_load3126 = load i64, i64* %_ptr3125
  %_id3127 = load i64, i64* %_pivot3066
  %_bop3129 = icmp sgt i64 %_load3126, %_id3127
  %_test3117 = icmp eq i1 %_bop3129, 0
  br i1 %_test3117, label %_post3118, label %_body3119
_body3119:
  %_id3130 = load i64, i64* %_j3076
  %_bop3132 = sub i64 %_id3130, 1
  store i64 %_bop3132, i64* %_j3076
  br label %_pre3120
_post3118:
  %_id3137 = load i64, i64* %_i3073
  %_id3139 = load i64, i64* %_j3076
  %_bop3141 = icmp sge i64 %_id3137, %_id3139
  %_test3136 = icmp eq i1 %_bop3141, 0
  br i1 %_test3136, label %_else3134, label %_then3133
_then3133:
  store i64 1, i64* %_done3081
  br label %_merge3135
_else3134:
  br label %_merge3135
_merge3135:
  %_id3146 = load i64, i64* %_done3081
  %_bop3148 = icmp eq i64 %_id3146, 0
  %_test3145 = icmp eq i1 %_bop3148, 0
  br i1 %_test3145, label %_else3143, label %_then3142
_then3142:
  %_id3149 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3063
  %_id3151 = load i64, i64* %_i3073
  %_ptr3153 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3149, i32 0, i32 1, i64 %_id3151
  %_load3154 = load i64, i64* %_ptr3153
  store i64 %_load3154, i64* %_t3080
  %_id3155 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3063
  %_id3157 = load i64, i64* %_j3076
  %_ptr3159 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3155, i32 0, i32 1, i64 %_id3157
  %_load3160 = load i64, i64* %_ptr3159
  %_id3161 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3063
  %_id3163 = load i64, i64* %_i3073
  %_gep3166 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3161, i32 0, i32 1, i64 %_id3163
  store i64 %_load3160, i64* %_gep3166
  %_id3167 = load i64, i64* %_t3080
  %_id3169 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3063
  %_id3171 = load i64, i64* %_j3076
  %_gep3174 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3169, i32 0, i32 1, i64 %_id3171
  store i64 %_id3167, i64* %_gep3174
  br label %_merge3144
_else3143:
  br label %_merge3144
_merge3144:
  br label %_pre3085
_post3083:
  %_id3175 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3063
  %_id3177 = load i64, i64* %_l3064
  %_ptr3179 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3175, i32 0, i32 1, i64 %_id3177
  %_load3180 = load i64, i64* %_ptr3179
  store i64 %_load3180, i64* %_t3080
  %_id3181 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3063
  %_id3183 = load i64, i64* %_j3076
  %_ptr3185 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3181, i32 0, i32 1, i64 %_id3183
  %_load3186 = load i64, i64* %_ptr3185
  %_id3187 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3063
  %_id3189 = load i64, i64* %_l3064
  %_gep3192 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3187, i32 0, i32 1, i64 %_id3189
  store i64 %_load3186, i64* %_gep3192
  %_id3193 = load i64, i64* %_t3080
  %_id3195 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3063
  %_id3197 = load i64, i64* %_j3076
  %_gep3200 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_id3195, i32 0, i32 1, i64 %_id3197
  store i64 %_id3193, i64* %_gep3200
  %_id3201 = load i64, i64* %_j3076
  ret i64 %_id3201
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv3030 = alloca { i64, [0 x i8*] }*
  %_argc3029 = alloca i64
  %_a3031 = alloca { i64, [0 x i64] }*
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv3030
  store i64 %argc, i64* %_argc3029
  %_raw_array3032 = call { i64, [0 x i64] }* @oat_alloc_array(i64 9)
  %_array3033 = bitcast { i64, [0 x i64] }* %_raw_array3032 to { i64, [0 x i64] }*
  %_elt3034 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3033, i32 0, i32 1, i32 0
  store i64 107, i64* %_elt3034
  %_elt3036 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3033, i32 0, i32 1, i32 1
  store i64 112, i64* %_elt3036
  %_elt3038 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3033, i32 0, i32 1, i32 2
  store i64 121, i64* %_elt3038
  %_elt3040 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3033, i32 0, i32 1, i32 3
  store i64 102, i64* %_elt3040
  %_elt3042 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3033, i32 0, i32 1, i32 4
  store i64 123, i64* %_elt3042
  %_elt3044 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3033, i32 0, i32 1, i32 5
  store i64 115, i64* %_elt3044
  %_elt3046 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3033, i32 0, i32 1, i32 6
  store i64 104, i64* %_elt3046
  %_elt3048 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3033, i32 0, i32 1, i32 7
  store i64 111, i64* %_elt3048
  %_elt3050 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array3033, i32 0, i32 1, i32 8
  store i64 109, i64* %_elt3050
  store { i64, [0 x i64] }* %_array3033, { i64, [0 x i64] }** %_a3031
  %_id3054 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3031
  %_fun3053 = call i8* @string_of_array({ i64, [0 x i64] }* %_id3054)
  call void @print_string(i8* %_fun3053)
  %_id3057 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3031
  call void @quick_sort(i64 %_id3057, i64 0, { i64, [0 x i64] }* 8)
  %_id3061 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_a3031
  %_fun3060 = call i8* @string_of_array({ i64, [0 x i64] }* %_id3061)
  call void @print_string(i8* %_fun3060)
  ret i64 255
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
