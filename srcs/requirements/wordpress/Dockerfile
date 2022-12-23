ARG version=3.15
FROM alpine:${version}
WORKDIR /root
EXPOSE 9000
COPY . .

RUN apk update && apk upgrade && \
	apk add php7 php7-fpm php7-opcache \
	php7-gd php7-mysqli php7-zlib php7-curl \
	wget \
	unzip \
	openrc

RUN	openrc && \
	touch /run/openrc/softlevel && \
	rc-update add php-fpm7 default

RUN	mv conf/www.conf /etc/php7/php-fpm.d/ && \
	mkdir -p /var/www && \
	adduser -D -g 'www' www && \
	cd /var/www && \
	wget http://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	echo "<?php phpinfo(); ?>" >> /var/www/index.php

CMD php-fpm7 -F
