## ssh免密码登录
### 一、客户端配置
1. 生成公钥和私钥
```sh
# 已经生成过的，不用在重复生成,~表示当前用户的目录，如当前用户名test，~表示/home/test
$ ssh-keygen -t rsa -C 'test@gamil.com'
# 连续回车，重复生成的，覆盖（override）的时候输入yes
# 在用户目录下生成~/.ssh/id_rsa(私钥) 和 ~/.ssh/id_rsa_pub(公钥)
```
2. 公钥导入authorized_keys文件
```sh
# 创建认证文件
$ touch ~/.ssh/authorized_keys
$ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```
3. 将公钥传到服务器
```sh
# 可以使用sftp或者scp
$ scp ~/.ssh/id_rsa.pub xxx@host:/home/id_rsa.pub
```

### 二、服务器配置
1. 修改sshd_config文件
```sh
$ sudo vim /etc/ssh/sshd_config
# 去掉RSAAuthentication yes、PubkeyAuthentication yes、AuthorizedKeysFile .ssh/authorized_keys前面的#
```
2. 重启sshd服务
```sh
$ sudo systemctl restart sshd
```
3. 创建认证文件，导入公钥
```sh
# 创建认证文件
$ mkdir ~/.ssh
$ touch ~/.ssh/authorized_keys
# 导入公钥
$ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
# 修改权限
$ chmod 700 ~/.ssh
$ chmod 600 ~/.ssh/authorized_keys
```
4. 测试登录
```sh
# ssh的端口如果被修改了，需要在后面加 -p 1234
ssh username@ip 
```

**[参考文档](http://www.cnblogs.com/davidxuuts/p/5025392.html )**