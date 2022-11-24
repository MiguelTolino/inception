ARG VERSION=3.15
FROM alpine:${VERSION}
WORKDIR /root
COPY . .
RUN /bin/sh -c tools/nginx_conf.sh
EXPOSE 9000
# Start nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]
