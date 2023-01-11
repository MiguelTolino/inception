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

RUN	sh -c conf/php7.sh && \
	mkdir -p /www && \
	adduser -D -g 'www' www && \
	cd /www && \
	wget http://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	echo "<?php phpinfo(); ?>" > /www/index.php && \
	chown -R www:www /www

RUN mv /www/wordpress/wp-config-sample.php /www/wordpress/wp-config.php && \
	sed -i "s/database_name_here/${WP_DATABASE}/g" /www/wordpress/wp-config.php && \
	sed -i "s/username_here/${WP_USER}/g" /www/wordpress/wp-config.php && \
	sed -i "s/password_here/${WP_PASSWORD}/g" /www/wordpress/wp-config.php

CMD php-fpm7 -F
