#! /bin/bash
# read 命令 ，读取用户输入，并存放到当前变量
read -p "input your name:" name

echo -n "input your age:"  # echo -n 不换行输出

read age

echo "your name is $name , and your age is $age"

