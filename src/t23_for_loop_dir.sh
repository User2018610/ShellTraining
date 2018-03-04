#! /bin/bash

# 遍历目录

path="$1"   # 加双引号是避免 文件名中包含空格导致的错误
echo $path
if [ -e $path ]
then
    #echo "path===$path"
    path=$path"/*"    # 注意，这一步必不可少，否则就不遍历目录内容了
    #echo "=====$path"
    for f in $path
    do
        if [ -f $f ]
        then
            echo "$f is a file"
        elif [ -d $f ]
        then
            echo "$f is a dir"
        else
            echo "$f 不是文件，也不算目录？"
            file $f
        fi
    done
else
    echo "$path not exists"
fi


