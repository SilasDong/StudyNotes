# 搭建git服务器

> 环境 Centos7 64位，管理员运行

## 1、安装git
```sh
$ yum install git
```
## 2、创建git用户，用来运行git服务
```sh
$ groupadd git
$ git adduser git
```
## 3、创建登录证书
```sh
$ cd /home/git/
$ mkdir .ssh
$ chmod 700 .ssh
$ touch .ssh/authorized_keys
$ chmod 600 .ssh/authorized_keys 
```
> 收集所有要登录的用户公钥放到authorized_keys中，[参考ssh免密码登录]('../Linux_Centos7/ssh免密码登录.md')

## 4、选一个目录做仓库假定是/home/gitrepo/test.git
```sh
$ cd /home
$ mkdir gitrepo
$ chown git:git gitrepo/
$ cd gitrepo

$ git init --bare test.git
Initialized empty Git repository in /home/gitrepo/test.git/
# 以上命令Git创建一个空仓库，服务器上的Git仓库通常都以.git结尾。然后，把仓库所属用户改为git：
chown -R git:git test.git
```

## 5、克隆仓库
```sh
$ git clone git@ip:/home/gitrepo/test.git
# 如果ssh端口被修改了,修改成以下语句
# git clone ssh://git@ip:port/home/gitrepo/test.git
Cloning into 'test'...
warning: You appear to have cloned an empty repository.
Checking connectivity... done.
```

## 6、禁用git的shell登录
```sh
$ vim /etc/passwd
# git:x:503:503::/home/git:/bin/bash 修改成 git:x:503:503::/home/git:/usr/bin/git-shell
```

1. **[参考文档]('http://www.runoob.com/git/git-server.html')**
2. **[参考文档]('http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/00137583770360579bc4b458f044ce7afed3df579123eca000')**