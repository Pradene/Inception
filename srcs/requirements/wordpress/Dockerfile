FROM debian:bullseye

RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install -y \
curl \
php7.4 \
php7.4-fpm \
php7.4-mysql \
mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& php wp-cli.phar --info \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php /var/www/html

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/script.sh /script.sh
RUN chmod +x /script.sh

EXPOSE 9000

ENTRYPOINT ["/script.sh"]
