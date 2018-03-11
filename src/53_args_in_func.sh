#! /bin/bash

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
