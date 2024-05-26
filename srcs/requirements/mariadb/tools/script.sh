#!/bin/bash

set -m

chown -R mysql:mysql /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql

if [ ! -d /var/lib/mysql/$MYSQL_DATABASE ]; then
	mysql_install_db

	mysqld &
       	sleep 2
	
	TMP=tmp.txt
	touch $TMP
	echo "
	FLUSH PRIVILEGES;
	GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
	FLUSH PRIVILEGES;
	CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
	FLUSH PRIVILEGES;
	CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';
	GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
	FLUSH PRIVILEGES;
	" > $TMP

	mysql < $TMP
	rm -f $TMP

	fg %1
	exit 0
fi

mysqld
