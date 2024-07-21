#!/bin/bash

# Atualizar pacotes e sistema
sudo apt-get update
sudo apt-get upgrade -y

# Instalar Docker
sudo apt-get install docker.io -y
sudo systemctl enable --now docker
sudo systemctl start docker

# Instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Criar diretório para arquivos Docker
mkdir -p ~/docker_wordpress
cd ~/docker_wordpress

# Subir containers com Docker Compose
sudo docker-compose up -d
