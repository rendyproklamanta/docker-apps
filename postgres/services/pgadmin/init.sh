#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

chmod 644 ./servers.json
# create dir
mkdir -p ./data && chmod -R 777 data

# Deploy
echo -e "${RED}**** Deploying service pgadmin ****${NC}"
docker stack deploy --compose-file docker-compose.yml --detach=false postgres