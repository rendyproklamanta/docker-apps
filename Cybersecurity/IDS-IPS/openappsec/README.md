# Deploy Open-Appsec

```shell
docker compose -f docker-compose.yml up -d --force-recreate --build
```

## TEST

```sh
http://localhost/?shell_cmd=cat/etc/passwd
http://localhost/?id=1%20OR%201%3D1
```
