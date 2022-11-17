ARG VERSION=3.15
FROM alpine:${VERSION}
WORKDIR /build
COPY . .
RUN /bin/sh -c tools/nginx_conf.sh
EXPOSE 9000
#CMD ["nginx"]
