#!/usr/bin/env bash

# 判断输入参数，使用 case .. in ... ;; ...;; 
if [ $# -eq 0 ]
    then  var=abc
    else
        var=$1
fi

case $var in
'abc') echo 'abc...';;
'bcd') echo 'bcd...';;
esac
exit 0

