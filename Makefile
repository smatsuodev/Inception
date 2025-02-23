COMPOSE=docker compose -f srcs/docker-compose.yml

up:
	$(COMPOSE) up --build -d
stop:
	$(COMPOSE) stop
down:
	$(COMPOSE) down
log:
	$(COMPOSE) logs -f