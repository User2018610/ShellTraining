#! /bin/bash

# if then else 结构
echo "arg size== $#"

# if [ $var -gt 1 ]; then echo aaa ; fi
if [ $# -gt 1 ];then user=$USER ; else user=$1;fi
#user=$1
echo "arg1 == $1"
if grep $user /etc/passwd

then
    echo "用户 $user 存在"
    ls -al /home/$user 
    exit 0
else
    if ls -d /home/$user >& /dev/null
    then
        echo "目录 : /home/$user 依然存在"
    fi

fi

