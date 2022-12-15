ARG version=3.15
FROM alpine:${version}
WORKDIR /root
COPY . .
RUN /bin/sh -c /root/conf/mariadb_conf.sh
EXPOSE 3306
#ENTRYPOINT mysqld -u root
