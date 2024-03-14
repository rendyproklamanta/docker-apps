- Create Network
```
docker network create --driver overlay db-postgres
```

- Create directory
```
mkdir -p /var/lib/psql/data
mkdir -p /var/lib/psql/data_pgadmin
```

- Change permission writable
```
chmod -R 777 /var/lib/psql/data
chmod -R 777 /var/lib/psql/data_pgadmin
```

- Access phpPgAdmin from browser
http://45.77.174.21:8888