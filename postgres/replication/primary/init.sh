#!/bin/bash

# create dir
mkdir -p ./data && chmod -R 777 data

# Deploy
echo '**** Deploy postgres primary ****'
docker stack deploy --compose-file docker-compose.dev.swarm.yml --detach=false postgres