#!/bin/bash

# Deploy
echo '**** Deploy pgpool ****'
docker stack deploy --compose-file docker-compose.yml --detach=false postgres