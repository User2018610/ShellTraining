#! /bin/bash

# 使用test 命令进行数值的比较 （作用于变量或者数字）

var1=1333
var2=99

if test $var1 -lt 255
then
    echo "$var1 < 255"
elif [ $var2 -ge 999  ]
then
    echo "$var2 >= 999"
else
    echo "$var1 + $var2 ----"
fi

