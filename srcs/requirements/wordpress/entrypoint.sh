#!/bin/bash
cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

if [ ! -f wp-config.php ]; then
    echo "wp-config.php not found, creating..."
    wp config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST
else
    echo "wp-config.php already exists, skipping creation."
fi

wp core install --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL
su www-data -s /bin/sh -c "wp user create $WP_EDITOR_USER $WP_EDITOR_EMAIL --role=editor --user_pass=$WP_EDITOR_PASS"

exec su www-data -s /bin/sh -c "php-fpm8.2 -F"