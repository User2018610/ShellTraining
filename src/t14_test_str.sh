#! /bin/bash

# 字符串比较


var="c9at"

if [ $USER = $var  ]
then
    echo "当前用户是 $var"
else
    echo "当前用户不是 $var"
fi

var2="c9AT"

if [ $var \> $var2  ]
then
    echo "$var > $var2"
else
    echo "$var <= $var2"
fi


