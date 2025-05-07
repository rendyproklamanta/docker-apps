# Build and Push to container registry

## Upload to docker hub

- Login

```shell
docker login
```

- Build

```shell
docker build -t username/php7.4:fpm-alpine -f Dockerfile.php74-fpm .
```

- Push

```shell
docker push username/php7.4:fpm-alpine
```

## Upload to ghcr (github)

- Create token

```shell
> https://github.com/settings/tokens
> Read/write packages : checklist
```

- Login auth

```shell
echo ghp_token | docker login ghcr.io --username gh_username --password-stdin
```

- Build

```shell
docker build -t ghcr.io/gh_username/php7.4:fpm-alpine -f Dockerfile.php74-fpm .
```

- Push

```shell
docker push ghcr.io/gh_username/php7.4:fpm-alpine
```
