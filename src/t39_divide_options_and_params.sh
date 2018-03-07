#! /bin/bash

# 区分传入的参数与选项(linux 默认使用 --[破折线] 来区分)

while [ -n "$1" ]
do
    echo "option #### $1"
    shift
    if [ "--" = "$1" ]
    then
        break
    fi


done

while [ -n "$1" ]
do
    echo "param @@@ $1"
    shift
done
