#!/bin/sh

cd /home/silas/soft/
./certbot-auto renew --force-renew --cert-name xxx.xinchidao.com
/usr/local/nginx/sbin/nginx -s reload
echo 'complate'