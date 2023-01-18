ARG version=3.15

FROM alpine:${version}
WORKDIR /root
EXPOSE 9000
COPY . .

RUN apk update && apk upgrade && \
	apk add php7-fpm \
	php7-soap \
	php7-openssl \
	php7-gmp \
	php7-pdo_odbc \
	php7-dom \
	php7-pdo \
	php7-zip \
	php7-apcu \
	php7-bcmath \
	php7-odbc \
	php7-pdo_mysql \
	php7-gettext \
	php7-xmlreader \
	php7-xmlrpc \
	php7-bz2 \
	php7-iconv \
	php7-pdo_dblib \
	php7-common \
	php7-session \
	php7-json \
	php7-gd \
	php7-curl \
	php7-xml \
	php7-mysqli \
	php7-imap \
	php7-cgi \
	fcgi \
	php7-posix \
	php7-mcrypt \
	php7-ldap \
	php7-ctype \
	php7-simplexml \
	wget \
	unzip \
	openrc \
	tzdata

RUN	openrc && \
	touch /run/openrc/softlevel && \
	rc-update add php-fpm7 default

RUN	mkdir -p /var/www && \
	adduser -D -g 'www' www && \
	cd /var/www && \
	wget http://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	echo "<?php phpinfo(); ?>" > /var/www/index.php && \
	chown -R www:www /var/www && \
	sh -c /root/conf/php7.sh && \
	mv /root/conf/wp-config.php /var/www/wordpress

CMD php-fpm7 -F
