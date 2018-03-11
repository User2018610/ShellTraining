#! /bin/bash

# 函数参数与脚本的参数并不是一回事
# 不能在函数中直接使用脚本参数

if [ $# -lt 2  ]
then
    echo "at least, i need two arguments"
    exit 3
fi
function add {
    echo "$[ $1 + $2 ]"
}

echo "the result of function add is: $(add)" # 这样会报错

#echo "the result of function add is: $(add $1 $2)" # 这样就正常了
