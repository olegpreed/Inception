all:
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down

start:
	docker-compose -f srcs/docker-compose.yml start mariadb wordpress nginx

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean: down
	sudo rm -rf ~/data/wordpress/*
	sudo rm -rf ~/data/mysql/*

re: clean all
