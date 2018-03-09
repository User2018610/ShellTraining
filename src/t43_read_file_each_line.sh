#! /bin/bash

# 读取文件 | 按行读取

echo "arg count==$#"

cc=0

if [ "$#" -lt 1 ]
then
    echo "you need give me a file path"
    exit 1
fi
srcPath=$1
IFS_OLD=$IFS

IFS=$'\n'
for line in `cat $srcPath`  # 不足之处，会忽略末尾的空行
do
    cc=$[ $cc + 1  ]
    echo "for line:$line      $cc"
done
IFS=$IFS_OLD
echo ">>>>>>>>>>>>>  for   $srcPath has $cc lines   <<<<<<<<<<<<<<<<"

echo "#### 这种方式 获取的行数ok"

cc=0
while read line
do
    cc=$[ $cc + 1  ]
    echo "while line:$line      $cc"
done < $srcPath  # 简直完美，完完全全的按行读取，可以正确统计行数 ！！！todo:good
echo ">>>>>>>>>>>>>  while $srcPath has $cc lines   <<<<<<<<<<<<<<<<"

cc=0
export cc
cat $srcPath | while read line   # fuck todo : 注意，这种方式 必须先 export cc ，否则 cat 里面对 cc 的改变，外面不知道！
do
    cc=$[ $cc + 1  ]
    echo "while line:$line      $cc"
done
echo ">>>>>>>>>>>>> cat file | while $srcPath has $cc lines   <<<<<<<<<<<<<<<<"
