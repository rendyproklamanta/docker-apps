#!/bin/bash

docker swarm init
docker network create --driver overlay postgres-network

# Remove stack
docker stack rm postgres

#### Deploy Replication ####

# Deploy primary
cd replication/primary
chmod +x init.sh && ./init.sh
cd ../../

# Deploy replica1
cd replication/replica1
chmod +x init.sh && ./init.sh
cd ../../

#### Deploy services ####
cd services

# Deploy pgpool
cd pgpool
chmod +x init.sh && ./init.sh
cd ../

# Deploy backup
cd backup
chmod +x init.sh && ./init.sh
cd ../

# Deploy pgadmin
cd pgadmin
chmod +x init.sh && ./init.sh
cd ../../