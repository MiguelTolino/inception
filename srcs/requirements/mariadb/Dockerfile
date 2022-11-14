ARG version=3.15
FROM alpine:${version}
COPY conf/mariadb_conf.sh /root
RUN /bin/sh -c /root/mariadb_conf.sh
EXPOSE 3306
#CMD [ "" ]
