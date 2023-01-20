#!/bin/sh

if [ ! -d /run/mysqld ]; then
	mkdir -p /run/mysqld
fi

chown -R mysql:mysql /run/mysqld

if [ ! -d /var/lib/mysql/mysql ]; then
	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --user=mysql --ldata=/var/lib/mysql
	cat << EOF > "tmp.sql"
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION ;
GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION ;
FLUSH PRIVILEGES ;
DROP DATABASE IF EXISTS test ;
DELETE FROM mysql.user WHERE User='';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DB_NAME CHARACTER SET utf8 COLLATE utf8_general_ci ;
GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;
GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD' ;
FLUSH PRIVILEGES ;
EOF
	/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < tmp.sql
	rm -f tmp.sql
	echo "bind-address=0.0.0.0" >> /etc/my.cnf.d/mariadb-server.cnf
else
	chown -R mysql:mysql /var/lib/mysql
fi

exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0