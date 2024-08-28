# postgres + pgpool + patroni

## Add port to firewall

```shell
ufw allow 5432
ufw allow 8080
ufw allow 80
```

## Clone Repository

```shell
mkdir -p ~/clone
cd ~/clone
git clone https://github.com/rendyproklamanta/docker-apps.git .
mv postgres /var/lib/psql
rm -rf ./* ./.*
```

## Go to directory

```shell
cd /var/lib/psql
```

## Create directory data and change permission

```shell
mkdir -p /var/lib/psql/data
chmod -R 777 /var/lib/psql/data
```

## Change Password by using text replacing tool

```shell
cd /var/lib/psql
find -type f -exec sed -i 's/POSTGRES_PASSWORD_SET/YOUR_PASSWORD/g' {} +
find -type f -exec sed -i 's/PGADMIN_DEFAULT_PASSWORD_SET/YOUR_PASSWORD/g' {} +
```

## Start command

```shell
chmod +x start.sh && ./start.sh
```

## Web Pgadmin

Access phpPgAdmin from browser <http://localhost:8000>

## Check node

```shell
$ psql -U postgres -h localhost -p 5432 -d postgres

Use password: POSTGRES_PASSWORD_SET

CREATE TABLE users (id SERIAL PRIMARY KEY, email TEXT NOT NULL);
INSERT INTO users (email) VALUES ('john@example.com'), ('michael@example.com'), ('robert@example.com');
SELECT * FROM users;

... repeat couple of times
$ SELECT * FROM users;

$ SHOW pool_nodes;
```
