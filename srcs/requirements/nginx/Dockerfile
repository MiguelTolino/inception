ARG version=3.15
FROM alpine:${version}
COPY . /root
VOLUME ["/sys/fs/cgroup"]
RUN /bin/sh -c /root/tools/nginx_conf.sh
EXPOSE 8080
#CMD [ "" ]
