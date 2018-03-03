#! /bin/bash

if pwd
then 
    echo "ROSE IS RED"
fi

echo "if cmd ; then cmd;fi; --> 如果 if 后面的命令执行结果是0，就执行'then'后面的命令，否则不执行 then 后面的命令"

echo "##########---我是分割线---#######"

if ls ../
then
    pwd
fi

echo "------final-----"

if cd abc/
then 
    pwd
fi

echo "xxxxxxxxxxxxxxxxxx"
