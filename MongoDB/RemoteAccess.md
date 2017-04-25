# 第三章：远程访问

> 按照前面两章的方法安装后，服务器上的MongoDB，是可以被远程访问的，如果只想本地访问，可以在mongod.cfg中追加net.bindIp，设置成本地ip
```
net:
    bindIp: 127.0.0.1
```
>也可以在本地ip后追加公网ip，用逗号隔开，就可以重新被外网访问了
```
net:
    bindIp: 127.0.0.1,公网ip
```
>完整mongod.cfg
```
systemLog:
    destination: file
    path: d:\data\log\mongod.log
    logAppend: true
storage:
    dbPath: d:\data\db
security:
    authorization: enabled
net:
    bindIp: 127.0.0.1
```