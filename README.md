# Docker Commands

- Docker compose

```shell
Up :
docker compose -f docker-compose.development.yml up -d --force-recreate

Down :
docker compose down
```

- Docker build and push to hub

```shell
docker build -t randyproxz/php7.4-fpm-alpine -f Dockerfile.php74 .

docker push randyproxz/php7.4-fpm-alpine
```

## Docker Swarm Commands

- docker-compose.yml deploy spec mandatory

```shell
deploy:
   mode: replicated
   replicas: 2
   update_config:
      order: start-first
      delay: 1s
   resources:
      limits:
         cpus: "0.5"
         memory: 500M
      # (optional) if you need assign reservation resource for the container
      # reservations:
      #    cpus: "0.1"
      #    memory: 100M
   restart_policy:
      condition: on-failure
      delay: 5s
      window: 120s
      max_attempts: 2
```

- Deploy swarm stack

```shell
docker stack deploy --compose-file docker-compose.yml STACK_NAME
```

## Clone specific directory only

```shell
mkdir -p ~/clone
cd ~/clone
git clone https://github.com/rendyproklamanta/docker-apps.git .
mv directory /var/lib
cd /var/lib/directory
rm -rf ~/clone
```
