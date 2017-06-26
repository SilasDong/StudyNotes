# github_ssh连接
## 1、设置全局的name和email
```sh
$ git config --global user.name "test"
$ git config --global user.email "test@gmail.com"
```

## 2、生成密码
```sh
ssh-keygen -t rsa -C "test@gmail.com"
```
> 连续3个回车。如果不需要密码的话。
最后得到了两个文件：id_rsa和id_rsa.pub，文件名称可以修改

## 3、添加密钥到ssh-agent
> 确保 ssh-agent 是可用的。ssh-agent是一种控制用来保存公钥身份验证所使用的私钥的程序，其实ssh-agent就是一个密钥管理器，运行ssh-agent以后，使用ssh-add将私钥交给ssh-agent保管，其他程序需要身份验证的时候可以将验证申请交给ssh-agent来完成整个认证过程

```sh
$ ssh-agent bash
```

## 4、登陆Github, 添加 ssh

## 5、测试
```sh
sh -T git@github.com
```