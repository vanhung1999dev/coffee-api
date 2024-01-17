# coffee-api
Go restful api


### Install Packages
- [golang-migrate](https://github.com/golang-migrate/migrate/blob/master/cmd/migrate/README.md)
- [sqlx-cli](https://formulae.brew.sh/formula/sqlx-cli) for Macos

## Docker Volume
- create Docker volume by cmd `docker volume create postgresDb` or run `make volume`


## POSTGRES
- docker exec -it container_name /bin/sh 
- psql -U root -W => for sign in
- \c name_database => switch to database

- **\dt** => show table
- **\dt+** => show size and desc