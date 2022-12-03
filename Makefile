# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmateo-t <mmateo-t@student.42madrid>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/27 12:59:41 by mmateo-t          #+#    #+#              #
#    Updated: 2022/07/06 11:47:39 by mmateo-t         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FILE:= srcs/docker-compose.yml
IMAGES:= $(shell docker images -aq)

all: up

up:
	$(shell docker compose -f $(FILE) -p "inception" up -d)

down:
	$(shell docker compose -f $(FILE) -p "inception" down)

clean:
	@echo "Cleaning Images"
	$(shell /bin/bash -c docker rmi -f $(IMAGES))

fclean: clean
	@echo "Cleaning and $(NAME)"

re: fclean all

.PHONY: all fclean clean 
