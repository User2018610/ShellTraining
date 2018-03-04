#! /bin/bash

# for loop 

for var in python cat duck monkey dog pig tiger sheep cow
do
    echo "each of the animal is $var"
    if [ $var = cat  ]
    then
        echo "---- this is cat ! I love it"
    fi
done

for var in "New York" "cat's house"
do
    echo "var=$var"
done

# 从一个变量中进行变量字符串

list="I love play football"
list=$list" How about you ?"
list=$list" cat's house has one football"

echo "list=$list"    # 如果list 中有单引号字符串，也没有关系
for word in $list
do
    echo "$word"
done



