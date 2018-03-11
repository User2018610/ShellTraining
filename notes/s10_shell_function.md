##### shell 函数
> bash shell会将函数当作小型脚本来对待


1. 创建函数

	* 格式1：
	
	```
	function name { 
		commands
	}
	```
	* 格式2：

	```
	name() { 
	commands 
	}
	```
	> 1. 如果在函数被定义前使用 函数，你会收到一条错误消息。
	> 2. 函数名必须是唯一的,如果你重定义了函数， 新定义会覆盖原来函数的定义，这一切不会产生任何错误消息。       

	* 函数返回值

		* 默认返回值：函数返回值默认是函数中最后一条命令执行的退出状态码。(0,表示正常退出)
		* 主动返回：加上`return num`语句 (**retun 的值只能是0-255之间**)
			
			> 注意：这种方式获取返回值必须是函数一调用立即去获取`$?`的值
			
			> return 的值只能在 0-255 之间，超出了没有效果
2. 在函数中使用变量
	* 向函数传递参数
	
	> bash shell会将函数当作小型脚本来对待。这意味着你可以像普通脚 本那样向函数传递参数.
	
	> **函数名会在$0 变量中定义，函数命令行上的任何参数都会通过$1、$2等定义**
	
	
	* xx

3. 他
4. 我
5. 哦


---------------------------------------------

函数返回值的例子1 (使用 return 语句/命令 传递返回值)

```
#! /bin/bash

# 获取函数的返回值

function hello {
    echo "hello world !"
    echo "这是一个shell 函数哦~"
}

hello # 执行函数

echo "函数 hello 的返回值是: $?" 
# 函数返回值:(0-255）获取方式：在函数调用后，立即获取 $? 的值

function play {
    echo "this function named play"
    return 33
}

play

echo "function play 的返回值是:$?"

```
函数返回值的例子2 (使用 `echo` 命令 传递返回值)：

```
#! /bin/bash

# 相比 return ,更通用的函数返回值传递的方式：
# 通过在函数结束的时候使用 echo 命令，然后再调用时直接用变量接收
# IMPORTANT: 特别注意，这种方式，返回值是函数中的第一次 echo 的值！

function doublling {
    #echo "你还爱我吗?"
    echo "爱过."
    read -p "你回答呀~！[Y/N]" answer
    echo $answer
}

result=$(doublling)

echo "你的回答是: $result"

```