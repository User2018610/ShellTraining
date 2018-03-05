#! /bin/bash

for (( a=0;a<10;a++ ))
do
    for (( b=10;b>0;b-- ))
        do
            if [ "$a" -eq "$b" ] && ((a==5 || b==6))
            then
                break 2
            fi
            echo -e "$a*$b=$[ $a*$b  ]\t\c"
        done
        echo ""
done > log.log

