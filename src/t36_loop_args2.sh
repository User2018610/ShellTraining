#! /bin/bash
# 遍历传人的参数有两种方式：第一种，遍历 $* ; 第二种 遍历 索引值 [1,$#]
# 需要注意的是：第二种的情况下，获取某个参数的方式 ${!index} , 而不是 ${$index} ,也不是 $($index)
count=$#

echo "arg count == $count"
echo "the last param is ${!count}"

for (( index=0; index <= $count; index++  ))
do
    echo "arg[$index] = ${!index}"
done
