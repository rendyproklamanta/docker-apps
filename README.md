## Docker Commands

- Docker compose
```
Up :
docker compose -f docker-compose.development.yml up -d --force-recreate

Down :
docker compose down
```

- Docker build and push to hub

```
docker build -t randyproxz/php7.4-fpm-alpine -f Dockerfile.php74 .

docker push randyproxz/php7.4-fpm-alpine
```

## Docker Swarm Commands

- docker-compose.yml deploy spec mandatory

```
deploy:
  mode: replicated
  replicas: 2
  update_config:
    order: start-first
    delay: 1s
  restart_policy:
    condition: any
    delay: 10s
    max_attempts: 3
```

- Deploy swarm stack
```
docker stack deploy --compose-file docker-compose.yml STACK_NAME
```

