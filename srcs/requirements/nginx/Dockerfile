ARG VERSION=3.15
FROM alpine:${VERSION}
WORKDIR /root
COPY . .
RUN /bin/sh -c tools/nginx_conf.sh

## Expose Ports
EXPOSE 443
EXPOSE 80

# Start nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]
