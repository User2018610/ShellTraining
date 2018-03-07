#! /bin/bash

# shift 左移并丢弃原来的值，类似 iter.next(),但是没有返回值
echo "all args: $@"

shift 2

var=$(shift 1)

echo "var=$var" # 通过输出发现，确实没有返回值

echo "all args: $@"

# while 结合 shift 实现对传入参数的遍历

while [ -n "$1" ]
do
    echo "$1"
    shift
done

