# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    nginx_conf.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmateo-t <mmateo-t@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/27 13:04:47 by mmateo-t          #+#    #+#              #
#    Updated: 2023/03/05 13:44:38 by mmateo-t         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOMAIN=mmateo.42.fr
USER='www'

# Install dependencies
apk update && apk upgrade && apk add --no-cache openrc nginx openssl

# Move website
mv conf/birdwatching /var/www/birdwatching
chmod -R 755 /var/www/birdwatching

# Set a new nginx configuration
mv conf/default.conf /etc/nginx/http.d
mkdir -p /var/run/nginx

# Create user and group
adduser -D -g $USER $USER
chown -R $USER:$USER /var/lib/nginx

# Configurate nginx as default
openrc
touch /run/openrc/softlevel
rc-update add nginx default

# Generates SSL certificates
mkdir /etc/nginx/certificate
cd /etc/nginx/certificate
openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out nginx-certificate.crt -keyout nginx.key \
-subj "/C=ES/ST=Madrid/L=Madrid/O=42Madrid/OU=42Madrid/CN=mmateo.42.fr"
openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out nginx-certificate2.crt -keyout nginx2.key \
-subj "/C=ES/ST=Madrid/L=Madrid/O=42Madrid/OU=42Madrid/CN=mmateo.42.fr"

