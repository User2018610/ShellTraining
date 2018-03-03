#! /bin/bash

# test 命令在 if then 语句中的使用

var=123

if test $var
then
    echo "var has a value"
else
    echo "var has not assiment"
fi

if test $1
then
    echo "arg1 == $1"
else
    echo "has no arg1"
fi
