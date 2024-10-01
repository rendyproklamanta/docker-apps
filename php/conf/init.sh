#!/bin/bash

echo '*** Creating log directory ***'
sudo mkdir -p /var/log/nginx && sudo chmod -R 777 /var/log/nginx
sudo mkdir -p /var/log/php && sudo chmod -R 777 /var/log/php
sudo mkdir -p /var/log/cron && sudo chmod -R 777 /var/log/cron