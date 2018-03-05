#! /bin/bash

# 读取 /etc/passwd 的每行数据

IFS_OLD=$IFS

text=$( cat /etc/passwd )

#echo $text
IFS=$'\n'
for line in $text
do
    IFS=$':'
    for item in $line
    do
        echo -e $item
    done
    echo
    break
    #echo $line
done
IFS=$IFS_OLD
