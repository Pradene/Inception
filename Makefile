all: build up

up:
	cd srcs; docker compose up

down:
	cd srcs; docker compose down

stop:
	cd srcs; docker compose stop

restart:
	cd srcs; docker compose restart

build:
	cd srcs; docker compose build

clean: stop
	docker rmi -f $$(docker images -q)
	docker volume rm $$(docker volume ls -q)
