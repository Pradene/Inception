#!/bin/bash



if [ ! -f /var/www/html/.installed ]; then
	# Download Wordpress
	wp core download --path=/var/www/html --allow-root

	# Create Database
	cd /var/www/html
	wp config create --dbname=$MYSQL_DATABASE --dbhost=mariadb --dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_USER_PASSWORD --allow-root

	#wp db create --allow-root

	# Install Wordpress
	wp core install --allow-root --url=$DOMAIN_NAME --title="Pradene" \
	--admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL --skip-email

	wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --allow-root

	touch /var/www/html/.installed
fi

exec /usr/sbin/php-fpm7.4 -F
