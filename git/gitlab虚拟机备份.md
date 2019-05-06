## gitlab虚拟机备份
### 1、备份脚本
```sh
#!/bin/bash

gitlab-rake gitlab:backup:create


#gitlab 服务器备份路径
LocalBackDir=/home/develop/git_backup/

# 共享备份服务器 gitlab备份文件存放路径
RemoteBackDir=/mnt/hgfs/shared/

# 查找 gitlab本地备份目录下 时间为60分钟之内的，并且后缀为.tar的gitlab备份文件
BACKUPFILE_SEND_TO_REMOTE=$(find $LocalBackDir -type f -mmin -60  -name '*.tar*')

# 复制备份文件到主机
cp $BACKUPFILE_SEND_TO_REMOTE $RemoteBackDir
          
# 删除共享服务器上面的备份，只保存7天的数据
find $RemoteBackDir -mtime +6 -name '*.tar*' -exec rm -rf {} \;
         
# 进入文件夹删除备份文件
cd $LocalBackDir
rm -rf *
```

### 2、添加到Ubuntu定时器中
```sh
## Ubuntu定时器
vim /etc/crontab
## 每天22点10分钟备份一次
10 22   * * *   root    /home/develop/auto_backup_to_remote.sh
```