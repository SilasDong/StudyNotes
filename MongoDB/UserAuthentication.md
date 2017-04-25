# 第二章：MongoDB 3.4 创建用户
## 1、进入MongoDB交互式界面(mongo Shell)
1. 连接数据库
```bat
C:\Users\Administrator>mongo
MongoDB shell version v3.4.4
connecting to: mongodb://127.0.0.1:27017
MongoDB server version: 3.4.4
Welcome to the MongoDB shell.
For interactive help, type "help".
For more comprehensive documentation, see
        http://docs.mongodb.org/
Questions? Try the support group
        http://groups.google.com/group/mongodb-user
Server has startup warnings:
2017-04-25T20:07:24.142+0800 I CONTROL  [initandlisten]
2017-04-25T20:07:24.142+0800 I CONTROL  [initandlisten] ** WARNING: Access control is not enabled for the database.
2017-04-25T20:07:24.142+0800 I CONTROL  [initandlisten] **          Read and write access to data and configuration is unrestricted.
2017-04-25T20:07:24.142+0800 I CONTROL  [initandlisten]
> show dbs
admin  0.000GB
local  0.000GB
```
2. 给admin数据库授权
```bat
> use admin
switched to db admin
> db.createUser(
... ...   {
... ...     user: "dba",
... ...     pwd: "123456",
... ...     roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
... ...   }
... ... )
Successfully added user: {
        "user" : "dba",
        "roles" : [
                {
                        "role" : "userAdminAnyDatabase",
                        "db" : "admin"
                }
        ]
}
```
3. 更改mongod.cfg文件，启用授权登录，添加security.authorization: enabled，重启MongoDB服务，可以在任务管理器的服务中查找MongoDB，然后重启
```
systemLog:
    destination: file
    path: d:\data\log\mongod.log
    logAppend: true
storage:
    dbPath: d:\data\db
security:
    authorization: enabled
```
4. 此时在用Robomongo登录会报错，点击Manage Connections，edit之前创建的MyMongoDB,在Authentication中输入第二步骤中的user和pwd,Test后没有问题Save，再次连接，userAdminAnyDatabase权限只有编辑用户的权限，没有操作集合的权限
5. 重新在开启Mongo Shell，连接成功后show dbs，报错，因为还没有认证
```bat
> show dbs
2017-04-25T20:55:39.547+0800 E QUERY    [thread1] Error: listDatabases failed:{
        "ok" : 0,
        "errmsg" : "not authorized on admin to execute command { listDatabases: 1.0 }",
        "code" : 13,
        "codeName" : "Unauthorized"
} :
_getErrorWithCode@src/mongo/shell/utils.js:25:13
Mongo.prototype.getDBs@src/mongo/shell/mongo.js:62:1
shellHelper.show@src/mongo/shell/utils.js:769:19
shellHelper@src/mongo/shell/utils.js:659:15
@(shellhelp2):1:1
```
6. 认证，最后返回1表示成功，0表示错误
```bat
> use admin
switched to db admin
> db.auth('dba','123456')
1
```
7. 创建读写数据库用户权限
```bat
 use test
switched to db test
> db.createUser(
... ...     {
... ...       user: "test",
... ...       pwd: "123456",
... ...       roles: [
... ...          { role: "readWrite", db: "test" }
... ...       ]
... ...     }
... ... )
Successfully added user: {
        "user" : "test",
        "roles" : [
                {
                        "role" : "readWrite",
                        "db" : "test"
                }
        ]
}
```
8. 测试用户读写权限
```bat
C:\Users\Administrator>mongo
MongoDB shell version v3.4.4
connecting to: mongodb://127.0.0.1:27017
MongoDB server version: 3.4.4
> use test
switched to db test
> db.auth('test','123456')
1
> db.test.insert({'test': 1})
WriteResult({ "nInserted" : 1 })
> db.test.find({})
{ "_id" : ObjectId("58ff493ed6ab3e4f2a8616a0"), "test" : 1 }
```
### 参考文章
1. [MongoDB 3.0 用户创建](http://www.cnblogs.com/zhoujinyi/p/4610050.html)
2. [官方说明文档](https://docs.mongodb.com/manual/tutorial/create-users/)
