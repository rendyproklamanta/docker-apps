#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

# Deploy
echo -e "${RED}**** Deploying service pgpool ****${NC}"
docker stack deploy --compose-file docker-compose.yml --detach=false postgres