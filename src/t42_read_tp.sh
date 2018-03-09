#! /bin/bash
# read 超时命令的使用，等待用户输入，如果用户没有及时输入，就返回非零状态码

read -t 5 -p "你是猪头吗? (5s内请完成回答)::::" answer

if [ "$?" -eq 0 ]
then
    echo "你的回答是："$answer
else
    echo "你真慢得跟猪头一样，没机会回答了！"
fi

if read -t 5 -p "你吃屎吗?" answer     # 注意一下，if 本来就是这样用的， 上面的那种其实是多余了，不过更清晰
then
    echo "answer=$answer"
else
    echo "吃屎去吧，傻逼！！！！"
fi
