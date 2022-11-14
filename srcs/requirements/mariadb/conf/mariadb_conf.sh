# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mariadb_conf.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmateo-t <mmateo-t@student.42madrid>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/27 13:04:47 by mmateo-t          #+#    #+#              #
#    Updated: 2022/06/27 14:55:15 by mmateo-t         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

apk update && apk upgrade
apk add --no-cache mariadb openrc
openrc && touch /run/openrc/softlevel
/etc/init.d/mariadb setup
rc-service mariadb start
rc-update add mariadb default