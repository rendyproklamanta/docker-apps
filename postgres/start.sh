#!/bin/bash

docker network create --driver overlay postgres-network

# create dir
mkdir -p ./data/primary
mkdir -p ./data/replica
mkdir -p ./data/etcd

# Set permission
chmod -R 777 data

# Deploy
docker stack rm postgres
docker stack deploy --compose-file docker-compose.no-patroni.yml --detach=false postgres