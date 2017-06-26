# 一般命令
## 1、时间
1. 格式化 date "+%Y-%m-%d %H:%M:%S"
## 2、 压缩
1. zip、unzip
## 3、[history](https://linuxtoy.org/archives/history-command-usage-examples.html)
1. 搜索 ctrl+R 
2. 执行特定命令 !4
3. 执行上一条命令 ctrl+P或者!!
## 4、源码安装
```sh
$ sudo yum install gcc gcc-c++ # 已经安装可以不用安装
$ tar xzvf targetFile
$ cd targetFile
$ ./configure
$ make # 时间比较久
$ sudo make install
```
## 5、常用快捷键
1. Ctrl-A 相当于HOME键，用于将光标定位到本行最前面
2. Ctrl-E 相当于End键，即将光标移动到本行末尾
3. Ctrl-B 相当于左箭头键，用于将光标向左移动一格
4. Ctrl-F 相当于右箭头键，用于将光标向右移动一格
5. Ctrl-D 相当于Del键，即删除光标所在处的字符
6. Ctrl-K 用于删除从光标处开始到结尾处的所有字符
7. Ctrl-L 清屏，相当于clear命令
8. Ctrl-R 进入历史命令查找状态，然后你输入几个关键字符，就可以找到你使用过的命令
9. Ctrl-U 用于删除从光标开始到行首的所有字符。一般在密码或命令输入错误时常用
10. Ctrl-H 删除光标左侧的一个字符
11. Ctrl-W 用于删除当前光标左侧的一个单词
12. Ctrl-P 相当于上箭头键，即显示上一个命令
13. Ctrl-N 相当于下箭头键，即显示下一个命令
14. Ctrl-T 用于颠倒光标所在处字符和前一个字符的位置
15. Ctrl-J 相当于回车键
16. Ctrl-z 终止这个程序，bg 1 放到后台运行，fg 1 放在前台运行，jobs  命令查看正在运行的任务