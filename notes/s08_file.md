1. 文件描述符

	* Linux系统将每个对象当作文件处理。这包括输入和输出进程。Linux用文件描述符(file descriptor)来标识每个文件对象。文件描述符是一个非负整数，可以唯一标识会话中打开 的文件。每个进程一次最多可以有九个文件描述符。出于特殊目的，bash shell保留了前三个文 件描述符(0、1和2)	

	* Linux的标准文件描述符
	
	|文件描述符  | 缩写  |	 描述    |
	| -----    | :---: | :----:  | 
	|   0      | STDIN | 标准输入 |
	|   1      | STDOUT| 标准输出 |
	|   2      | STDERR| 标准错误 |
	
	
2. 使用
	* 命令行中使用

	```
	ls -al badfile 2> test4   # 注意： `2>`中间不能有空格
	ls -al goodfile 1> test
	
	ls -al notes noxs/ &> log.log  # # 2，1 全部输出到 log.log 中
	
	&> 的方式，默认先输出 error, 后输出 normal
	
	ls -al good/ bad/ 1> normal.log 2> error.log # 分别输出到不同的文件
	```
	* 脚本中使用
		* 临时重定向
		* 永久重定向

		> 临时重定向:
		```
		echo "这句输出，指定描述符为2 " >&2
		``` 	
		> 永久重定向:
		```
		exec 2> error.log
		exec 1> log.log
		```
		
		* 使用其他的文件描述符(3-8)
		
		> exec 3> log.log  |# 设置 3 到 log.log
		
		> echo "abc" >&3
		
		> --分割线---
		
		> exec 3>&1  |# 还原 3 到 1
		
		要关闭文件描述符，将它重定向到特殊符号&-。脚本中看起来如下: `exec 3>&-`
				
3. 哈哈哈




指定输出描述符的例子：

```
#! /bin/bash

# 指定输出的文件描述符
# 比如第一句，就是把这个输出的文件描述符指定为 2
# 第二句，没有指定，默认是 1
# 第三句，指定为 1
# todo : 要注意的是：指定了文件描述符并不以为着什么，
# 这这时候在命令行执行个脚本:[ bash filename.sh ] 依然是在屏幕输出下面的3句话
# 因为，默认 2，1 都是直接输出到屏幕
# *** 但是，如何你执行的是:[ bash filename.sh 1> log.log 2> error.log ]，
# 你就会发现，屏幕没有任何打印，但是第一句在 error.log 里面，第二句第三句
# 在 log.log 里面

echo "这句输出，指定描述符为2 " >&2
echo "这句输出，不指定输出的文件描述符"
echo "这句输出的文件描述符指定为1" >&1

```

<<<<<<>>>>>

```
#! /bin/bash

exec 1> log.log
exec 2> error.log

echo "abcde, 以后还能再屏幕输出了嘛？"

# 实验过了，这样做只是让这个脚本的输出被永久重定向了，
#在控制台输出 `ls`依然正常打印

exec 0< README.md

while read line
do
    echo "each line:$line"
done

```