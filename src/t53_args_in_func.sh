#! /bin/bash

# 向函数传递参数
function adding {
    if [ "$#" -eq 1 ]
    then
        echo "$[ $1 + $1  ]"
    elif [ "$#" -eq 2 ]
    then
        echo "$[ $1 + $2 ]"
    else
        echo -1
    fi
}

sum=$(adding 12 9) # 这个函数调用复合预期
echo "sum of 12 and 9 is :$sum"
function play {
    echo "$0"
}

func_name=$(play)

echo "func_name is $func_name" # 实际获取的是文件名，不是函数名
# 在Ubuntu 下面也是如此，并没有输出函数名

function hi {
    echo "$@"
}

echo "显示函数hi 的返回值：$(hi a b c de 1024 x)"
# 通过对函数中 $@ 的输出可以看到，并没有 $0 对应的值
