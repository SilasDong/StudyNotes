```sh
wget https://nodejs.org/dist/v8.16.0/node-v8.16.0-linux-x64.tar.xz
# 或者
scp node-v8.16.0-linux-x64.tar.xz silas@ip:/home/silas/
```

```sh
tar -xvf node-v8.16.0-linux-x64.tar.xz #解压
sudo mkdir /usr/local/node
sudo cp -r node-v8.16.0-linux-x64/* /usr/local/node/
rm -rf node-v8.16.0-linux-x64
cd /usr/local/node/bin/
./node -v
sudo ln  -s  /usr/local/node/bin/node  /usr/local/bin/node
sudo ln  -s  /usr/local/node/bin/npm   /usr/local/bin/
```
```sh
#安装pm2
npm install pm2 -g
```

```sh
sudo ln  -s  /usr/local/node/bin/pm2   /usr/local/bin/pm2
```

> [参考文档]('https://juejin.im/post/5ad424c16fb9a028c06b48f0')

```sh
#打包
npm run build

#拷贝文件到服务器
.nuxt
static
nuxt.config.js
package.json

#创建nginx文件
upstream nodenuxt {
    server 127.0.0.1:3002; #nuxt项目 监听端口
    keepalive 64;
}

server {
    listen 80;
    server_name mysite.com;
    location / {
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;  
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
        proxy_set_header X-Nginx-Proxy true;
        proxy_cache_bypass $http_upgrade;
        proxy_pass http://nodenuxt; #反向代理
    }
}

#安装依赖包
npm install

#pm2开启进程守护
pm2 start npm --name "yi-nong-sha" -- run start
```

> https://segmentfault.com/a/1190000014450967 部署nuxt参考

