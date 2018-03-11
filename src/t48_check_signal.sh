#! /bin/bash

# 使用 trap 命令监听并处理信号 | 接替系统处理，然后自己处理

trap "echo 'fuck,脚本退出了...'" EXIT
trap "echo 'sorry! I received a C-c'" SIGINT
count=10
while [ $count -gt 0 ]
do
    echo "count=$count"
    count=$[ $count-1 ]
    sleep 1
done

# 移除监听
trap - SIGINT
#trap -- EXIT   # [ 移除监听，- -- 都可以  ]
var=0
while [ $var -lt 5 ]
do
    echo "$var must less than five"
    sleep 1
    (( var++  ))
done
echo "# loop finished..."
