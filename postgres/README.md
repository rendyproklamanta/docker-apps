# postgres + pgpool + patroni

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

- Create directory data and change permission

```shell
mkdir -p /var/lib/psql/data
chmod -R 777 /var/lib/psql/data
```

- Change Password by using text replacing tool

```shell
cd /var/lib/psql
find -type f -exec sed -i 's/POSTGRES_PASSWORD_SET/YOUR_PASSWORD/g' {} +
find -type f -exec sed -i 's/PGADMIN_DEFAULT_PASSWORD_SET/YOUR_PASSWORD/g' {} +
```

- Start command

```shell
chmod +x start.sh && ./start.sh
```

- Access phpPgAdmin from browser <http://localhost:8000>
