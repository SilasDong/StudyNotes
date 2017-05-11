# 常用命令
1. 查看环境变量
    1. 查看所有环境变量: env
    2. 单个环境变量名称：echo $PATH
2. CentOS最小系统中，没有安装ifconfig，需要手动安装
    1. yum search ifconfig，显示在net-tools.x86_64包中
    2. yum install net-tools.x86_64，安装后就可以使用ifconfig命令了
3. 添加新用户
```sh
[root@dongzm ~]# useradd dev
[root@dongzm ~]# passwd dev
Changing password for user dev.
New password: 
Retype new password: 
passwd: all authentication tokens updated successfully.
```
3. 为创建的用户添加sudo命令权限（sodo非root用户获取root权限）
    1. sudo命令返回以下信息，表示没有在/etc/sudoers文件中添加对于权限
     ```sh
     [dev@dongzm /]$ sudo rpm -q gcc
     [sudo] password for dev:
     dev is not in the sudoers file.  This incident will be reported.
    ```
    2. 进入root用户
    ```sh
    [dev@dongzm /]$ su -
    Password: 
    Last login: Thu Apr 27 00:48:56 EDT 2017 from 112.5.40.222 on pts/0
    [root@dongzm ~]# cd /etc/
    ```
    3. sudoers文件没有写的权限需要添加
    ```
    [root@dongzm etc]# ll sudoers
    -r--r----- 1 root root 4188 Mar 31  2016 sudoers
    [root@dongzm etc]# chmod u+w sudoers
    [root@dongzm etc]# ll sudoers
    -rw-r----- 1 root root 4188 Mar 31  2016 sudoers
    ```
    4. 用vim修改sudoers文件内容，保存退出
    ```sh
    root	ALL=(ALL)       ALL
    dev     ALL=(ALL)       ALL #添加这行
    ```
    5. 撤销sudoers的写权限
    ```sh
    [root@dongzm etc]# chmod u-w sudoers
    [root@dongzm etc]# ll sudoers
    -r--r----- 1 root root 4216 Apr 27 01:13 sudoers
    ```
    6. Ubuntu updates are security updates(无人值守升级)
    ```sh
    sudo apt-get install unattended-upgrades
    sudo dpkg-reconfigure  unattended-upgrades
    # and select "yes".
    ```
    7. linux window子系统，修改密码
        * C:\%userprofile%\AppData\Local\lxss\rootfs\etc
        * 找到shadow文件，用文本编辑器打开，删除username（个人用户名）后面的密码，保存退出。
        * 管理员进入bash，输入passwd，重新设置密码

