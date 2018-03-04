#! /bin/bash

# 遍历目录
list=""
for var in $*
do
    echo "var=$var"
    if [ -e $var ]
    then
        list=$list"$var""/* "
    else
        echo "$var is not exits"
    fi
done
for f in $list
 do
     if [ -f "$f" ]    # 使用 "$f" 而不是 $f ，是兼容带空格的文件名
     then
         echo "FILE: $f"
     elif [ -d "$f" ]
     then
         echo "DIR:  $f"
     else
         echo "$f 不是文件，也不算目录？"
         file $f
     fi
 done


