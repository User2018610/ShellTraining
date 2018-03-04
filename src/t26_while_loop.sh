#! /bin/bash

# while 循环的使用
argCount=$#
echo "参数个数：$argCount"
var=0
while [ $var -lt 5  ]
do
    echo "var=$var"
    #(( var=$var+1 ))  # 这样是可行的
    #(( var++  ))      # 这样也是可行的
    var=$[ $var+1  ]   # 这样也ok
done

echo "###---我是分割线---###"

if (( argCount>0 ))
then
    var=99
    # while 的多条件语句，其实只判断最后一个条件，前面的条件对它没有作用
    while [ $var -gt 0  ]
        echo $var
    do
        echo "newly var=$var"
        ((var = $var-20))
        sleep 1
    done
fi
# 这个例子中，这会是一个死循环！

### 使用 && 来组合多个命令

a=12
b=0
while (( a>0 )) && [ -d $(pwd)  ]
do
    echo "a=$a"
    (( a--  ))
done




