
# Centos安装教程

### 1.sudo yum install epel-release
### 4.sudo yum -y install yum-utils
### 5.sudo yum-config-manager --enable epel
### 6.wget https://dl.eff.org/certbot-auto  #（cd soft）
### 7.chmod a+x certbot-auto

### 8.sudo vi /usr/local/nginx/conf/conf.d/m.udd08.com_8112_8109.conf
```sh
location ~ /.well-known
{
    expires 1h;
    root /usr/local/nginx/html;

}
```
### 9.sudo /usr/local/nginx/sbin/nginx -s reload
### 10.sudo ./certbot-auto certonly --email 574969811@qq.com --agree-tos --no-eff-email --webroot -w /usr/local/nginx/html   -d hqtest.xinchidao.com
> 注意，以上安装成功，11-13就不用了
### 11.sudo pip install -U pip
### 12.sudo pip install --upgrade --force-reinstall 'requests==2.6.0' urllib3 pyOpenSSL
### 13.sudo mv /root/.pip/pip.conf /root/.pip/pip.conf.bak

## https更新

### 1.查看所有证书的时间
```sh
sudo ./certbot-auto certificates
```
### 2.更新证书
```sh
sudo ./certbot-auto renew --force-renew --cert-name m.udd08.com # m.udd08.com是根据上面查到的Certificate Name
```
### 3.重启nginx
```sh
sudo /usr/local/nginx/sbin/nginx -s reload
```

### 4.定时脚本(update_https_certificates.sh)
```sh
#!/bin/sh

cd /home/silas/soft/
./certbot-auto renew --force-renew --cert-name ghs.xinchidao.com
/usr/local/nginx/sbin/nginx -s reload
echo 'complate'
```

### 5.设置crontab定时器
```sh
vim /etc/crontab
30 03 01 */2 * root sh /home/silas/script/update_https_certificates.sh
```