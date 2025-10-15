# HOW TO

```sh
sudo mkdir -p data/postgres data/pgadmin data/backup
sudo chmod -R 777 data
docker network create --driver overlay postgres-network
docker stack deploy -c compose.yml postgres --detach=false
```

- if you deploy in docker swarm:

```sh
    deploy:
      mode: replicated
      replicas: 1
      update_config:
        order: start-first
        delay: 1s
      labels:
        - "traefik.enable=true"
        - "traefik.docker.lbswarm=true"
        - "traefik.docker.network=traefik-network"

        ## http
        - "traefik.http.routers.pgadmin-http.rule=Host(`pga.secure.domain.com`)" ## <== Change domain
        - "traefik.http.routers.pgadmin-http.entrypoints=web"

        ## Service
        - "traefik.http.services.pgadmin.loadbalancer.server.port=80"

        ## https
        - "traefik.http.routers.pgadmin.rule=Host(`pga.secure.domain.com`)" ## <== Change domain
        - "traefik.http.routers.pgadmin.entrypoints=websecure"
        - "traefik.http.routers.pgadmin.tls=true"
        - "traefik.http.routers.pgadmin.tls.options=default"
        - "traefik.http.routers.pgadmin.tls.certresolver=le"

        ## Middleware for http
        - "traefik.http.middlewares.redirect-to-https.redirectscheme.scheme=https"
        - "traefik.http.routers.pgadmin-http.middlewares=redirect-to-https"

        ## Middleware for https
        - "traefik.http.routers.pgadmin.middlewares=headers-default@file"
    networks:
      - postgres-network
      - traefik-network
```