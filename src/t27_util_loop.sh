#! /bin/bash

var=5
until [ $var -le 0 ]
do
    echo "var=$var"
    var=$[ $var-1 ]
done

echo "###---我是分割线---###"
var=6
# 如同 while 的多条件判断，只是最后一个条件有效
until cd /sdwdwd/aaq/dd >& /dev/null
    [ $var -le 0 ]
do
    echo "var=$var"
    var=$[ $var-1 ]
done
