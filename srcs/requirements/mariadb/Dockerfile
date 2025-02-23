FROM debian:bookworm-slim

RUN apt update && apt install -y mariadb-server

WORKDIR /etc/mysql

COPY ./conf/my.cnf ./my.cnf

ENTRYPOINT ["mysqld"]