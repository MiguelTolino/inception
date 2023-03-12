# inception
This project aims to broaden your knowledge of system administration by using Docker.
I virtualized several Docker images, creating them in your new personal virtual machine.

## About
This project consists in having you set up a small infrastructure composed of different services under specific rules.
The whole project has to be done in a virtual machine. You have to use docker-compose.

![Infraestructure](images/architecture.png)

## Docker containers

- NGINX with TLSv1.2 or TLSv1.3 only.
- WordPress + php-fpm (it must be installed and configured) only without nginx.
- contains MariaDB only without nginx.

## Prerequisites

- Docker
- Docker Compose
- Linux VM

## Usage

- Build the images and deploy the infrastructure:

```
make
```

- Stop and remove containers, remove images, volumes and network:

```
make fclean
```

- Open your favourite browser and go to:
```
https://localhost
```

You can see your Wordpress website