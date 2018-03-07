#! /bin/bash

# 结合 while shift 来获取 选项 （获取参数方式相同）


while [ -n "$1" ]  # [ -n "$1" ]  ==> len("$1") != 0
do
    case "$1" in
        -a )
            echo "do -a option.."
            ;;
        -b )
            echo "do -b option.."
            ;;
        -c )
            echo "do -c option..."
            ;;
        -d )
            echo "do -d option..."
            ;;
        * )
            echo "what happened? $1"
    esac
    shift # 左移一位 （不会影响 $0的值）
done


