# Open-Appsec

## Insert Authentication Token

- Copy token from <https://my.openappsec.io/#/cloud/profiles/>

- Insert token in /cp-nano-agent xxxx

```sh
nano conf/supervisord.conf
```

## Deploy test

```shell
docker compose -f docker-compose.yml up -d --force-recreate --build
```

## Test URL

```sh
http://localhost/?shell_cmd=cat/etc/passwd
http://localhost/?id=1%20OR%201%3D1
```
