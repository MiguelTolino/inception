# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmateo-t <mmateo-t@student.42madrid>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/27 12:59:41 by mmateo-t          #+#    #+#              #
#    Updated: 2022/12/19 20:47:13 by mmateo-t         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FILE:= srcs/docker-compose.yml

all: up

up:
	$(shell docker-compose -f $(FILE) -p "inception" up -d)

down:
	$(shell docker-compose -f $(FILE) -p "inception" down)

.PHONY: all up down
