#! /bin/bash

# case 命令，和 c/java 中 switch case 的用法类似

# 案例：周一到周五输出 "今天上班" ，周六输出 "今天休息" ，
#  其他情况输出 当前日期

# %w   星期几，0-6，0表示星期天
# %u   星期几，1-7，7表示星期天
# date 命令详解 ：https://www.cnblogs.com/hunttown/p/5470527.html
weekDay=$(date +%w)

case $weekDay in
    1 | 2 | 3 |4 |5 )
        echo "今天是 $(date +%A)"
        echo "今天上班"
        ;;
    6 )
        echo "今天是 $(date +%A)"
        echo "今天休息"
        ;;
    * )
        echo "今天是 $(date +%A) , 今天上王者"
        ;;
esac


