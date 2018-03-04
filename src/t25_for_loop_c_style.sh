#! /bin/bash

# 注意点：这种 c style 形式的 for 循环，在 (( cmds  )) 里面不能使用 $var , 而是应该直接使用 var
# 并且，里面变量赋值，可以有空格
for (( i=0 ; i < 10 ; i++  ))
do
    echo "current is $i"
done

