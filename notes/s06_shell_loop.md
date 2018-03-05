#### 使用结构化命令

##### loop

* for 循环

> 格式如下:

```
for var in list
do
	commands
done
```

> 小插曲，拼接字符串的方式

```
var="abcd"
var = $var"ef"  # now var == "abcdef"
```

> 小插曲，正数求值的方式

```
a=12
b=13
c=$[ $a * $b ]
```

for 循环的例子：

```
#! /bin/bash

# for loop

for var in python cat duck monkey dog pig tiger sheep cow
do
    echo "each of the animal is $var"
    if [ $var = cat  ]
    then
        echo "---- this is cat ! I love it"
    fi
done

for var in "New York" "cat's house"  # 带空格的字符串，需要双引号，带 单引号的字符串，也需要双引号
do
    echo "var=$var"
done
```

while 循环的例子：

```
#! /bin/bash

# while 循环的使用
argCount=$#
echo "参数个数：$argCount"
var=0
while [ $var -lt 5  ]
do
    echo "var=$var"
    #(( var=$var+1 ))  # 这样是可行的
    #(( var++  ))      # 这样也是可行的
    var=$[ $var+1  ]   # 这样也ok
done

echo "###---我是分割线---###"

if (( argCount>0 ))
then
    var=99
    # while 的多条件语句，(慎用，逻辑很奇怪)
    while [ $var -gt 0  ]
        echo $var
    do
        echo "newly var=$var"
        ((var = $var-20))
        sleep 1
    done
fi
# 这个例子中，这会是一个死循环！
# 通过(( argCount>0 )) ，如果 执行的时候，不传参数，这个死循环就不执行了~

### 使用 && 来组合多个命令

a=12
b=0
while (( a>0 )) && [ -d $(pwd)  ]
do
    echo "a=$a"
    (( a--  ))
done
```