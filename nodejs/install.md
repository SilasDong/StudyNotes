## 源码安装
1. 下载源码包，编译比较耗时间（[Source Code](https://nodejs.org/en/download/)）
```
$ wget https://nodejs.org/dist/v6.11.0/node-v6.11.0.tar.gz #下载源码包到本地
$ tar zxvf node-v6.11.0.tar.gz
$ cd node-v6.11.0
$ ./configure
$ make
$ sudo make install
$ node -v && npm -v #测试是否安装完成
```