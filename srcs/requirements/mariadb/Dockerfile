ARG version=3.15
FROM alpine:${version}
WORKDIR /root
EXPOSE 3306
COPY . .
RUN	apk update && \
	apk add --no-cache mariadb openrc mariadb-client && \ 
	openrc && \
	touch /run/openrc/softlevel && \
	/etc/init.d/mariadb setup && \
	rc-update add mariadb default && \
	sh conf/mariadb_script.sh

CMD /usr/bin/mysqld_safe --datadir='/var/lib/mysql'

