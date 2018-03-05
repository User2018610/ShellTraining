# /bin/bash

# 斐波拉切数列求和?

# F(n)=F(n-1)+F(n-2)
for ((factor=1, num=1 ; num <= $1; num++ ))
do
    ((factor = factor * num))
done
echo "$1 --> $factor"
