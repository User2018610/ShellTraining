#! /bin/bash

# 假装上一个 sh 文件是一个库函数文件，然后这边是去使用库函数

# 1. 加载库函数文件
source /home/chengguibao/codes/configs/ShellTraing/src/t56_lib_functions.sh

# 2. 使用库函数
echo $(add 12 13)  # 调用库函数的 add

print99
