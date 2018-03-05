#! /bin/bash

# 嵌套for循环
echo "使用嵌套for循环 打印99乘法表"
for (( a = 1;a < 10; a++ ))
do
    for ((b=1; b<10; b++))
    do
        if (( b < a  ))
        then
            # echo的参数中, -e表示开启转义, /c表示不换行,脚本如下:
            echo -e "$a*$b=$[ $a * $b ]\t\c"
        elif [ $a -eq $b ]
        then
            echo "$a*$b=$[ $a*$b ]"
        fi
    done
done

