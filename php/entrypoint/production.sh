#!/bin/sh

set -e

echo "export TZ=Asia/Jakarta" >> /etc/profile
cat /usr/share/nginx/html/cron >> /etc/crontabs/root

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf -n & crond -f

"$@"