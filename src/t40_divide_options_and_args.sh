#! /bin/bash

var=10

while [ $var -gt 0 ]
do
    if [ "$var" -eq "5" ]
    then
        break
    fi
    echo -e "var=$var\t\c"
    var=$[ $var-1 ]
done

echo

while [ -n "$1" ]
do
    if [ "--" = "$1" ]
    then
        #echo "$1 --> XXX--YYY"
        shift   # -- 也要左移丢弃掉
        break
    else
        echo "option: $1"
    fi
    shift
done

while [ -n "$1" ]
do
    echo "param: $1"
    shift
done

