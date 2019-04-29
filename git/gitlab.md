## gitlab
### 1、备份
1. 备份命令：gitlab-rake gitlab:backup:create
2. 备份默认文件夹/var/opt/gitlab/backups
3. [参考](https://www.cnblogs.com/shansongxian/p/6599144.html)

### 2、gitlab备份文件解压
1. 打开压缩文件夹找到.bundle文件，拷贝放到一个目录下面
2. 命令
```sh
git clone --mirror myrepo.bundle my.git
mkdir output
cd my.git 
git archive master | (cd ../output && tar x)
```
3. [参考](https://gist.github.com/maxivak/513191447d15c4d30953006d99928658)


