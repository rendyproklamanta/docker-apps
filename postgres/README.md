- Create Network
```
docker network create --driver overlay db-postgres
```

- Create directory and change permission
```
mkdir -p /var/lib/psql/data
chmod -R 777 /var/lib/psql/data
```

- Access phpPgAdmin from browser
http://localhost:8000