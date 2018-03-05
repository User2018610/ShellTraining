#! /bin/bash

# 通过for 循环重定向输出到管道或者文件

for (( a=10; a>0; a-- ))
do
    echo "a=$a"
done | sort > log.log

