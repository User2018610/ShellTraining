#! /bin/bash

# 假装自己是一个函数库，其他 shell 脚本在调用我时，在脚本里面加上 ‘source .../me.sh’就可以了


function helloworld {

    echo "hello world"
}

function add {
    echo "$[ $1 + $2 ]" # 这里的 $1 ,$2 是函数参数，而不是脚本参数
}

function print99 {

    for (( i=1; i<=9; i++ ))
    do
        for ((  j=1; j<=i; j++ ))
        do
            echo -e "$i*$j = $[ $i*$j ] \t \c"
        done
        echo ""
    done
}

