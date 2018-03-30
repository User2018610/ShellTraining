#! /bin/bash

# 合入6739 (c71) 原始分支的脚本

# 进入当前目录 mtk_7.1_6739

echo "参数个数:$#"
if [ "$#" -le 0 ]
then
    echo "需要传人当前要合入的tar.gz的关键字，比如  P38"
    exit 1
fi
echo "第一个参数，是 patch 的标记，比如'P35':$1"

tarKey=$1

cd ~/mtk_7.1_6739

tarName=$(ls | grep $tarKey)


#################---------------------
echo "tarName==$tarName"

awk -v info=$tarName 'BEGIN{print index(info,"For_")}'
start=`awk -v info=$tarName 'BEGIN{print index(info,"For_")}'`
end=$(awk -v info=$tarName 'BEGIN{print index(info,"P38")}')

start=$[ $start+3  ] # +4 , For_ 的长度为4 , 然后还要-1

end=$[ $end+2  ] # +2 , P38 的长度为3 , 然后 -1
echo "start==$start , end==$end"

len=$[ $end-$start   ]

cimsg=${tarName:$start:$len}$1

echo "xmlName==$cimsg.xml"

################======================
tar -zxvf $tarName -C ~/mtk_7.1_6739

cd alps

if [ "$?" -ne 0 ]
then
    echo "cd $(pwd)/alps fail"
    exit 1
fi

repo forall -c "git add ."
if [ "$?" -ne 0 ]
then
    echo "repo not found ........ pycat"
    exit 1
fi
repo forall -c git commit -m "apply patch $cimsg"
repo manifest -r -o $cimsg.xml

echo "一个patch 合入完成了"



