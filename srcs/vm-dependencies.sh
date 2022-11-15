# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    vm-script.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmateo-t <mmateo-t@student.42madrid>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/27 12:59:32 by mmateo-t          #+#    #+#              #
#    Updated: 2022/11/15 19:30:08 by mmateo-t         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# Linux development dependencies
sudo apt-get update
sudo apt-get -y install dkms build-essential linux-headers-$VERSION

# Docker installation
sudo apt install -y vim make \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker run hello-world
