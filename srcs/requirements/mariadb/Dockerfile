FROM debian:bookworm-slim

RUN apt update && apt install -y mariadb-server

WORKDIR /etc/mysql

COPY ./conf/my.cnf .
COPY ./entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]