### Edit to deploy spec

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

### Deploy command using swarm
```
docker stack deploy --compose-file docker-compose.yml STACK_NAME
```