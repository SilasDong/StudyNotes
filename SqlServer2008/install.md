# sql server 2008 安装
1. 默认安装
> * 注意，在选择实例时，可以选择【默认实例】(MSSQLSERVER)
> * 数据库引擎配置时，选择混合模式，输入sa密码

2. 远程访问
> * [教程]('http://jingyan.baidu.com/article/6c67b1d6ca06f02787bb1ed1.html') 主要配置sql server配置管理器，就可以了
> * [开启1433端口](http://www.cnblogs.com/humin/archive/2011/10/27/2227136.html)
> * 远程连接串ip\实例名称,端口，如：192.168.199.242\MSSQLSERVER,1433
> * SQL Server附加数据库失败，错误5120问题解决办法
> 打开Sql Server 配置器管理，单击SQL Server服务，找到右边的Sql Server（SQLEXPRESS）,右键属性，吧Network Servic改成Local System，然后单击重启启动，就可以附加数据库了。附加后，可以在改成Network Servic。
> 上面的方法还是不行的，需要修改文件的权限（.mdf和.ldf），属性>安全>编辑，给Authenticated Users 完全控制权限
> * provider: Named Pipes Provider, error: 40 - 无法打开到 SQL Server 的连接
> * 修改数据库的连接字符串，server=.;改成server=.\SQLEXPRESS;,可以查看下自己的Sql Server服务名称是不是SQLEXPRESS