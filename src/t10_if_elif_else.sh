#! /bin/bash

# 使用if elif else 的嵌套条件语句



num=$1  # 获取命令行参数1

echo $num
if [ $num -eq 5 ]
then
    echo "\$1==5"
elif [ $num -gt 5 ]
then
    echo "\$1>5"
else
    echo "\$1<5"
fi

echo 'exit...'
