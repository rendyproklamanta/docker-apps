#!/bin/bash

# create dir
mkdir -p ./data && chmod -R 777 data

# Deploy
echo '**** Deploy pgadmin ****'
docker stack deploy --compose-file docker-compose.yml --detach=false postgres