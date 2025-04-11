COMPOSE=docker compose -f srcs/docker-compose.yml

up:
	@mkdir -p ~/data/db ~/data/web
	$(COMPOSE) up --build -d
stop:
	$(COMPOSE) stop
down:
	$(COMPOSE) down
log:
	$(COMPOSE) logs -f