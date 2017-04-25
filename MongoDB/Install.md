# 第一章：MongoDB 安装（windows service）
>环境：windows 64位
## 1、下载地址
 [mongoDB 3.4.4](https://www.mongodb.com/download-center?jmp=nav)
 >注意：要下载Community Server版本，下载.msi安装文件
1. 双击.msi文件
2. next
3. accept勾选后，next
4. Custom,自定义安装
5. 这里我修改安装路径，next
6. Install
7. Finish
8. 设置环境变量，MongoDB_HOME=D:\MongoDB，在path上添加%MongoDB_HOME%\bin

## 2、添加数据库目录
> mongoDB的数据库目录是独立的，启动的时候带上相应数据库的路径就可以了，最好不要把程序和数据文件放在一个文件夹，影响以后更新程序，本教程是安装MongoDB Windows服务
1. 创建文件夹，数据库：D:\data\db，日志：D:\data\log
2. 在D:\MongoDB文件夹下创建mongod.cfg
```
systemLog:
    destination: file
    path: d:\data\log\mongod.log
storage:
    dbPath: d:\data\db
```
3. 安装MongoDB Windows自启动服务，在cmd(administrator)下运行下面这条语句，终端中回显：[SC] CreateService 成功，表示安装成功
```bat
sc.exe create MongoDB binPath= "\"D:\MongoDB\bin\mongod.exe\" --service --config=\"D:\MongoDB\mongod.cfg\"" DisplayName= "MongoDB" start= "auto"
```
4. 启动服务
```bat
net start MongoDB
```
5. 在Mongo shell 操作，因为已经设置了环境变量，只要在cmd中输入mongo，就可以连接到数据库,今日交互式命令行

> 注意：如果服务没有启动成功，请查看mongod.cfg路径是否写对，格式是否正确，如果正确，可以在日志文件中查看具体原因

[参考官方文档说明](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-windows/)

## 3、可视化工具Robomongo安装

  [下载地址](https://robomongo.org/)
1. 一路默认安装就可以了，自行决定是否要修改安装路径
2. 首次启动会让你需要写下一些资料
3. 进入后，在MongoDB Connections中创建一下数据库连接连接,创建时修改一下Name，其它暂时不用写,Test一下，没有问题就可以Save了

**安装MongoDB服务和可视化工具Robomongo就完成了**
****
