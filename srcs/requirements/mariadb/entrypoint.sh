#!/bin/bash
mysqld &
sleep 3

if ! mariadb -u root -sse "SHOW DATABASES LIKE '${DB_NAME}';" | grep -q "${DB_NAME}"; then
    mariadb -u root <<EOF
        CREATE DATABASE IF NOT EXISTS ${DB_NAME};
EOF
fi

if ! mariadb -u root -sse "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '${DB_USER}');" | grep -q 1; then
    mariadb -u root <<EOF
        CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
        GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' WITH GRANT OPTION; 
        GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'localhost' WITH GRANT OPTION; 
        FLUSH PRIVILEGES;
EOF
fi

killall mysqld
mysqld