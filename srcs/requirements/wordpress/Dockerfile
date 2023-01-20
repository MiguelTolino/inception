ARG version=3.15

FROM alpine:${version}
WORKDIR /root
EXPOSE 9000
COPY . .

RUN apk update && apk upgrade && \
	apk add php7-fpm \
	php7 \
	php7-phar \
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

RUN	adduser -D -g 'www' www && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	sed -i "s/127.0.0.1:9000/9000/g" /etc/php7/php-fpm.d/www.conf

CMD ["tools/wp-script.sh"]
