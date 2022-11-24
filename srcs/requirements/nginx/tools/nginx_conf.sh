# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    nginx_conf.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmateo-t <mmateo-t@student.42madrid>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/27 13:04:47 by mmateo-t          #+#    #+#              #
#    Updated: 2022/11/24 18:43:19 by mmateo-t         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOMAIN=mmateo.42.es

apk update && apk upgrade && apk add --no-cache openrc nginx
adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
cp -r conf/nginx.conf /etc/nginx/nginx.conf
cp -r www/index.html /www/index.html
openrc
touch /run/openrc/softlevel
rc-service nginx start
rc-update add nginx default
