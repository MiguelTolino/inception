ARG version=3.15
FROM alpine:${version}
WORKDIR /build
COPY . .
RUN /bin/sh -c tools/nginx_conf.sh
EXPOSE 8080
