#! /bin/bash
# 遍历传人的参数有两种方式：第一种，遍历 $* ; 第二种 遍历 索引值 [1,$#]
# 需要注意的是：第二种的情况下，获取某个参数的方式 ${!index} , 而不是 ${$index} ,也不是 $($index)
count=$#

echo "arg count == $count"
echo "the last param is ${!count}"

echo "all args ===> $*"

echo "the last param is ${!#}"

for var in "$*"   # 这种方式不可行，加了"",就禁锢了 $* ,因为 $* 把全部输入当成一个单词了
# 不过，如果是不带 "" ，那么也可以，因为默认 空格，制表符，换行符 ，都是 for 的分割点
do
    echo "arg=$var"
done

for var in "$@"
do
    echo "@arg= $var"
done

for (( index=1; index <= $count; index++  ))
do
    echo "each arg= ${!index}"
done
