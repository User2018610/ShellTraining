#! /bin/bash

echo "参数个数:$#"
if [ "$#" -le 0 ]
then
    echo "需要传人当前要合入的tar.gz的关键字，比如  P38"
    exit 1
fi
echo "第一个参数，是 patch 的标记，比如'P35':$1"

tarName="ALPS03838265(For_aus6739_66_l_n1_alps-mp-n1.mp18-V2_P38).tar.gz"

echo "tarName==$tarName"

awk -v info=$tarName 'BEGIN{print index(info,"For_")}'
start=`awk -v info=$tarName 'BEGIN{print index(info,"For_")}'`
end=$(awk -v info=$tarName 'BEGIN{print index(info,"P38")}')

start=$[ $start+3 ] # +4 , For_ 的长度为4 , 然后还要-1

end=$[ $end+2 ] # +2 , P38 的长度为3 , 然后 -1
echo "start==$start , end==$end"

len=$[ $end-$start  ]

cimsg=${tarName:$start:$len}$1

echo "xmlName==$cimsg.xml"

