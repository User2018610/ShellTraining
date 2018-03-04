#! /bin/bash

# [[ condition  ]] 字符串比较操作
# [[ condition  ]] 类似于 [ condition  ] , 仅仅针对字符串，[[ var  ]] 提供了正则匹配

if [[ $USER == ca?  ]]    # 看到了吗？这里 和 'ca?' 进行正则匹配比较
then
    echo "current user is $USER"
else
    echo "### current user is $USER"
fi

