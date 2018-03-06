#! /bin/bash

# 使用 $# 判断参数个数，使用 $0 输出文件全路径名
if [ "$#" -ne 2 ]
then
    echo "usage: bash $0 a b"
    echo "$(basename $0)"
    exit 1
else
    echo $[ $1+$2 ]
    exit 0
fi

