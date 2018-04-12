#! /bin/bash
#******************
# 按行读取，每行又按, 分隔
#******************

if [ "$#" -lt 1 ]
then
    echo "至少需要一个参数，一个文本文件的路径"
    exit 1
fi
OLDIFS=$IFS

# 按行读取
IFS='\n'

while read line
do
    #echo $line
    IFS=','
    for item in $line
    do
        echo -n "$item" " "
    done
    echo ""
done < $1
