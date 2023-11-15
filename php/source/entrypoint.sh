#!/bin/sh

# Cron
cp /usr/share/nginx/html/cron /etc/crontabs/root

# Run cron
crond -f