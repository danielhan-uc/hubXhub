; generated from: atprograms/conquest.oat
target triple = "x86_64-apple-macosx10.10.0"
@meaning_of_life = global i64 42
@kesha_to_fling = global i1 1
@professor = global [11 x i8] c"Zdancewic!\00"
@global_arr = global { i64, [7 x i64] } { i64 7, [7 x i64] [ i64 1, i64 1, i64 2, i64 3, i64 5, i64 8, i64 13 ] }
@_glob7089 = global i64 1
@_glob7090 = global i64 1
@_glob7091 = global i64 2
@_glob7092 = global i64 3
@_glob7093 = global i64 5
@_glob7094 = global i64 8
@_glob7095 = global i64 13
@null_arr = global { i64, [0 x i64] }* null
@ideal_341_midterm_score = global { i64, [1 x i64] } { i64 1, [1 x i64] [ i64 100 ] }
@_glob7088 = global i64 100
@actual_341_midterm_score = global { i64, [1 x i64] } { i64 1, [1 x i64] [ i64 0 ] }
@_glob7087 = global i64 0
@_str7061 = global [16 x i8] c"Meaning of Life\00"
@_str6579 = global [20 x i8] c"My name is Jeff...
\00"
@_str6641 = global [38 x i8] c"Charizard is the BEST Pokemon ever!!!\00"

define i64 @four() {
  %_hakuna_matata7060 = alloca i8*
  %_what_is_the7063 = alloca i64
  %_what_rhymes_with_moore7066 = alloca i64
  %_str7062 = bitcast [16 x i8]* @_str7061 to i8*
  store i8* %_str7062, i8** %_hakuna_matata7060
  %_id7064 = load i64, i64* @meaning_of_life
  store i64 %_id7064, i64* %_what_is_the7063
  %_id7067 = load i64, i64* @meaning_of_life
  %_bitcast7070 = bitcast { i64, [7 x i64] }* @global_arr to { i64, [0 x i64] }*
  %_ptr7071 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_bitcast7070, i32 0, i32 1, i32 5
  %_load7072 = load i64, i64* %_ptr7071
  %_bitcast7074 = bitcast { i64, [7 x i64] }* @global_arr to { i64, [0 x i64] }*
  %_ptr7075 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_bitcast7074, i32 0, i32 1, i32 4
  %_load7076 = load i64, i64* %_ptr7075
  %_bop7077 = mul i64 %_load7072, %_load7076
  %_bop7078 = sub i64 %_id7067, %_bop7077
  %_bitcast7080 = bitcast { i64, [7 x i64] }* @global_arr to { i64, [0 x i64] }*
  %_ptr7081 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_bitcast7080, i32 0, i32 1, i32 2
  %_load7082 = load i64, i64* %_ptr7081
  %_bop7083 = add i64 %_bop7078, %_load7082
  store i64 %_bop7083, i64* %_what_rhymes_with_moore7066
  %_id7084 = load i64, i64* %_what_rhymes_with_moore7066
  %_bop7086 = add i64 0, %_id7084
  ret i64 %_bop7086
}

define { i64, [0 x i64] }* @asian_brother_of_foo_named_fui(i8* %s, i1 %b, i64 %i) {
  %_i7054 = alloca i64
  %_b7053 = alloca i1
  %_s7052 = alloca i8*
  %_fui7055 = alloca { i64, [0 x i64] }*
  store i64 %i, i64* %_i7054
  store i1 %b, i1* %_b7053
  store i8* %s, i8** %_s7052
  %_bitcast7057 = bitcast { i64, [7 x i64] }* @global_arr to { i64, [0 x i64] }*
  store { i64, [0 x i64] }* %_bitcast7057, { i64, [0 x i64] }** %_fui7055
  %_id7058 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_fui7055
  ret { i64, [0 x i64] }* %_id7058
}

define void @dfs({ i64, [0 x { i64, [0 x i64] }*] }* %arr, { i64, [0 x { i64, [0 x i64] }*] }* %visited, i64 %row, i64 %col, i64 %i, i64 %j) {
  %_j6787 = alloca i64
  %_i6786 = alloca i64
  %_col6785 = alloca i64
  %_row6784 = alloca i64
  %_visited6783 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_arr6782 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  store i64 %j, i64* %_j6787
  store i64 %i, i64* %_i6786
  store i64 %col, i64* %_col6785
  store i64 %row, i64* %_row6784
  store { i64, [0 x { i64, [0 x i64] }*] }* %visited, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6783
  store { i64, [0 x { i64, [0 x i64] }*] }* %arr, { i64, [0 x { i64, [0 x i64] }*] }** %_arr6782
  %_id6792 = load i64, i64* %_i6786
  %_bop6794 = sub i64 %_id6792, 1
  %_bop6795 = icmp sge i64 %_bop6794, 0
  %_test6791 = icmp eq i1 %_bop6795, 0
  br i1 %_test6791, label %_else6789, label %_then6788
_then6788:
  %_id6800 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6783
  %_id6802 = load i64, i64* %_i6786
  %_bop6804 = sub i64 %_id6802, 1
  %_ptr6805 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6800, i32 0, i32 1, i64 %_bop6804
  %_load6806 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr6805
  %_id6807 = load i64, i64* %_j6787
  %_ptr6809 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load6806, i32 0, i32 1, i64 %_id6807
  %_load6810 = load i64, i64* %_ptr6809
  %_bop6811 = icmp ne i64 %_load6810, 1
  %_test6799 = icmp eq i1 %_bop6811, 0
  br i1 %_test6799, label %_else6797, label %_then6796
_then6796:
  %_id6812 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6783
  %_id6814 = load i64, i64* %_i6786
  %_bop6816 = sub i64 %_id6814, 1
  %_ptr6817 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6812, i32 0, i32 1, i64 %_bop6816
  %_load6818 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr6817
  %_id6819 = load i64, i64* %_j6787
  %_gep6822 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load6818, i32 0, i32 1, i64 %_id6819
  store i64 1, i64* %_gep6822
  %_id6827 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr6782
  %_id6829 = load i64, i64* %_i6786
  %_bop6831 = sub i64 %_id6829, 1
  %_ptr6832 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6827, i32 0, i32 1, i64 %_bop6831
  %_load6833 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr6832
  %_id6834 = load i64, i64* %_j6787
  %_ptr6836 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load6833, i32 0, i32 1, i64 %_id6834
  %_load6837 = load i64, i64* %_ptr6836
  %_bop6838 = icmp eq i64 %_load6837, 1
  %_test6826 = icmp eq i1 %_bop6838, 0
  br i1 %_test6826, label %_else6824, label %_then6823
_then6823:
  %_id6840 = load i64, i64* %_j6787
  %_id6842 = load i64, i64* %_i6786
  %_bop6844 = sub i64 %_id6842, 1
  %_id6845 = load i64, i64* %_col6785
  %_id6847 = load i64, i64* %_row6784
  %_id6849 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6783
  %_id6851 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr6782
  call void @dfs(i64 %_id6851, i64 %_id6849, i64 %_id6847, i64 %_id6845, { i64, [0 x { i64, [0 x i64] }*] }* %_bop6844, { i64, [0 x { i64, [0 x i64] }*] }* %_id6840)
  br label %_merge6825
_else6824:
  br label %_merge6825
_merge6825:
  br label %_merge6798
_else6797:
  br label %_merge6798
_merge6798:
  br label %_merge6790
_else6789:
  br label %_merge6790
_merge6790:
  %_id6857 = load i64, i64* %_i6786
  %_bop6859 = add i64 %_id6857, 1
  %_id6860 = load i64, i64* %_row6784
  %_bop6862 = icmp slt i64 %_bop6859, %_id6860
  %_test6856 = icmp eq i1 %_bop6862, 0
  br i1 %_test6856, label %_else6854, label %_then6853
_then6853:
  %_id6867 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6783
  %_id6869 = load i64, i64* %_i6786
  %_bop6871 = add i64 %_id6869, 1
  %_ptr6872 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6867, i32 0, i32 1, i64 %_bop6871
  %_load6873 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr6872
  %_id6874 = load i64, i64* %_j6787
  %_ptr6876 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load6873, i32 0, i32 1, i64 %_id6874
  %_load6877 = load i64, i64* %_ptr6876
  %_bop6878 = icmp ne i64 %_load6877, 1
  %_test6866 = icmp eq i1 %_bop6878, 0
  br i1 %_test6866, label %_else6864, label %_then6863
_then6863:
  %_id6879 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6783
  %_id6881 = load i64, i64* %_i6786
  %_bop6883 = add i64 %_id6881, 1
  %_ptr6884 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6879, i32 0, i32 1, i64 %_bop6883
  %_load6885 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr6884
  %_id6886 = load i64, i64* %_j6787
  %_gep6889 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load6885, i32 0, i32 1, i64 %_id6886
  store i64 1, i64* %_gep6889
  %_id6894 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr6782
  %_id6896 = load i64, i64* %_i6786
  %_bop6898 = add i64 %_id6896, 1
  %_ptr6899 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6894, i32 0, i32 1, i64 %_bop6898
  %_load6900 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr6899
  %_id6901 = load i64, i64* %_j6787
  %_ptr6903 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load6900, i32 0, i32 1, i64 %_id6901
  %_load6904 = load i64, i64* %_ptr6903
  %_bop6905 = icmp eq i64 %_load6904, 1
  %_test6893 = icmp eq i1 %_bop6905, 0
  br i1 %_test6893, label %_else6891, label %_then6890
_then6890:
  %_id6907 = load i64, i64* %_j6787
  %_id6909 = load i64, i64* %_i6786
  %_bop6911 = add i64 %_id6909, 1
  %_id6912 = load i64, i64* %_col6785
  %_id6914 = load i64, i64* %_row6784
  %_id6916 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6783
  %_id6918 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr6782
  call void @dfs(i64 %_id6918, i64 %_id6916, i64 %_id6914, i64 %_id6912, { i64, [0 x { i64, [0 x i64] }*] }* %_bop6911, { i64, [0 x { i64, [0 x i64] }*] }* %_id6907)
  br label %_merge6892
_else6891:
  br label %_merge6892
_merge6892:
  br label %_merge6865
_else6864:
  br label %_merge6865
_merge6865:
  br label %_merge6855
_else6854:
  br label %_merge6855
_merge6855:
  %_id6924 = load i64, i64* %_j6787
  %_bop6926 = sub i64 %_id6924, 1
  %_bop6927 = icmp sge i64 %_bop6926, 0
  %_test6923 = icmp eq i1 %_bop6927, 0
  br i1 %_test6923, label %_else6921, label %_then6920
_then6920:
  %_id6932 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6783
  %_id6934 = load i64, i64* %_i6786
  %_ptr6936 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6932, i32 0, i32 1, i64 %_id6934
  %_load6937 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr6936
  %_id6938 = load i64, i64* %_j6787
  %_bop6940 = sub i64 %_id6938, 1
  %_ptr6941 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load6937, i32 0, i32 1, i64 %_bop6940
  %_load6942 = load i64, i64* %_ptr6941
  %_bop6943 = icmp ne i64 %_load6942, 1
  %_test6931 = icmp eq i1 %_bop6943, 0
  br i1 %_test6931, label %_else6929, label %_then6928
_then6928:
  %_id6944 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6783
  %_id6946 = load i64, i64* %_i6786
  %_ptr6948 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6944, i32 0, i32 1, i64 %_id6946
  %_load6949 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr6948
  %_id6950 = load i64, i64* %_j6787
  %_bop6952 = sub i64 %_id6950, 1
  %_gep6954 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load6949, i32 0, i32 1, i64 %_bop6952
  store i64 1, i64* %_gep6954
  %_id6959 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr6782
  %_id6961 = load i64, i64* %_i6786
  %_ptr6963 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6959, i32 0, i32 1, i64 %_id6961
  %_load6964 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr6963
  %_id6965 = load i64, i64* %_j6787
  %_bop6967 = sub i64 %_id6965, 1
  %_ptr6968 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load6964, i32 0, i32 1, i64 %_bop6967
  %_load6969 = load i64, i64* %_ptr6968
  %_bop6970 = icmp eq i64 %_load6969, 1
  %_test6958 = icmp eq i1 %_bop6970, 0
  br i1 %_test6958, label %_else6956, label %_then6955
_then6955:
  %_id6972 = load i64, i64* %_j6787
  %_bop6974 = sub i64 %_id6972, 1
  %_id6975 = load i64, i64* %_i6786
  %_id6977 = load i64, i64* %_col6785
  %_id6979 = load i64, i64* %_row6784
  %_id6981 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6783
  %_id6983 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr6782
  call void @dfs(i64 %_id6983, i64 %_id6981, i64 %_id6979, i64 %_id6977, { i64, [0 x { i64, [0 x i64] }*] }* %_id6975, { i64, [0 x { i64, [0 x i64] }*] }* %_bop6974)
  br label %_merge6957
_else6956:
  br label %_merge6957
_merge6957:
  br label %_merge6930
_else6929:
  br label %_merge6930
_merge6930:
  br label %_merge6922
_else6921:
  br label %_merge6922
_merge6922:
  %_id6989 = load i64, i64* %_j6787
  %_bop6991 = add i64 %_id6989, 1
  %_id6992 = load i64, i64* %_col6785
  %_bop6994 = icmp slt i64 %_bop6991, %_id6992
  %_test6988 = icmp eq i1 %_bop6994, 0
  br i1 %_test6988, label %_else6986, label %_then6985
_then6985:
  %_id6999 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6783
  %_id7001 = load i64, i64* %_i6786
  %_ptr7003 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6999, i32 0, i32 1, i64 %_id7001
  %_load7004 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr7003
  %_id7005 = load i64, i64* %_j6787
  %_bop7007 = add i64 %_id7005, 1
  %_ptr7008 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load7004, i32 0, i32 1, i64 %_bop7007
  %_load7009 = load i64, i64* %_ptr7008
  %_bop7010 = icmp ne i64 %_load7009, 1
  %_test6998 = icmp eq i1 %_bop7010, 0
  br i1 %_test6998, label %_else6996, label %_then6995
_then6995:
  %_id7011 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6783
  %_id7013 = load i64, i64* %_i6786
  %_ptr7015 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id7011, i32 0, i32 1, i64 %_id7013
  %_load7016 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr7015
  %_id7017 = load i64, i64* %_j6787
  %_bop7019 = add i64 %_id7017, 1
  %_gep7021 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load7016, i32 0, i32 1, i64 %_bop7019
  store i64 1, i64* %_gep7021
  %_id7026 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr6782
  %_id7028 = load i64, i64* %_i6786
  %_ptr7030 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id7026, i32 0, i32 1, i64 %_id7028
  %_load7031 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr7030
  %_id7032 = load i64, i64* %_j6787
  %_bop7034 = add i64 %_id7032, 1
  %_ptr7035 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load7031, i32 0, i32 1, i64 %_bop7034
  %_load7036 = load i64, i64* %_ptr7035
  %_bop7037 = icmp eq i64 %_load7036, 1
  %_test7025 = icmp eq i1 %_bop7037, 0
  br i1 %_test7025, label %_else7023, label %_then7022
_then7022:
  %_id7039 = load i64, i64* %_j6787
  %_bop7041 = add i64 %_id7039, 1
  %_id7042 = load i64, i64* %_i6786
  %_id7044 = load i64, i64* %_col6785
  %_id7046 = load i64, i64* %_row6784
  %_id7048 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6783
  %_id7050 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr6782
  call void @dfs(i64 %_id7050, i64 %_id7048, i64 %_id7046, i64 %_id7044, { i64, [0 x { i64, [0 x i64] }*] }* %_id7042, { i64, [0 x { i64, [0 x i64] }*] }* %_bop7041)
  br label %_merge7024
_else7023:
  br label %_merge7024
_merge7024:
  br label %_merge6997
_else6996:
  br label %_merge6997
_merge6997:
  br label %_merge6987
_else6986:
  br label %_merge6987
_merge6987:
  ret void
}

define i64 @connected({ i64, [0 x { i64, [0 x i64] }*] }* %arr, i64 %row, i64 %col) {
  %_col6668 = alloca i64
  %_row6667 = alloca i64
  %_arr6666 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_visited6669 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i6674 = alloca i64
  %_counter6697 = alloca i64
  %_i6698 = alloca i64
  %_j6711 = alloca i64
  store i64 %col, i64* %_col6668
  store i64 %row, i64* %_row6667
  store { i64, [0 x { i64, [0 x i64] }*] }* %arr, { i64, [0 x { i64, [0 x i64] }*] }** %_arr6666
  %_id6670 = load i64, i64* %_row6667
  %_raw_array6672 = call { i64, [0 x i64] }* @oat_alloc_array(i64 %_id6670)
  %_array6673 = bitcast { i64, [0 x i64] }* %_raw_array6672 to { i64, [0 x { i64, [0 x i64] }*] }*
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array6673, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6669
  store i64 0, i64* %_i6674
  br label %_pre6678
_pre6678:
  %_id6682 = load i64, i64* %_i6674
  %_id6684 = load i64, i64* %_row6667
  %_bop6686 = icmp slt i64 %_id6682, %_id6684
  %_test6675 = icmp eq i1 %_bop6686, 0
  br i1 %_test6675, label %_post6676, label %_body6677
_body6677:
  %_id6687 = load i64, i64* %_col6668
  %_raw_array6689 = call { i64, [0 x i64] }* @oat_alloc_array(i64 %_id6687)
  %_array6690 = bitcast { i64, [0 x i64] }* %_raw_array6689 to { i64, [0 x i64] }*
  %_id6691 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6669
  %_id6693 = load i64, i64* %_i6674
  %_gep6696 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6691, i32 0, i32 1, i64 %_id6693
  store { i64, [0 x i64] }* %_array6690, { i64, [0 x i64] }** %_gep6696
  %_id6679 = load i64, i64* %_i6674
  %_bop6681 = add i64 %_id6679, 1
  store i64 %_bop6681, i64* %_i6674
  br label %_pre6678
_post6676:
  store i64 0, i64* %_counter6697
  store i64 0, i64* %_i6698
  br label %_pre6702
_pre6702:
  %_id6706 = load i64, i64* %_i6698
  %_id6708 = load i64, i64* %_row6667
  %_bop6710 = icmp slt i64 %_id6706, %_id6708
  %_test6699 = icmp eq i1 %_bop6710, 0
  br i1 %_test6699, label %_post6700, label %_body6701
_body6701:
  store i64 0, i64* %_j6711
  br label %_pre6715
_pre6715:
  %_id6716 = load i64, i64* %_j6711
  %_id6718 = load i64, i64* %_col6668
  %_bop6720 = icmp slt i64 %_id6716, %_id6718
  %_test6712 = icmp eq i1 %_bop6720, 0
  br i1 %_test6712, label %_post6713, label %_body6714
_body6714:
  %_id6725 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6669
  %_id6727 = load i64, i64* %_i6698
  %_ptr6729 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6725, i32 0, i32 1, i64 %_id6727
  %_load6730 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr6729
  %_id6731 = load i64, i64* %_j6711
  %_ptr6733 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load6730, i32 0, i32 1, i64 %_id6731
  %_load6734 = load i64, i64* %_ptr6733
  %_bop6735 = icmp eq i64 %_load6734, 0
  %_test6724 = icmp eq i1 %_bop6735, 0
  br i1 %_test6724, label %_else6722, label %_then6721
_then6721:
  %_id6736 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6669
  %_id6738 = load i64, i64* %_i6698
  %_ptr6740 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6736, i32 0, i32 1, i64 %_id6738
  %_load6741 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr6740
  %_id6742 = load i64, i64* %_j6711
  %_gep6745 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load6741, i32 0, i32 1, i64 %_id6742
  store i64 1, i64* %_gep6745
  %_id6750 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr6666
  %_id6752 = load i64, i64* %_i6698
  %_ptr6754 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6750, i32 0, i32 1, i64 %_id6752
  %_load6755 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr6754
  %_id6756 = load i64, i64* %_j6711
  %_ptr6758 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load6755, i32 0, i32 1, i64 %_id6756
  %_load6759 = load i64, i64* %_ptr6758
  %_bop6760 = icmp eq i64 %_load6759, 1
  %_test6749 = icmp eq i1 %_bop6760, 0
  br i1 %_test6749, label %_else6747, label %_then6746
_then6746:
  %_id6761 = load i64, i64* %_counter6697
  %_bop6763 = add i64 %_id6761, 1
  store i64 %_bop6763, i64* %_counter6697
  %_id6765 = load i64, i64* %_j6711
  %_id6767 = load i64, i64* %_i6698
  %_id6769 = load i64, i64* %_col6668
  %_id6771 = load i64, i64* %_row6667
  %_id6773 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_visited6669
  %_id6775 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_arr6666
  call void @dfs(i64 %_id6775, i64 %_id6773, i64 %_id6771, i64 %_id6769, { i64, [0 x { i64, [0 x i64] }*] }* %_id6767, { i64, [0 x { i64, [0 x i64] }*] }* %_id6765)
  br label %_merge6748
_else6747:
  br label %_merge6748
_merge6748:
  br label %_merge6723
_else6722:
  br label %_merge6723
_merge6723:
  %_id6777 = load i64, i64* %_j6711
  %_bop6779 = add i64 %_id6777, 1
  store i64 %_bop6779, i64* %_j6711
  br label %_pre6715
_post6713:
  %_id6703 = load i64, i64* %_i6698
  %_bop6705 = add i64 %_id6703, 1
  store i64 %_bop6705, i64* %_i6698
  br label %_pre6702
_post6700:
  %_id6780 = load i64, i64* %_counter6697
  ret i64 %_id6780
}

define i64 @program(i64 %argc, { i64, [0 x i8*] }* %argv) {
  %_argv6282 = alloca { i64, [0 x i8*] }*
  %_argc6281 = alloca i64
  %_territory_a6283 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_territory_b6334 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_territory_c6379 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_none_conquered6412 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i6416 = alloca i64
  %_j6436 = alloca i64
  %_all_conquered6461 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i26464 = alloca i64
  %_i216483 = alloca i64
  %_island6508 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_emptyland6515 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_i36518 = alloca i64
  %_i316537 = alloca i64
  %_temp6571 = alloca { i64, [0 x { i64, [0 x i64] }*] }*
  %_a6581 = alloca i64
  %_b6585 = alloca i64
  %_c6589 = alloca i64
  %_none6593 = alloca i64
  %_all6597 = alloca i64
  %_i6601 = alloca i64
  %_e6605 = alloca i64
  %_sum6643 = alloca i64
  store { i64, [0 x i8*] }* %argv, { i64, [0 x i8*] }** %_argv6282
  store i64 %argc, i64* %_argc6281
  %_raw_array6284 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array6285 = bitcast { i64, [0 x i64] }* %_raw_array6284 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array6288 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array6289 = bitcast { i64, [0 x i64] }* %_raw_array6288 to { i64, [0 x i64] }*
  %_elt6290 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6289, i32 0, i32 1, i32 0
  store i64 1, i64* %_elt6290
  %_elt6292 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6289, i32 0, i32 1, i32 1
  store i64 0, i64* %_elt6292
  %_elt6294 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6289, i32 0, i32 1, i32 2
  store i64 1, i64* %_elt6294
  %_elt6296 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6289, i32 0, i32 1, i32 3
  store i64 0, i64* %_elt6296
  %_elt6286 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array6285, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array6289, { i64, [0 x i64] }** %_elt6286
  %_raw_array6300 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array6301 = bitcast { i64, [0 x i64] }* %_raw_array6300 to { i64, [0 x i64] }*
  %_elt6302 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6301, i32 0, i32 1, i32 0
  store i64 1, i64* %_elt6302
  %_elt6304 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6301, i32 0, i32 1, i32 1
  store i64 1, i64* %_elt6304
  %_elt6306 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6301, i32 0, i32 1, i32 2
  store i64 0, i64* %_elt6306
  %_elt6308 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6301, i32 0, i32 1, i32 3
  store i64 1, i64* %_elt6308
  %_elt6298 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array6285, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array6301, { i64, [0 x i64] }** %_elt6298
  %_raw_array6312 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array6313 = bitcast { i64, [0 x i64] }* %_raw_array6312 to { i64, [0 x i64] }*
  %_elt6314 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6313, i32 0, i32 1, i32 0
  store i64 1, i64* %_elt6314
  %_elt6316 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6313, i32 0, i32 1, i32 1
  store i64 0, i64* %_elt6316
  %_elt6318 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6313, i32 0, i32 1, i32 2
  store i64 1, i64* %_elt6318
  %_elt6320 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6313, i32 0, i32 1, i32 3
  store i64 1, i64* %_elt6320
  %_elt6310 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array6285, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array6313, { i64, [0 x i64] }** %_elt6310
  %_raw_array6324 = call { i64, [0 x i64] }* @oat_alloc_array(i64 4)
  %_array6325 = bitcast { i64, [0 x i64] }* %_raw_array6324 to { i64, [0 x i64] }*
  %_elt6326 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6325, i32 0, i32 1, i32 0
  store i64 0, i64* %_elt6326
  %_elt6328 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6325, i32 0, i32 1, i32 1
  store i64 1, i64* %_elt6328
  %_elt6330 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6325, i32 0, i32 1, i32 2
  store i64 1, i64* %_elt6330
  %_elt6332 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6325, i32 0, i32 1, i32 3
  store i64 0, i64* %_elt6332
  %_elt6322 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array6285, i32 0, i32 1, i32 3
  store { i64, [0 x i64] }* %_array6325, { i64, [0 x i64] }** %_elt6322
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array6285, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_a6283
  %_raw_array6335 = call { i64, [0 x i64] }* @oat_alloc_array(i64 3)
  %_array6336 = bitcast { i64, [0 x i64] }* %_raw_array6335 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array6339 = call { i64, [0 x i64] }* @oat_alloc_array(i64 5)
  %_array6340 = bitcast { i64, [0 x i64] }* %_raw_array6339 to { i64, [0 x i64] }*
  %_elt6341 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6340, i32 0, i32 1, i32 0
  store i64 0, i64* %_elt6341
  %_elt6343 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6340, i32 0, i32 1, i32 1
  store i64 0, i64* %_elt6343
  %_elt6345 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6340, i32 0, i32 1, i32 2
  store i64 1, i64* %_elt6345
  %_elt6347 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6340, i32 0, i32 1, i32 3
  store i64 0, i64* %_elt6347
  %_elt6349 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6340, i32 0, i32 1, i32 4
  store i64 1, i64* %_elt6349
  %_elt6337 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array6336, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array6340, { i64, [0 x i64] }** %_elt6337
  %_raw_array6353 = call { i64, [0 x i64] }* @oat_alloc_array(i64 5)
  %_array6354 = bitcast { i64, [0 x i64] }* %_raw_array6353 to { i64, [0 x i64] }*
  %_elt6355 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6354, i32 0, i32 1, i32 0
  store i64 0, i64* %_elt6355
  %_elt6357 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6354, i32 0, i32 1, i32 1
  store i64 1, i64* %_elt6357
  %_elt6359 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6354, i32 0, i32 1, i32 2
  store i64 1, i64* %_elt6359
  %_elt6361 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6354, i32 0, i32 1, i32 3
  store i64 0, i64* %_elt6361
  %_elt6363 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6354, i32 0, i32 1, i32 4
  store i64 1, i64* %_elt6363
  %_elt6351 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array6336, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array6354, { i64, [0 x i64] }** %_elt6351
  %_raw_array6367 = call { i64, [0 x i64] }* @oat_alloc_array(i64 5)
  %_array6368 = bitcast { i64, [0 x i64] }* %_raw_array6367 to { i64, [0 x i64] }*
  %_elt6369 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6368, i32 0, i32 1, i32 0
  store i64 1, i64* %_elt6369
  %_elt6371 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6368, i32 0, i32 1, i32 1
  store i64 1, i64* %_elt6371
  %_elt6373 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6368, i32 0, i32 1, i32 2
  store i64 1, i64* %_elt6373
  %_elt6375 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6368, i32 0, i32 1, i32 3
  store i64 1, i64* %_elt6375
  %_elt6377 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6368, i32 0, i32 1, i32 4
  store i64 1, i64* %_elt6377
  %_elt6365 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array6336, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array6368, { i64, [0 x i64] }** %_elt6365
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array6336, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_b6334
  %_raw_array6380 = call { i64, [0 x i64] }* @oat_alloc_array(i64 3)
  %_array6381 = bitcast { i64, [0 x i64] }* %_raw_array6380 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array6384 = call { i64, [0 x i64] }* @oat_alloc_array(i64 3)
  %_array6385 = bitcast { i64, [0 x i64] }* %_raw_array6384 to { i64, [0 x i64] }*
  %_elt6386 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6385, i32 0, i32 1, i32 0
  store i64 1, i64* %_elt6386
  %_elt6388 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6385, i32 0, i32 1, i32 1
  store i64 0, i64* %_elt6388
  %_elt6390 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6385, i32 0, i32 1, i32 2
  store i64 1, i64* %_elt6390
  %_elt6382 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array6381, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array6385, { i64, [0 x i64] }** %_elt6382
  %_raw_array6394 = call { i64, [0 x i64] }* @oat_alloc_array(i64 3)
  %_array6395 = bitcast { i64, [0 x i64] }* %_raw_array6394 to { i64, [0 x i64] }*
  %_elt6396 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6395, i32 0, i32 1, i32 0
  store i64 0, i64* %_elt6396
  %_elt6398 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6395, i32 0, i32 1, i32 1
  store i64 1, i64* %_elt6398
  %_elt6400 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6395, i32 0, i32 1, i32 2
  store i64 0, i64* %_elt6400
  %_elt6392 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array6381, i32 0, i32 1, i32 1
  store { i64, [0 x i64] }* %_array6395, { i64, [0 x i64] }** %_elt6392
  %_raw_array6404 = call { i64, [0 x i64] }* @oat_alloc_array(i64 3)
  %_array6405 = bitcast { i64, [0 x i64] }* %_raw_array6404 to { i64, [0 x i64] }*
  %_elt6406 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6405, i32 0, i32 1, i32 0
  store i64 1, i64* %_elt6406
  %_elt6408 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6405, i32 0, i32 1, i32 1
  store i64 0, i64* %_elt6408
  %_elt6410 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_array6405, i32 0, i32 1, i32 2
  store i64 1, i64* %_elt6410
  %_elt6402 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array6381, i32 0, i32 1, i32 2
  store { i64, [0 x i64] }* %_array6405, { i64, [0 x i64] }** %_elt6402
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array6381, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_c6379
  %_fun6413 = call i64 @four()
  %_raw_array6414 = call { i64, [0 x i64] }* @oat_alloc_array(i64 %_fun6413)
  %_array6415 = bitcast { i64, [0 x i64] }* %_raw_array6414 to { i64, [0 x { i64, [0 x i64] }*] }*
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array6415, { i64, [0 x { i64, [0 x i64] }*] }** %_none_conquered6412
  store i64 0, i64* %_i6416
  br label %_pre6420
_pre6420:
  %_id6424 = load i64, i64* %_i6416
  %_fun6426 = call i64 @four()
  %_bop6427 = icmp slt i64 %_id6424, %_fun6426
  %_test6417 = icmp eq i1 %_bop6427, 0
  br i1 %_test6417, label %_post6418, label %_body6419
_body6419:
  %_raw_array6428 = call { i64, [0 x i64] }* @oat_alloc_array(i64 2)
  %_array6429 = bitcast { i64, [0 x i64] }* %_raw_array6428 to { i64, [0 x i64] }*
  %_id6430 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_none_conquered6412
  %_id6432 = load i64, i64* %_i6416
  %_gep6435 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6430, i32 0, i32 1, i64 %_id6432
  store { i64, [0 x i64] }* %_array6429, { i64, [0 x i64] }** %_gep6435
  store i64 0, i64* %_j6436
  br label %_pre6440
_pre6440:
  %_id6444 = load i64, i64* %_j6436
  %_bop6446 = icmp slt i64 %_id6444, 2
  %_test6437 = icmp eq i1 %_bop6446, 0
  br i1 %_test6437, label %_post6438, label %_body6439
_body6439:
  %_bitcast6448 = bitcast { i64, [1 x i64] }* @actual_341_midterm_score to { i64, [0 x i64] }*
  %_ptr6449 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_bitcast6448, i32 0, i32 1, i32 0
  %_load6450 = load i64, i64* %_ptr6449
  %_id6451 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_none_conquered6412
  %_id6453 = load i64, i64* %_i6416
  %_ptr6455 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6451, i32 0, i32 1, i64 %_id6453
  %_load6456 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr6455
  %_id6457 = load i64, i64* %_j6436
  %_gep6460 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load6456, i32 0, i32 1, i64 %_id6457
  store i64 %_load6450, i64* %_gep6460
  %_id6441 = load i64, i64* %_j6436
  %_bop6443 = add i64 %_id6441, 1
  store i64 %_bop6443, i64* %_j6436
  br label %_pre6440
_post6438:
  %_id6421 = load i64, i64* %_i6416
  %_bop6423 = add i64 %_id6421, 1
  store i64 %_bop6423, i64* %_i6416
  br label %_pre6420
_post6418:
  %_raw_array6462 = call { i64, [0 x i64] }* @oat_alloc_array(i64 6)
  %_array6463 = bitcast { i64, [0 x i64] }* %_raw_array6462 to { i64, [0 x { i64, [0 x i64] }*] }*
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array6463, { i64, [0 x { i64, [0 x i64] }*] }** %_all_conquered6461
  store i64 0, i64* %_i26464
  br label %_pre6468
_pre6468:
  %_id6472 = load i64, i64* %_i26464
  %_bop6474 = icmp slt i64 %_id6472, 6
  %_test6465 = icmp eq i1 %_bop6474, 0
  br i1 %_test6465, label %_post6466, label %_body6467
_body6467:
  %_raw_array6475 = call { i64, [0 x i64] }* @oat_alloc_array(i64 6)
  %_array6476 = bitcast { i64, [0 x i64] }* %_raw_array6475 to { i64, [0 x i64] }*
  %_id6477 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_all_conquered6461
  %_id6479 = load i64, i64* %_i26464
  %_gep6482 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6477, i32 0, i32 1, i64 %_id6479
  store { i64, [0 x i64] }* %_array6476, { i64, [0 x i64] }** %_gep6482
  store i64 0, i64* %_i216483
  br label %_pre6487
_pre6487:
  %_id6491 = load i64, i64* %_i216483
  %_bop6493 = icmp slt i64 %_id6491, 6
  %_test6484 = icmp eq i1 %_bop6493, 0
  br i1 %_test6484, label %_post6485, label %_body6486
_body6486:
  %_id6494 = load i64, i64* %_i26464
  %_bop6496 = mul i64 %_id6494, 0
  %_bop6497 = add i64 %_bop6496, 1
  %_id6498 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_all_conquered6461
  %_id6500 = load i64, i64* %_i26464
  %_ptr6502 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6498, i32 0, i32 1, i64 %_id6500
  %_load6503 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr6502
  %_id6504 = load i64, i64* %_i216483
  %_gep6507 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load6503, i32 0, i32 1, i64 %_id6504
  store i64 %_bop6497, i64* %_gep6507
  %_id6488 = load i64, i64* %_i216483
  %_bop6490 = add i64 %_id6488, 1
  store i64 %_bop6490, i64* %_i216483
  br label %_pre6487
_post6485:
  %_id6469 = load i64, i64* %_i26464
  %_bop6471 = add i64 %_id6469, 1
  store i64 %_bop6471, i64* %_i26464
  br label %_pre6468
_post6466:
  %_raw_array6509 = call { i64, [0 x i64] }* @oat_alloc_array(i64 1)
  %_array6510 = bitcast { i64, [0 x i64] }* %_raw_array6509 to { i64, [0 x { i64, [0 x i64] }*] }*
  %_raw_array6513 = call { i64, [0 x i64] }* @oat_alloc_array(i64 0)
  %_array6514 = bitcast { i64, [0 x i64] }* %_raw_array6513 to { i64, [0 x i64] }*
  %_elt6511 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_array6510, i32 0, i32 1, i32 0
  store { i64, [0 x i64] }* %_array6514, { i64, [0 x i64] }** %_elt6511
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array6510, { i64, [0 x { i64, [0 x i64] }*] }** %_island6508
  %_raw_array6516 = call { i64, [0 x i64] }* @oat_alloc_array(i64 1)
  %_array6517 = bitcast { i64, [0 x i64] }* %_raw_array6516 to { i64, [0 x { i64, [0 x i64] }*] }*
  store { i64, [0 x { i64, [0 x i64] }*] }* %_array6517, { i64, [0 x { i64, [0 x i64] }*] }** %_emptyland6515
  store i64 0, i64* %_i36518
  br label %_pre6522
_pre6522:
  %_id6526 = load i64, i64* %_i36518
  %_bop6528 = icmp slt i64 %_id6526, 1
  %_test6519 = icmp eq i1 %_bop6528, 0
  br i1 %_test6519, label %_post6520, label %_body6521
_body6521:
  %_raw_array6529 = call { i64, [0 x i64] }* @oat_alloc_array(i64 1)
  %_array6530 = bitcast { i64, [0 x i64] }* %_raw_array6529 to { i64, [0 x i64] }*
  %_id6531 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_emptyland6515
  %_id6533 = load i64, i64* %_i36518
  %_gep6536 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6531, i32 0, i32 1, i64 %_id6533
  store { i64, [0 x i64] }* %_array6530, { i64, [0 x i64] }** %_gep6536
  store i64 0, i64* %_i316537
  br label %_pre6541
_pre6541:
  %_id6545 = load i64, i64* %_i316537
  %_bop6547 = icmp slt i64 %_id6545, 1
  %_test6538 = icmp eq i1 %_bop6547, 0
  br i1 %_test6538, label %_post6539, label %_body6540
_body6540:
  %_bitcast6550 = bitcast { i64, [1 x i64] }* @ideal_341_midterm_score to { i64, [0 x i64] }*
  %_ptr6551 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_bitcast6550, i32 0, i32 1, i32 0
  %_load6552 = load i64, i64* %_ptr6551
  %_id6553 = load i1, i1* @kesha_to_fling
  %_bitcast6556 = bitcast [11 x i8]* @professor to i8*
  %_fun6548 = call { i64, [0 x i64] }* @asian_brother_of_foo_named_fui(i64 %_bitcast6556, i1 %_id6553, i8* %_load6552)
  %_ptr6557 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_fun6548, i32 0, i32 1, i32 1
  %_load6558 = load i64, i64* %_ptr6557
  %_id6559 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_emptyland6515
  %_id6561 = load i64, i64* %_i36518
  %_ptr6563 = getelementptr { i64, [0 x { i64, [0 x i64] }*] }, { i64, [0 x { i64, [0 x i64] }*] }* %_id6559, i32 0, i32 1, i64 %_id6561
  %_load6564 = load { i64, [0 x i64] }*, { i64, [0 x i64] }** %_ptr6563
  %_id6565 = load i64, i64* %_i316537
  %_gep6568 = getelementptr { i64, [0 x i64] }, { i64, [0 x i64] }* %_load6564, i32 0, i32 1, i64 %_id6565
  store i64 %_load6558, i64* %_gep6568
  %_id6542 = load i64, i64* %_i316537
  %_bop6544 = add i64 %_id6542, 1
  store i64 %_bop6544, i64* %_i316537
  br label %_pre6541
_post6539:
  %_id6523 = load i64, i64* %_i36518
  %_bop6525 = add i64 %_id6523, 1
  store i64 %_bop6525, i64* %_i36518
  br label %_pre6522
_post6520:
  %_id6569 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_all_conquered6461
  store { i64, [0 x { i64, [0 x i64] }*] }* %_id6569, { i64, [0 x { i64, [0 x i64] }*] }** %_all_conquered6461
  %_id6572 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_island6508
  store { i64, [0 x { i64, [0 x i64] }*] }* %_id6572, { i64, [0 x { i64, [0 x i64] }*] }** %_temp6571
  %_id6574 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_emptyland6515
  store { i64, [0 x { i64, [0 x i64] }*] }* %_id6574, { i64, [0 x { i64, [0 x i64] }*] }** %_island6508
  %_id6576 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_temp6571
  store { i64, [0 x { i64, [0 x i64] }*] }* %_id6576, { i64, [0 x { i64, [0 x i64] }*] }** %_emptyland6515
  %_str6580 = bitcast [20 x i8]* @_str6579 to i8*
  call void @print_string(i8* %_str6580)
  %_id6583 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_a6283
  %_fun6582 = call i64 @connected(i64 %_id6583, i64 4, { i64, [0 x { i64, [0 x i64] }*] }* 4)
  store i64 %_fun6582, i64* %_a6581
  %_id6587 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_b6334
  %_fun6586 = call i64 @connected(i64 %_id6587, i64 3, { i64, [0 x { i64, [0 x i64] }*] }* 5)
  store i64 %_fun6586, i64* %_b6585
  %_id6591 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_territory_c6379
  %_fun6590 = call i64 @connected(i64 %_id6591, i64 3, { i64, [0 x { i64, [0 x i64] }*] }* 3)
  store i64 %_fun6590, i64* %_c6589
  %_id6595 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_none_conquered6412
  %_fun6594 = call i64 @connected(i64 %_id6595, i64 4, { i64, [0 x { i64, [0 x i64] }*] }* 2)
  store i64 %_fun6594, i64* %_none6593
  %_id6599 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_all_conquered6461
  %_fun6598 = call i64 @connected(i64 %_id6599, i64 6, { i64, [0 x { i64, [0 x i64] }*] }* 6)
  store i64 %_fun6598, i64* %_all6597
  %_id6603 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_island6508
  %_fun6602 = call i64 @connected(i64 %_id6603, i64 1, { i64, [0 x { i64, [0 x i64] }*] }* 1)
  store i64 %_fun6602, i64* %_i6601
  %_id6607 = load { i64, [0 x { i64, [0 x i64] }*] }*, { i64, [0 x { i64, [0 x i64] }*] }** %_emptyland6515
  %_fun6606 = call i64 @connected(i64 %_id6607, i64 0, { i64, [0 x { i64, [0 x i64] }*] }* 0)
  store i64 %_fun6606, i64* %_e6605
  %_id6613 = load i64, i64* %_a6581
  %_bop6615 = icmp eq i64 %_id6613, 3
  %_id6616 = load i64, i64* %_b6585
  %_bop6618 = icmp eq i64 %_id6616, 1
  %_bop6619 = and i1 %_bop6615, %_bop6618
  %_id6620 = load i64, i64* %_c6589
  %_bop6622 = icmp eq i64 %_id6620, 5
  %_bop6623 = and i1 %_bop6619, %_bop6622
  %_id6624 = load i64, i64* %_none6593
  %_bop6626 = icmp eq i64 %_id6624, 0
  %_bop6627 = and i1 %_bop6623, %_bop6626
  %_id6628 = load i64, i64* %_all6597
  %_bop6630 = icmp eq i64 %_id6628, 1
  %_bop6631 = and i1 %_bop6627, %_bop6630
  %_id6632 = load i64, i64* %_i6601
  %_bop6634 = icmp eq i64 %_id6632, 1
  %_bop6635 = and i1 %_bop6631, %_bop6634
  %_id6636 = load i64, i64* %_e6605
  %_bop6638 = icmp eq i64 %_id6636, 0
  %_bop6639 = and i1 %_bop6635, %_bop6638
  %_test6612 = icmp eq i1 %_bop6639, 0
  br i1 %_test6612, label %_else6610, label %_then6609
_then6609:
  %_str6642 = bitcast [38 x i8]* @_str6641 to i8*
  call void @print_string(i8* %_str6642)
  br label %_merge6611
_else6610:
  br label %_merge6611
_merge6611:
  %_id6644 = load i64, i64* %_a6581
  %_id6646 = load i64, i64* %_b6585
  %_bop6648 = add i64 %_id6644, %_id6646
  %_id6649 = load i64, i64* %_c6589
  %_bop6651 = add i64 %_bop6648, %_id6649
  %_id6652 = load i64, i64* %_none6593
  %_bop6654 = add i64 %_bop6651, %_id6652
  %_id6655 = load i64, i64* %_all6597
  %_bop6657 = add i64 %_bop6654, %_id6655
  %_id6658 = load i64, i64* %_i6601
  %_bop6660 = add i64 %_bop6657, %_id6658
  %_id6661 = load i64, i64* %_e6605
  %_bop6663 = add i64 %_bop6660, %_id6661
  store i64 %_bop6663, i64* %_sum6643
  %_id6664 = load i64, i64* %_sum6643
  ret i64 %_id6664
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
