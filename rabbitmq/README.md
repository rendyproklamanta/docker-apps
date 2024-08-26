# RabbitMQ + haproxy

## Create network

```shell
docker network create --driver overlay rabbitmq-network
```

## Add port to firewall

```shell
ufw allow 5672
ufw allow 15672
```

## Clone Repository

```shell
mkdir -p ~/clone
cd ~/clone
git clone https://github.com/rendyproklamanta/docker-apps.git .
mv rabbitmq /var/lib/rabbitmq
rm -rf ./* ./.*
```

## Go to directory

```shell
cd /var/lib/rabbitmq
```

## Editing environment

```shell
nano .env
```

## Start command

```shell
docker stack rm rabbitmq && docker stack deploy --compose-file docker-compose.yml --detach=false rabbitmq
```

## Web management  UI

<http://localhost:15672>

## RabbitMQ credential

```shell
user: adminrmq
pass: rabbitmq_cls
```
