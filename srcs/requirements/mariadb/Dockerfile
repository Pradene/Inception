FROM debian:bullseye

RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install -y \
curl \
mariadb-server \
mariadb-client

RUN mkdir -p /var/run/mysqld

COPY ./conf/my.cnf /etc/mysql/my.cnf

COPY ./tools/script.sh /etc/mysql/script.sh
RUN chmod 777 /etc/mysql/script.sh

EXPOSE 3306

ENTRYPOINT ["/etc/mysql/script.sh"]
