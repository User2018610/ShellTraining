#! /bin/bash

exec 1> log.log
exec 2> error.log

echo "abcde, 以后还能再屏幕输出了嘛？"

# 实验过了，这样做只是让这个脚本的输出被永久重定向了，
#在控制台输出 `ls`依然正常打印

exec 6<&0   # 临时保存 stdin 到6 （stdin 是0）
exec 0< README.md # 改变 0 为读 README.md 这个文件

while read line
do
    echo "each line:$line"
done

exec 0<&6 # 还原 stdin 的默认方式 (控制台)
exec 6>&- # 关闭文件描述符6 
echo "66666666" >&6  # 这句会报错，因为6被关闭了
# 不关闭也没事，脚本结束自动关闭
