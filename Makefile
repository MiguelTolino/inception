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

all:
	docker-compose -f $(FILE) -d

clean:
	@echo "Cleaning Images"
	sh -c docker rmi -f $(NAMES)

fclean: clean
	@echo "Cleaning and $(NAME)"
	$(RM) $(NAME)

re: fclean all

.PHONY: all fclean clean 
