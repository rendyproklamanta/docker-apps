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

- Deploy spec

```
    deploy:
      mode: global
      # mode: replicated
      # replicas: 3
      update_config:
        parallelism: 0
        order: start-first
        failure_action: rollback
        delay: 40s
```

- Deploy stack
```
docker stack deploy --compose-file docker-compose.yml STACK_NAME
```

