#### test 命令的用途（3种）

1. 数值比较
2. 字符串比较
3. 文件比较

> `test` 的等价方式是 `[ conditon ]` ,注意`condition`的前后都需要有一个空格，否则会出现语法错误


* 数值比较
	* 注意，只能处理正数，不能处理浮点数

```
	n1 -eq n2    ====> n1 == n2

	n1 -ge n2    ====> n1 >= n2

	n1 -gt n2    ====> n1 >  n2

	n1 -le n2    ====> n1 <= n2

	n1 -lt n2    ====> n1 < n2

	n1 -ne n2    ====> n1 != n2
```	

> 数值条件测试可以用在数字和变量上

* 字符串比较

```
str1 = str2     =====> str1 == str2

str1 != str2    =====> str1 != str2

str1 < str2     =====> str1 <  str2

str1 > str2     =====> str1 >  str2

-n str1         =====> len(str1) != 0

-z str1         =====> len(str1) == 0

```








---------------------------------
数值比较的例子：

```
#! /bin/bash

# 使用test 命令进行数值的比较 （作用于变量或者数字）

var1=1333
var2=99

if test $var1 -lt 255
then
    echo "$var1 < 255"
elif [ $var2 -ge 999  ]
then
    echo "$var2 >= 999"
else
    echo "$var1 + $var2 ----"
fi
```

> 输出了 else 的内容。
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	