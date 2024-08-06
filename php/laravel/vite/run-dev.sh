#!/bin/bash

cd source 
yarn install && composer install
cd ..
docker compose -f docker-compose.development.yml up -d --force-recreate
cd source && yarn dev 