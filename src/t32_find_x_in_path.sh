#! /bin/bash

# for loop 小案例：查找$PATH 变量中的目录下面的所有的可执行文件

IFS_OLD=$IFS
IFS=$':'
for path in $PATH
do
    echo "path=$path"
    if [ -d "$path" ]
    then
        path=$path"/*"
        for item in $path
        do
            if [ -x "$item" ]
            then
                echo "-x $item"
            fi
        done
    fi
    echo "---------------------"
done

# 最后，记得重置 IFS 的值
IFS=$IFS_OLD
