#! /bin/bash

var=$[25 + 32]

var1=100
var2=50
var3=45

ret=$[$var1-$var2*$var3]

echo "$var1-$var2\*$var3 === $ret"


ret=$(echo "${var1}-$var2*$var3" | bc)  # 通过 piping 和 bc 来执行 数学运算

echo "ret===####### ${ret}"


floatV=$(echo "scale=3;2/3"|bc)

echo "2/3==#########${floatV}"
