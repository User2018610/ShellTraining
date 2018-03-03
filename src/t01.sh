#! /bin/bash

#初步的练习：
#编写一个脚本,显示时间和日期, 列出所有登陆的用户, 然后给出系统的更新时间. 最后这个脚本
#将会把这些信息保存到一个log file中.
#

out='../out'
lgf='log.log'
path=$out/$lgf
#echo path===$path
mkdir -p $out
touch $path
cat /dev/null > $path
date | tee -a $path
who | tee -a $path
uptime | tee -a $path

exit 0
