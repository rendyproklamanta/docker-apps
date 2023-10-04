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
      labels:
        - traefik.enable=true
        - traefik.port=3000
        - traefik.tags=traefik-network
        - traefik.docker.network=traefik-network
        - traefik.frontend.rule=Host:domain.com
        - traefik.frontend.entryPoints=http,https
        - traefik.frontend.redirect.entryPoint=https
```