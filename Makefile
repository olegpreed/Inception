all:
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down

start:
	docker-compose -f srcs/docker-compose.yml start mariadb wordpress nginx

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	docker-compose -f srcs/docker-compose.yml down -v

fclean:
	docker-compose -f srcs/docker-compose.yml down --rmi all

re: clean all
