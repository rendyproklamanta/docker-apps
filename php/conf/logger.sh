#!/bin/bash

echo '*** Checking error log ***'

# CI
head -n 500 /var/log/php/log-$(date +%Y-%m-%d).php

# Laravel
head -n 500 /var/log/php/laravel.log