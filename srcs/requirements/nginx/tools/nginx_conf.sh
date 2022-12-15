# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    nginx_conf.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmateo-t <mmateo-t@student.42madrid>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/27 13:04:47 by mmateo-t          #+#    #+#              #
#    Updated: 2022/12/03 22:28:59 by mmateo-t         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOMAIN=mmateo.42.es

# Install dependencies
apk update && apk upgrade && apk add --no-cache openrc nginx openssl

# Create user and group
adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www

# Set a new nginx configuration
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
cp -f conf/nginx.conf /etc/nginx/nginx.conf
mkdir -p /www/$DOMAIN 
cp -r conf/www/* /www/$DOMAIN

# Configurate nginx as default
openrc
touch /run/openrc/softlevel
rc-update add nginx default

# Generates SSL certificates
mkdir /etc/nginx/certificate
cd /etc/nginx/certificate
openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out nginx-certificate.crt -keyout nginx.key \
-subj "/C=ES/ST=Madrid/L=Madrid/O=42Madrid/OU=42Madrid/CN=mmateo.42.es"
