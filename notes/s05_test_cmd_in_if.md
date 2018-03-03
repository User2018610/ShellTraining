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
> 字符串的大小比较 `>`与 `<` 会被理解成重定向操作，所以比较字符串需要转义。比如：`[ $str1 \> $str2 ]` ,`[ $str1 \< $str2 ]`

* 文件比较

```
-d file             ====> 判断 file 是否存在是一个目录

-e file             ====> 判断 file 是否存在[存在为真]

-f file             ====> 判断 file 是否存在并且是一个文件

-r file             ====> 判断 file 是否存在并且可读

-s file             ====> 判断 file 是否存在并且非空[非空为真]

-w file             ====> 判断 file 是否存在并且可写

-x file             ====> 判断 file 是否存在并且可执行

-O file             ====> 判断 file 是否存在并属当前用户所有

-G file             ====> 判断 file 是否存在并且默认组与当前用户相同

file1 -nt file2     ====> 判断 file1 是否比 file2 新 [不会检查文件是否存在]

file1 -ot file2     ====> 判断 file1 是否比 file2 旧 [不会检查文件是否存在]

```

* 复合逻辑表达式

```
[ condition1 ] && [ condition2 ]
[ condition1 ] || [ condition2 ]

```

* 数字相加

```
a=12
b=13
c=$[$a+$b]
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

字符串比较的例子：

```
#! /bin/bash

# 字符串比较

var="c9at"

if [ $USER = $var  ]
then
    echo "当前用户是 $var"
else
    echo "当前用户不是 $var"
fi

var2="c9AT"

if [ $var \> $var2  ]
then
    echo "$var > $var2"
else
    echo "$var <= $var2"
fi
```

文件比较的例子：

```
#! /bin/bash
# 检查文件

path="/home"
if [ -e $path  ]
then
    echo "$path exists"
    if [ -d $path ]
    then
        echo "$path is a dir"
        if [ -r $path ]
        then
            echo "$path can be read"
            if [ -w $path ]
            then
                echo "$path can be write"
            else
                echo "$path can not be write"
            fi
        else
            echo "$path can not read"
        fi
    else
        echo "$path is not a dir"
    fi
else
    echo "$path not exists"
fi
```

复合条件判断的例子：

```
#! /bin/bash

# 复合条件表达式 [ condition1  ] && [ condition2  ]
# 复合条件表达式 [ condition1  ] || [ condition2  ]


a=12
b=13
c=$[$a+$b]

echo "$a+$b==$[ $a + $b  ]"

if [ $a -lt $b ] && [ $c -eq 25 ]
then
    echo "c=a+b=$c"
else
    echo "$a -ge $b"
fi
```
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	