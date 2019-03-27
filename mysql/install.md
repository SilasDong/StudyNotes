# 安装Mysql 数据库
## 1、创建文件夹
```sh
mkdir -p /usr/local/mysql
mkdir -p /data/dbfiles/mysql
mkdir -p /data/dblogs/mysql

cd /home/silas/soft
# 上传mysql安装文件到/home/silas/soft
tar -zvxf mysql-5.7.18-linux-glibc2.5-x86_64.tar.gz #解压
cp -r mysql-5.7.18-linux-glibc2.5-x86_64/* /usr/local/mysql/
rm -rf mysql-5.7.18-linux-glibc2.5-x86_64
```

## 2、创建数据库用户、授权
```sh
groupadd mysql
useradd -r -s /sbin/nologin -g mysql mysql -d /usr/local/mysql

chown -R mysql:mysql /usr/local/mysql
chown -R mysql:mysql /data/dbfiles/mysql
chown -R mysql:mysql /data/dblogs/mysql
```

## 3、初始化参数
```sh
cd /usr/local/mysql/
yum install libaio*
# 如果/data/dbfiles/mysql文件夹下面有文件，要全部删除  不然会报错
# 会输出临时密码 需要保存 下面使用 A temporary password is generated for root@localhost: t4_YtnM9alwc
bin/mysqld --initialize --user=mysql --basedir=/usr/local/mysql --datadir=/data/dbfiles/mysql

bin/mysql_ssl_rsa_setup  --datadir=/data/dbfiles/mysql
```

## 4、配置文件修改
> 修改/etc/my.cnf文件
```sh
# For advice on how to change settings please see
# http://dev.mysql.com/doc/refman/5.7/en/server-configuration-defaults.html

# The following options will be passed to all MySQL clients
[client]
#password	= your_password
port=3306
socket= /data/dbfiles/mysql/mysql.sock

[mysqld]
#
# Remove leading # and set to the amount of RAM for the most important data
# cache in MySQL. Start at 70% of total RAM for dedicated server, else 10%.
# innodb_buffer_pool_size = 128M
#
# Remove leading # to turn on a very important data integrity option: logging
# changes to the binary log between backups.
# log_bin
#
# Remove leading # to set options mainly useful for reporting servers.
# The server defaults are faster for transactions and fast SELECTs.
# Adjust sizes as needed, experiment to find the optimal values.
# join_buffer_size = 128M
# sort_buffer_size = 2M
# read_rnd_buffer_size = 2M


#base configuration
server-id=1
port=3306
basedir=/usr/local/mysql
datadir=/data/dbfiles/mysql
tmpdir=/data/dbfiles/mysql/tmp
socket=/data/dbfiles/mysql/mysql.sock
pid-file=/data/dbfiles/mysql/mysql.pid
log-error=/data/dblogs/mysql/mysql.err

#log-bin  configuration
log-bin = mysql-bin
log-bin-index = mysql-bin.index
binlog_format=mixed
log_bin_trust_function_creators=1
expire_logs_days=10

#slow_query_log 5 seconds for slow query
slow_query_log=1
long_query_time=5
slow_query_log_file=/data/dblogs/mysql/slow.log

#character set
character-set-server=utf8mb4 
collation-server=utf8mb4_general_ci

#other configuration
lower_case_table_names=0
event_scheduler=1
explicit_defaults_for_timestamp=1
#group_concat_max_len maxvalue 2^64-1
group_concat_max_len=4294967295
innodb_file_per_table=1

skip-name-resolve
skip-external-locking

max_connections=1000
back_log=600

table_open_cache=128
max_allowed_packet=32M
binlog_cache_size=8M
read_buffer_size=2M
read_rnd_buffer_size=8M
sort_buffer_size=8M
join_buffer_size=8M
thread_cache_size=64
query_cache_size=512M
query_cache_limit=64M
key_buffer_size=512M

innodb_open_files=500
innodb_buffer_pool_size=4G
innodb_log_buffer_size=2M
innodb_log_file_size=512M
innodb_log_files_in_group=3
innodb_lock_wait_timeout=120 
innodb_flush_log_at_trx_commit=2

interactive_timeout=28800
wait_timeout=28800

sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION

#Disabling symbolic-links is recommended to prevent assorted security risks
#For InnoDB tables, use the DATA DIRECTORY clause on the CREATE TABLE statement instead of symbolic links
symbolic-links=0


[mysqldump]
quick
max_allowed_packet=256M

[myisamchk]
key_buffer_size=20M
sort_buffer_size=20M
read_buffer=2M
write_buffer=2M
```

## 5、启动mysql，创建用户
```sh
touch /data/dblogs/mysql/mysql.err
chmod 777 /data/dblogs/mysql/mysql.err

mkdir -p /data/dbfiles/mysql/tmp
chown mysql:mysql /data/dbfiles/mysql/tmp

# /data/dblogs/mysql/mysql.err 查看是否有错误信息
bin/mysqld_safe --user=mysql | &

# 使用临时密码登录 t4_YtnM9alwc
bin/mysql --user=root -p

# 修改root密码
set password=password('123456');
grant all privileges on *.* to dbadmin@'%' identified by '123456' with grant option;
flush privileges;
use mysql;
select host,user from user;
```

## 6、配置环境变量
```sh
vim /etc/profile
export PATH=/usr/local/mysql/bin:$PATH
source /etc/profile
```

## 7、配置mysql服务随机自动启动
```sh
cd /etc/init.d
cp /usr/local/mysql/support-files/mysql.server ./mysql
vi mysql
修改下面值：
basedir=
datadir=
# 改成下面的值
basedir=/usr/local/mysql
datadir=/data/dbfiles/mysql

chmod 755 /etc/init.d/mysql
chkconfig --add mysql
chkconfig --level 345 mysql on
```

## 8、启停MySQL服务
> 上面的方式启动后关闭linux窗口后，mysql会关闭，使用service mysql restart重启一下
```sh
service mysql start|stop|restart|status
```

## 9、设置mysql软连接
```sh
ln -fs /usr/local/mysql/bin/mysql /usr/bin/mysql
```

## 10、添加服务器端口
> 开放云服务器端口，linux有防火墙的话 也要把端口添加进去


## 11、数据库普通用户授权
```sh
# 全部授权
grant execute,select,update,delete,insert,show view,lock tables,trigger on xcd_p_demo.* to web@'127.0.0.1' identified by '123456' with grant option;
flush privileges;
use mysql;
select host,user from user;

# 授权开发者账户
grant create,alter,drop,references,create temporary tables,index, create view, show view, create routine,alter routine, execute,select,update,delete,insert,lock tables,trigger on xcd_p_demo.* to develop@'%' identified by '123456' with grant option;
flush privileges;
use mysql;
select host,user from user;

# 单个授权
grant show view on my_test.* web@'127.0.0.1';
grant lock tables on my_test.* web@'127.0.0.1';
grant trigger on my_test.* to web@'127.0.0.1';

函数无法创建，执行以下语句
set global log_bin_trust_function_creators = 1;
```

## 11、数据库备份
```sh
mysqldump -hlocalhost -P3306 -uroot -ppassword dbname > bak.sql

# 查看正在运行的语句
show full processlist 
# 根据id（如：21274），停止正则运行的语句
kill 21274
```

## 12、Waiting for table metadata lock的解决方法
```sh
select * from information_schema.innodb_trx ## 查看正在运行的事务
kill x_mysql_thread_id
```