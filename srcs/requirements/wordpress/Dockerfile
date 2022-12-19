ARG version=3.15
FROM alpine:${version}
WORKDIR /www
EXPOSE 9000
RUN apk update && \
	apk add php7 php7-fpm php7-opcache \
	php7-gd php7-mysqli php7-zlib php7-curl \
	wget \
	unzip \
	openrc

RUN	openrc && \	
	touch /run/openrc/softlevel && \
	rc-update add php-fpm7 default

RUN	wget http://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	adduser -D -g 'www' www && \
	chown -R www:www /www && \
	echo "<?php phpinfo(); ?>" >> /www/info.php

CMD /bin/sh
