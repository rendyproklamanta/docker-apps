#!/bin/bash

# create dir
mkdir -p data/master
mkdir -p data/slave

# Set permission
chmod -R 777 data

# Deploy
docker stack rm redis
docker stack deploy --compose-file docker-compose.production.yml --detach=false redis