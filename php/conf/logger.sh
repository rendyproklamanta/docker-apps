#!/bin/bash

echo '*** Creating log directory ***'

sudo mkdir -p /var/log/nginx && sudo chmod -R 777 /var/log/nginx
sudo mkdir -p /var/log/php && sudo chmod -R 777 /var/log/php

echo '*** Checking error log ***'

# CI
head -n 500 /var/log/php/log-$(date +%Y-%m-%d).php

# Laravel
head -n 500 /var/log/php/laravel.log