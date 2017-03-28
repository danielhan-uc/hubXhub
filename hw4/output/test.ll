; generated from: atprograms/run23.oat
target triple = "x86_64-apple-macosx10.10.0"
@_str1770 = global [4 x i8] c"abc\00"
@_str1774 = global [4 x i8] c"def\00"
@_str1782 = global [4 x i8] c"789\00"
@_str1786 = global [4 x i8] c"123\00"

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv1760 = alloca { i64, [0 x i8*] }*
  %_argc1759 = alloca i64
  %_strs1761 = alloca { i64, [0 x { i64, [0 x i8*] }*] }*
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv1760
  store i64 %argc, i64* %_argc1759
  %_raw_array1762 = call { i64, [0 x i64] }* @oat_alloc_array(i64 2)
  %_array1763 = bitcast { i64, [0 x i64] }* %_raw_array1762 to { i64, [0 x { i64, [0 x i8*] }*] }*
  %_raw_array1766 = call { i64, [0 x i64] }* @oat_alloc_array(i64 2)
  %_array1767 = bitcast { i64, [0 x i64] }* %_raw_array1766 to { i64, [0 x i8*] }*
  %_str1771 = bitcast [4 x i8]* @_str1770 to i8*
  %_elt1768 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_array1767, i32 0, i32 1, i32 0
  store i8* %_str1771, i8** %_elt1768
  %_str1775 = bitcast [4 x i8]* @_str1774 to i8*
  %_elt1772 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_array1767, i32 0, i32 1, i32 1
  store i8* %_str1775, i8** %_elt1772
  %_elt1764 = getelementptr { i64, [0 x { i64, [0 x i8*] }*] }, { i64, [0 x { i64, [0 x i8*] }*] }* %_array1763, i32 0, i32 1, i32 0
  store { i64, [0 x i8*] }* %_array1767, { i64, [0 x i8*] }** %_elt1764
  %_raw_array1778 = call { i64, [0 x i64] }* @oat_alloc_array(i64 2)
  %_array1779 = bitcast { i64, [0 x i64] }* %_raw_array1778 to { i64, [0 x i8*] }*
  %_str1783 = bitcast [4 x i8]* @_str1782 to i8*
  %_elt1780 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_array1779, i32 0, i32 1, i32 0
  store i8* %_str1783, i8** %_elt1780
  %_str1787 = bitcast [4 x i8]* @_str1786 to i8*
  %_elt1784 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_array1779, i32 0, i32 1, i32 1
  store i8* %_str1787, i8** %_elt1784
  %_elt1776 = getelementptr { i64, [0 x { i64, [0 x i8*] }*] }, { i64, [0 x { i64, [0 x i8*] }*] }* %_array1763, i32 0, i32 1, i32 1
  store { i64, [0 x i8*] }* %_array1779, { i64, [0 x i8*] }** %_elt1776
  store { i64, [0 x { i64, [0 x i8*] }*] }* %_array1763, { i64, [0 x { i64, [0 x i8*] }*] }** %_strs1761
  %_id1789 = load { i64, [0 x { i64, [0 x i8*] }*] }*, { i64, [0 x { i64, [0 x i8*] }*] }** %_strs1761
  %_ptr1791 = getelementptr { i64, [0 x { i64, [0 x i8*] }*] }, { i64, [0 x { i64, [0 x i8*] }*] }* %_id1789, i32 0, i32 1, i32 1
  %_load1792 = load { i64, [0 x i8*] }*, { i64, [0 x i8*] }** %_ptr1791
  %_ptr1793 = getelementptr { i64, [0 x i8*] }, { i64, [0 x i8*] }* %_load1792, i32 0, i32 1, i32 1
  %_load1794 = load i64, i64* %_ptr1793
  call void @print_string(i8* %_load1794)
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
