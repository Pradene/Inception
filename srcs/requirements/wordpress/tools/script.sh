#!/bin/bash

# Download Wordpress
wp core download --path=/var/www/html --allow-root

# Create Database
cd /var/www/html
wp config create --dbname=$MYSQL_DATABASE --dbhost=mariadb --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PASSWORD --allow-root

#wp db create --allow-root

# Install Wordpress
wp core install --allow-root --url=$DOMAIN_NAME --title="Pradene" \
 --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD \
 --admin_email=$WP_ADMIN_EMAIL --skip-email

exec /usr/sbin/php-fpm7.4 -F
