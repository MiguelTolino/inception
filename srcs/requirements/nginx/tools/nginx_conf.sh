# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    nginx_conf.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmateo-t <mmateo-t@student.42madrid>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/27 13:04:47 by mmateo-t          #+#    #+#              #
#    Updated: 2022/07/06 12:53:15 by mmateo-t         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

apk update && apk upgrade && apk add --no-cache openrc nginx
adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
mv /root/conf/nginx.conf /etc/nginx
mv /root/tools/index.html /www/index.html
#openrc && touch /run/openrc/softlevel
#rc-service nginx start
#rc-update add nginx default
