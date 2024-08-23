# Redis + Sentinel

## Create dir for redis

```shell
mkdir -p /var/lib/redis
```

## Download from github

- Download source : <https://download-directory.github.io/?url=https%3A%2F%2Fgithub.com%2Frendyproklamanta%2Fdocker-apps%2Ftree%2Fmain%2Fredis>

```shell
unzip redis.zip 
```

## Add port to firewall

```shell
ufw allow 6379
ufw allow 26379
```

## Edit password for redis

```shell
nano redis.conf
```

- Change MY_PASSWORD_REDIS replace with yours

```shell
requirepass MY_PASSWORD_REDIS
masterauth MY_PASSWORD_REDIS
```

## Start redis

```shell
chmod +x start.sh
./start.sh
```

## Test

- Test redis without sentinel

```shell
redis-cli -h 127.0.0.1 -p 6379 -a "<YOUR_PASSWORD>"

REDIS_HOST=redis
REDIS_PASS=<YOUR_PASSWORD>
```

- Test using sentinel : [test.md](test.md)
