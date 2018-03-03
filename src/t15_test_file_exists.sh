#! /bin/bash
# 检查文件

path="/home"
if [ -e $path  ]
then
    echo "$path exists"
    if [ -d $path ]
    then
        echo "$path is a dir"
        if [ -r $path ]
        then
            echo "$path can be read"
            if [ -w $path ]
            then
                echo "$path can be write"
            else
                echo "$path can not be write"
            fi
        else
            echo "$path can not read"
        fi
    else
        echo "$path is not a dir"
    fi
else
    echo "$path not exists"
fi
