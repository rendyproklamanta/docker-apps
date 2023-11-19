#!/bin/sh

set -e

echo "export TZ=Asia/Jakarta" >> /etc/profile
cat /usr/share/nginx/html/cron >> /etc/crontabs/root

/usr/local/sbin/php-fpm -F & crond -f

"$@"