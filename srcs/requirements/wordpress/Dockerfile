FROM debian:bookworm-slim

RUN apt update && apt install -y \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-curl \
    php8.2-gd \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-zip \
    php8.2-intl \
    php8.2-bcmath \
    php8.2-soap \
    curl

COPY entrypoint.sh entrypoint.sh
COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN chmod +x entrypoint.sh

RUN addgroup -g 82 -S www-data ; \
    adduser -u 82 -D -S -G www-data www-data ; true

ENV WP_DIR=/var/www/html
RUN mkdir -p $WP_DIR && \
    chown -R www-data:www-data $WP_DIR && \
    chmod 755 $WP_DIR && \
    chmod 777 /var/log

CMD [ "./entrypoint.sh" ]