#! /bin/bash

# 相比 return ,更通用的函数返回值传递的方式：
# 通过在函数结束的时候使用 echo 命令，然后再调用时直接用变量接收
# IMPORTANT: 特别注意，这种方式，返回值是函数中的第一次 echo 的值！

function doublling {
    #echo "你还爱我吗?"
    echo "爱过."
    read -p "你回答呀~！[Y/N]" answer
    echo $answer
}

result=$(doublling)

echo "你的回答是: $result"
