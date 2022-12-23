# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    nginx_conf.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmateo-t <mmateo-t@student.42madrid>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/27 13:04:47 by mmateo-t          #+#    #+#              #
#    Updated: 2022/12/23 19:28:13 by mmateo-t         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOMAIN=mmateo.42.es
BIRDS_DOMAIN=birds.com
LOCATION='/www'
USER='www'

# Install dependencies
apk update && apk upgrade && apk add --no-cache openrc nginx openssl

# Set a new nginx configuration
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
cp conf/nginx.conf /etc/nginx/nginx.conf
cp -rf conf/www $LOCATION
mkdir -p /var/run/nginx


# Create user and group
adduser -D -g $USER $USER
chown -R $USER:$USER /var/lib/nginx
chown -R $USER:$USER $LOCATION

# Configurate nginx as default
openrc
touch /run/openrc/softlevel
rc-update add nginx default

# Generates SSL certificates
mkdir /etc/nginx/certificate
cd /etc/nginx/certificate
openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out nginx-certificate.crt -keyout nginx.key \
-subj "/C=ES/ST=Madrid/L=Madrid/O=42Madrid/OU=42Madrid/CN=mmateo.42.es"
openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out nginx-certificate2.crt -keyout nginx2.key \
-subj "/C=ES/ST=Madrid/L=Madrid/O=42Madrid/OU=42Madrid/CN=mmateo.42.es"
