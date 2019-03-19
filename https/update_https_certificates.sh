#!/bin/sh

cd /home/silas/soft/
./certbot-auto renew --force-renew --cert-name ghs.xinchidao.com
echo 'complate'