ARG version=3.15
FROM alpine:${version}
WORKDIR /root
EXPOSE 3306
COPY . .
RUN	apk update && apk upgrade && \
	apk add --no-cache mariadb openrc mariadb-client && \ 
	openrc && \
	touch /run/openrc/softlevel && \
	/etc/init.d/mariadb setup && \
	rc-update add mariadb default

CMD /usr/bin/mariadbd -u mysql

