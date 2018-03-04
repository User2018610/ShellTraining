#! /bin/bash

# 使用双括号 (( condition  ))
# 注意：
#  1. 双括号仅用于数值运算
#  2. 双括号与 [ condition  ] 形式不同，这里面的数值判断，
# 不能用 -gt / -eq 这些，需要直接用 > < =  这些比较符号

var1=10

if (( $var1**2 > 90  ))
then
    (( var2=$var1**3  ))
    echo "var2==$var2"
fi

if [ $[$var1**2] -gt 90  ]
then
    echo "$var1**2 == $[$var1*$var1]"
else
    echo "var1=== $var1"
fi

if (( $[$var1**2] == 100  ))
then
    echo "var1 == $var1"
else
    echo "var1 != 10"
fi

