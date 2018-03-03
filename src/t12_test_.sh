#! /bin/bash

# test condition 或者 [ condition ] 在 if 中等价


if test $2
then
    echo "has arg2 and arg2==$2"
elif [ $1 ]
then
    echo "has arg1 and arg1==$1"
else
    echo "no arg1 and agr2"
fi

# 注意看 if 后面使用的是 test , elif 后面使用的是 [   ]
