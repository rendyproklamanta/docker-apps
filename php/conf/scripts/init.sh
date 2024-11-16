#!/bin/bash

echo '*** Creating log directory ***'
sudo mkdir -p /var/log/nginx && sudo chmod -R 777 /var/log/nginx
sudo mkdir -p /var/log/php && sudo chmod -R 777 /var/log/php
sudo mkdir -p /var/log/cron && sudo chmod -R 777 /var/log/cron

echo '**** Moving config nginx files ****'
# Create directories for config files
sudo mkdir -p /etc/nginx/conf/production
sudo mkdir -p /etc/nginx/conf/sandbox
# Copy the configuration files using rsync
sudo rsync -a --delete ./conf/production/default.conf /etc/nginx/conf/production/default.conf
sudo rsync -a --delete ./conf/sandbox/default.conf /etc/nginx/conf/sandbox/default.conf