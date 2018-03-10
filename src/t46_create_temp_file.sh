#! /bin/bash

# 创建临时文件  --> 输出路径，并删除该文件~
echo "当前目录是："$(pwd)
path=$(mktemp -t pycat.XXXXX)

echo "创建的临时文件的路径是:"$path

if rm -f $path
then
    echo "删除 $path 成功"
else
    echo "删除 $path 失败"
fi


