#!/bin/bash

# create dir
mkdir -p ./data/primary
mkdir -p ./data/replica

# Set permission
chmod -R 777 data
chmod +x ./conf/failover.sh

# Deploy
docker stack rm postgres
docker stack deploy --compose-file docker-compose.yml --detach=false postgres