#!/bin/bash

docker network create --driver overlay rabbitmq-network

# create dir
mkdir -p data/rabbitmq1
mkdir -p data/rabbitmq2
mkdir -p data/rabbitmq3

# Set permission
chmod -R 777 data
chmod +x entrypoint.sh

# Deploy
docker stack rm rabbitmq
docker stack deploy --compose-file docker-compose.yml --detach=false rabbitmq
