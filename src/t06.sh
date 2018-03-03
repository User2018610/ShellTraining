#! /bin/bash

x=13.2
y=14.5

# 注意：这种多行表达式里面，每行前面不能有空格~，否则解析失败
var1=$(bc << EOF
scale=2
a = $x*$x
b = $y*$y
a + b
EOF
)

echo "x**2 + y**2 == $var1"
