#! /bin/bash

# 字符串比较


var="c9at"

if [ $USER = $var  ]
then
    echo "当前用户是 $var"
else
    echo "当前用户不是 $var"
fi

