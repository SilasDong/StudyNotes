1. 检查80端口是否被占用，（一般是IIS会占用）[参考网站](http://www.yelook.com/1450.html)
```bat
netstat -aon | findstr "80" //找到pid
tasklist | findstr "4"      //pid=4是被sql server 占用关闭（SQL Server Reporting Services (MSSQLSERVER)服务）
```
2. 安装[WampServer]("wampserver.exe")软件，一直默认就可以
3. 修改alias/phpmyadmin.conf文件<br>
      把 Allow from 127.0.0.1 改成 Allow from all，这样所以地址都能访问phpmyadmin网站
4. 进入phpmyadmin修改数据库root密码（安装完后数据库密码为空）<br>
> 进入网站后，点击权限，编辑所以用户名为root的用户权限，进入权限后，修改密码（密码可以一样）<br>
> 在刷新网站时，错误提示，次数进入apps/phpmyadmin3.4.10.1/config.inc.php进行编辑<br>
> $cfg['Servers'][$i]['password'] = '123456'; 本来为空，填写你上面设置的密码，再次刷新就能进入网站<br>
> 注意：如果要设置成，需要登门后才能进入phpmyadmin网站的，可以设置$cfg['Servers'][$i]['auth_type'] = > 'cookie';（cookie是要登陆，config不需要登陆，默认是config）

5. 需要运行局域网或者外网能访问本站部署的程序，需要修改bin/apache/Apache2.2.21/conf/httpd.conf<br>
       注释<br>
        #Deny from all<br>
        #Allow from 127.0.0.1<br>
6. 以上每次修改配置文件都需要重启WampServer才能生效

7. 远程访问mysql权限设置
> GRANT  ALL PRIVILEGES ON *.* TO 'root'@'192.168.199.226' IDENTIFIED BY '123456' WITH GRANT OPTION;