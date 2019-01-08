## 安装redis

```bash
sudo yum install gcc tcl jemalloc-devel -y
cd /tmp
wget http://download.redis.io/releases/redis-3.2.4.tar.gz
tar zxvf redis-3.2.4.tar.gz
cd redis-3.2.4/
make
cd src
sudo make install
```

```bash
sudo cp redis.conf /etc
sudo sed -i "s%daemonize no%daemonize yes%g" /etc/redis.conf
sudo vi /etc/redis.conf  
# 注释 bind 127.0.0.1  这样就可以远程访问了
#protected-mode no 改成 protected-mode yes 
# requirepass heysroad 取消注释，heysroad 修改成密码
```

```bash
# vi /usr/lib/systemd/system/redis.service

[Unit]
Description=Redis
After=syslog.target network.target remote-fs.target nss-lookup.target
  
[Service]
Type=forking
PIDFile=/var/run/redis_6379.pid
ExecStart=/usr/local/bin/redis-server /etc/redis.conf
ExecStop=/usr/local/bin/redis-cli -p 6397 shutdown
 
[Install]
WantedBy=multi-user.target
```

```bash
# 注册服务
systemctl enable redis
# 启动服务
systemctl start redis
# 停止服务
systemctl stop redis
# 查看状态
systemctl status redis
```