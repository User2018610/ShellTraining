#! /bin/bash

# 复合条件表达式 [ condition1  ] && [ condition2  ]
#                [ condition1  ] || [ condition2  ]


a=12
b=13
c=$[$a+$b]

echo "$a+$b==$[ $a + $b  ]"

if [ $a -lt $b ] && [ $c -eq 25 ]
then
    echo "c=a+b=$c"
else
    echo "$a -ge $b"
fi

