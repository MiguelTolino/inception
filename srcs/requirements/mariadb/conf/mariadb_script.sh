#!/bin/sh

rc-service mariadb start

mysql -u root < conf/setup.sql
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb restart
