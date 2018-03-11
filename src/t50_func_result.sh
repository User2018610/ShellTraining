#! /bin/bash

# 获取函数的返回值

function hello {
    echo "hello world !"
    echo "这是一个shell 函数哦~"
}

hello # 执行函数

echo "函数 hello 的返回值是: $?" 
# 函数返回值，(0-255）获取方式：在函数调用后区获取 $? 的值

function play {
    echo "this function named play"
    return 33
}

play

echo "function play 的返回值是:$?"

