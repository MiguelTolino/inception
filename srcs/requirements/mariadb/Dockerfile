ARG version=3.15
FROM alpine:${version}
EXPOSE 3306
COPY . .

RUN apk add --no-cache mariadb mariadb-common mariadb-openrc mariadb-client openrc &&\
	mkdir /run/openrc && touch /run/openrc/softlevel

CMD ["/conf/mariadb_script.sh"]