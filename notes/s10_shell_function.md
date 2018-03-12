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
		* 通过在函数最后使用`echo`语句返回
		
		```
		function play {
			echo "123" # 函数返回值 
		}
		result=$(play) # 获取函数返回值
		```
2. 在函数中使用变量
	* 向函数传递参数
	
	> bash shell会将函数当作小型脚本来对待。这意味着你可以像普通脚 本那样向函数传递参数.
	
	> *<del>函数名会在$0 变量中定义</del>[**这句话不对，已验证]**,函数命令行上的任何参数都会通过$1、$2等定义*

	格式：`functionName args`
	
	```
	# 向函数传递参数
	function adding {
	    if [ "$#" -eq 1 ]
	    then
	        echo "$[ $1 + $1  ]"
	    elif [ "$#" -eq 2 ]
	    then
	        echo "$[ $1 + $2 ]"
	    else
	        echo -1
	    fi
	}
	
	sum=$(adding 12 9) # 给函数传递参数
	echo "sum of 12 and 9 is :$sum"

	```
	
	* 在函数中处理变量
	
	> 变量作用域是变量可见的区域。函数 中定义的变量与普通变量的作用域不同。也就是说，对脚本的其他部分而言，它们是隐藏的。
函数使用两种类型的变量:  全局变量 ； 局部变量
	
	> **全局变量是在shell脚本中任何地方都有效的变量**
	> `shell`中任意地方定义的变量都是全局变量；函数中的变量前面加了 `local` 修饰，可以成为局部变量 (只存在与当前函数中)

	* x

3. 刚刚
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
函数参数与脚本参数区分的例子：

```
#! /bin/bash

# 函数参数与脚本的参数并不是一回事
# 不能在函数中直接使用脚本参数

if [ $# -lt 2  ]
then
    echo "at least, i need two arguments"
    exit 3
fi
function add {
    echo "$[ $1 + $2 ]"
}

echo "the result of function add is: $(add)" # 这样会报错

#echo "the result of function add is: $(add $1 $2)" # 这样就正常了

```

*证实`$0`并不能获取函数名的例子：*

```
#! /bin/bash
function play {
    echo "$0"
}

func_name=$(play)

echo "func_name is $func_name" # 实际获取的是文件名，不是函数名
# 在Ubuntu 下面也是如此，并没有输出函数名

function hi {
    echo "$@"
}

echo "显示函数hi 的返回值：$(hi a b c de 1024 x)"
# 通过对函数中 $@ 的输出可以看到，并没有 $0 对应的值

```
