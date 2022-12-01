# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    nginx_conf.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmateo-t <mmateo-t@student.42madrid>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/27 13:04:47 by mmateo-t          #+#    #+#              #
#    Updated: 2022/12/01 17:37:58 by mmateo-t         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOMAIN=mmateo.42.es

apk update && apk upgrade && apk add --no-cache openrc nginx
adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
cp -f conf/nginx.conf /etc/nginx/nginx.conf
mkdir /www/$DOMAIN
cp -r conf/www/* /www/$DOMAIN
openrc
touch /run/openrc/softlevel
rc-service nginx start
rc-update add nginx default
