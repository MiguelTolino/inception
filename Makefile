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

SERVER_NAME:= my_nginx:1.0
DB_NAME:= my_mariadb
WP_NAME:= my_wordpress

NGINX:= docker build -f srcs/requirements/nginx -t $(SERVER_NAME) .
MARIADB:= docker build -f srcs/requirements/mariadb -t $(DB_NAME) .
WORDPRESS:= docker build -f srcs/requirements/wordpress -t $(WP_NAME) .

all:
	docker build -f srcs/requirements/nginx/Dockerfile -t $(SERVER_NAME) .
	docker build -f srcs/requirements/mariadb/Dockerfile -t $(DB_NAME) .
	docker build -f srcs/requirements/wordpress/Dockerfile -t $(WP_NAME) .

clean:
	@echo "Cleaning Images"
	sh -c docker rmi -f $(NAMES)

fclean: clean
	@echo "Cleaning and $(NAME)"
	$(RM) $(NAME)

re: fclean all

.PHONY: all fclean clean 
