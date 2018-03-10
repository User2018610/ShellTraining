> ps: `$$`表示当前命令PID ===> `echo $$`

##### 文件描述符与重定向操作

1. 文件描述符

	* Linux系统将每个对象当作文件处理。这包括输入和输出进程。Linux用文件描述符(file descriptor)来标识每个文件对象。文件描述符是一个非负整数，可以唯一标识会话中打开 的文件。每个进程一次最多可以有九个文件描述符。出于特殊目的，bash shell保留了前三个文 件描述符(0、1和2)	

	* Linux的标准文件描述符
	
	|文件描述符  | 缩写  |	 描述    |
	| :-----:    | :---: | :----:  | 
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
				
3. 丢弃输出 # 清空文件
	* 丢弃输出
	
	```
	ls -al 1> /dev/null 2>&1
	ls -al >& /dev/null
	ls -al &> /dev/null
	```
	* 清空文件
	
	```
	cat /dev/null > log.log
	```
4. 创建临时文件
	* 创建临时文件的命令
	
	> 默认情况下，mktemp会在本地目录中创建一个文件。要用mktemp命令在本地目录(**当前目录**)中创建一 个临时文件，你只要指定一个文件名模板就行了。模板可以包含任意文本文件名，在文件名末尾 加上6个X就行了。
	mktemp命令会用6个字符码替换这6个X，从而保证文件名在目录中是唯一的。你可以创建多 个临时文件，它可以保证每个文件都是唯一的。
	
	```
	mktemp testing.XXXXXX | 在当前目录创建临时文件（返回文件名）
	mktemp -t testing.XXXXXX | 在 /tmp/ 目录下创建临时文件（返回全路径）
	```
	* 创建临时目录
	
	```
	mktemp -d testing.XXXXXX | 在当前目录创建临时目录
	mktemp -t -d testing.XXXXXX | 在 /tmp/ 目录下创建临时目录（返回全路径）
	```
5. 记录消息
 * 如何将输出输出到屏幕并记录到日志文件？
 ```
 ls -al 1> log.log | cat
 ls -al | tee log.log   #  每次覆盖log.log 文件
 ls -al | tee -a log.log   #  每次追加log.log 文件
 ```
6. 等等




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

