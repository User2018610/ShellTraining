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