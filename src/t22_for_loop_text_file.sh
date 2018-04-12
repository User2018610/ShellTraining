#! /bin/bash

for state in $(cat $1)
 # 需要注意的是，这种方式并不是按行读取，遇到空格就next了
do
    echo "state=$state"
done


echo "#######---我是分割线---------######"

#通过修改 IFS 来改变默认分隔符

IFSOLD=$IFS
IFS=$'\n'

for line in $(cat $1)
 # 现在就是按行读取了
do
    echo "$line"
done
IFS=$IFSOLD  # 还原默认的 IFS 的值
