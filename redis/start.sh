#!/bin/bash

# create dir
mkdir -p data/master
mkdir -p data/slave
mkdir -p data/sentinel

# Set permission
chmod -R 777 data

# Deploy
docker stack rm redis
docker stack deploy --compose-file docker-compose.yml --detach=false redis