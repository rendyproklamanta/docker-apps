# postgres + pgpool

- Create Network

```shell
docker network create --driver overlay postgres-network
```

- Download source

```shell
mkdir -p /var/lib/psql
cd /var/lib/psql
```

- Download source
<https://download-directory.github.io/?url=https%3A%2F%2Fgithub.com%2Frendyproklamanta%2Fdocker-apps%2Ftree%2Fmain%2Fpostgres>

```shell
unzip postgres.zip 
```

- Create directory and change permission

```shell
mkdir -p /var/lib/psql/data
chmod -R 777 /var/lib/psql/data
```

- Access phpPgAdmin from browser <http://localhost:8000>
