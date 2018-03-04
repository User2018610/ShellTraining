#### test 命令的用途（3种）

1. 数值比较  （比较鸡肋，不如双括号好用，双括号在下面）
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
((d= $a**2 + $b**2))

# x=$[ $a+$b ]  <====>  ((x= $a+$b))
```

#### if-then 的高级特性（2个）

1. 用于数学表达式的双括号
2. 用于高级字符串处理功能的双方括号

* 用于数学表达式的双括号


	> (( expression ))
	
```
val++          ===> 后增
val--          ===> 后减
++val          ===> 先增
--val          ===> 先减
!              ===> 逻辑求反
~              ===> 位求反
**             ===> 幂运算
<<             ===> 左位移
>>             ===> 右位移
&              ===> 位布尔和
|              ===> 位布尔或
&&             ===> 逻辑和
||             ===> 逻辑或
 
```
> 可以在if语句中用双括号命令，也可以在脚本中的普通命令里使用来赋值。

> 注意，不需要将双括号中表达式里的大于号转义。这是双括号命令提供的另一个高级特性。

* 用于高级字符串处理功能的双方括号

> 支持正则匹配，比如 `[[ $USER == ca?  ]]`



case 命令

> 需要注意几点：
> 
> 语法格式是：
> 
```
case $var in
$a | $b )  # a 或者 b
 	echo "xxx"
	echo "yyy"
	;;  # 每个分支结束需要进行的收尾
$c )  
	echo "ccc"
	;;
* ) 
	echo "default"
	;;
esca   # case 结束的收尾
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
> **(这些运算符)**可以在if语句中用双括号命令，也可以在脚本中的普通命令里使用来赋值。

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

使用双括号的例子：

```
#! /bin/bash

# 使用双括号[仅能用于数值操作] (( condition  ))
# 注意：
#  1. 双括号仅用于数值运算
#  2. 双括号与 [ condition  ] 形式不同，这里面的数值判断，
# 不能用 -gt / -eq 这些，需要直接用 > < =  这些比较符号

var1=10

if (( $var1**2 > 90  ))
then
    (( var2=$var1**3  ))
    echo "var2==$var2"
fi

if [ $[$var1**2] -gt 90  ]
then
    echo "$var1**2 == $[$var1*$var1]"
else
    echo "var1=== $var1"
fi

if (( $[$var1**2] == 100  ))
then
    echo "var1 == $var1"
else
    echo "var1 != 10"
fi
```

使用双方括号的例子：

```
#! /bin/bash

# [[ condition  ]] 字符串比较操作
# [[ condition  ]] 类似于 [ condition  ] , 仅仅针对字符串，[[ var  ]] 提供了正则匹配

if [[ $USER == ca?  ]]    # 看到了吗？这里 和 'ca?' 进行正则匹配比较
then
    echo "current user is $USER"
else
    echo "### current user is $USER"
fi
```

使用 case 命令的例子：

```
#! /bin/bash

# case 命令，和 c/java 中 switch case 的用法类似

# 案例：周一到周五输出 "今天上班" ，周六输出 "今天休息" ，
#  其他情况输出 当前日期

# %w   星期几，0-6，0表示星期天
# %u   星期几，1-7，7表示星期天
# date 命令详解 ：https://www.cnblogs.com/hunttown/p/5470527.html
weekDay=$(date +%w)

case $weekDay in
    1 | 2 | 3 |4 |5 )
        echo "今天是 $(date +%A)"
        echo "今天上班"
        ;;
    6 )
        echo "今天是 $(date +%A)"
        echo "今天休息"
        ;;
    * )
        echo "今天是 $(date +%A) , 今天上王者"
        ;;
esac
```
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	