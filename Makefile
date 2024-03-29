# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmateo-t <mmateo-t@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/27 12:59:41 by mmateo-t          #+#    #+#              #
#    Updated: 2023/03/04 20:35:49 by mmateo-t         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FILE:= srcs/docker-compose.yml
NAME:= up
DOMAIN:= mmateo.42.fr
BIRDS:= birds.com

# Colors
GREEN=\033[0;32m
RED=\033[0;31m
BLUE=\033[0;34m
END=\033[0m

all: $(NAME)

$(NAME):
	@ docker-compose -f $(FILE) -p "inception" up -d

host:
	@ echo "127.0.0.1	$(DOMAIN)" >> /etc/hosts
	@ echo "$(GREEN)Domains added to hosts$(END)"

clean:
	@ docker-compose -f $(FILE) -p "inception" down

fclean: clean
	@echo "$(BLUE)Deleting docker images$(END)"
	@docker rmi -f  $$(docker images -aq)
	@echo "$(BLUE)Deleting docker volumes$(END)"
	@docker volume prune -f
	@echo "$(BLUE)Deleting docker networks$(END)"
	@docker network prune -f

reload: 
	@ docker-compose -f $(FILE) up --build

re: fclean all

.PHONY: all $(NAME) clean fclean re host
