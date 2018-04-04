#! /bin/bash
#*************
# 通过修改 IFS 来读取 ， 分隔的字符串
#*************

OLDIFS=$IFS
IFS=','

for string in $1
do
    echo "each==$string"
done
IFS=$OLDIFS
echo "######---exit----#####"
