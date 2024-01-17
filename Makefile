DB_DOCKER_CONTAINER=coffee_db
BINARY_NAME=coffeeapi
POSTGRES_VOLUME=postgresDb

volume:
	docker volume create ${POSTGRES_VOLUME}

postgres:
	docker rm -f ${DB_DOCKER_CONTAINER}
	docker run --name ${DB_DOCKER_CONTAINER} -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=1234 -v ${POSTGRES_VOLUME}:/var/lib/postgresql/data -d postgres:12-alpine

start_docker:
	docker start ${DB_DOCKER_CONTAINER}

stop_docker:
	@echo "stopping other docker container....."
	if [$$(docker ps -q)]; then \
		echo "found and stopped container..."; \
		docker stop $$(docker ps -q); \
	else \
		echo "no active container found..."; \
	fi

create_db:
	docker exec -it ${DB_DOCKER_CONTAINER} createdb --username=root --owner=root coffee_db

create_migration:
	sqlx migrate add -r init

migrate_up:
	sqlx migrate run

migrate_down:
	sqlx migrate revert

run:
	go run cmd/server/main.go