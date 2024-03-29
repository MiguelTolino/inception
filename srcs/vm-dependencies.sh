# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    vm-dependencies.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmateo-t <mmateo-t@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/27 12:59:32 by mmateo-t          #+#    #+#              #
#    Updated: 2023/01/11 22:16:41 by mmateo-t         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# Linux development dependencies
sudo apt-get update
sudo apt-get -y install dkms build-essential linux-headers-$VERSION vim make git

# Docker installation
sudo apt install -y \
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
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service