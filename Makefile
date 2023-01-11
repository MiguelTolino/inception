# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmateo-t <mmateo-t@student.42madrid>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/27 12:59:41 by mmateo-t          #+#    #+#              #
#    Updated: 2023/01/11 22:05:25 by mmateo-t         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FILE:= srcs/docker-compose.yml
NAME:= up
DOMAIN:= mmateo.42.es
BIRDS:= birds.com

# Colors
GREEN=\033[0;32m
RED=\033[0;31m
BLUE=\033[0;34m
END=\033[0m

all: $(NAME)

$(NAME):
	$(shell docker compose -f $(FILE) -p "inception" up -d)

host:
	$(shell echo "$(DOMAIN) 127.0.0.1" >> /etc/hosts)
	$(shell echo "$(BIRDS) 127.0.0.1" >> /etc/hosts)
	@echo "$(GREEN)Domains added to hosts$(END)"

clean:
	$(shell docker compose -f $(FILE) -p "inception" down)

fclean: clean
	@echo "$(BLUE)Deleting docker images$(END)"
	@docker rmi -f  $$(docker images -aq)
	@echo "$(BLUE)Deleting docker volumes$(END)"
	@docker volume prune -f
	@echo "$(BLUE)Deleting docker networks$(END)"
	@docker network prune -f

re: fclean all

.PHONY: all $(NAME) clean fclean re host
