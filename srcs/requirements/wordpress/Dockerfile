ARG version=3.15
FROM alpine:${version}
WORKDIR /root
EXPOSE 9000
COPY . .

RUN apk update && apk upgrade && \
	apk add php7 php7-fpm php7-opcache \
	php7-gd php7-mysqli php7-zlib php7-curl \
	php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-simplexml \
	wget \
	unzip \
	openrc

RUN	openrc && \
	touch /run/openrc/softlevel && \
	rc-update add php-fpm7 default

RUN	mv conf/www.conf /etc/php7/php-fpm.d/ && \
	mkdir -p /var/www && \
	adduser -D -g 'www' www && \
	chown -R www:www /var/www && \
	cd /var/www && \
	wget http://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	echo "<?php phpinfo(); ?>" >> /var/www/index.php

CMD php-fpm7 -F
