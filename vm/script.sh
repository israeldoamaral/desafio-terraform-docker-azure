
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

# Criar arquivos de segredos
echo "GAud4mZby8F3SD6P" > ./mysql_root_password.txt
echo "GAud4mZby8F3SD6P" > ./wordpress_db_password.txt

# Criar arquivo docker-compose.yml
cat <<EOF > docker-compose.yml
version: '3.8'

services:
  wordpress:
    image: wordpress:latest
    restart: always
    ports:
      - "80:80"
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_PASSWORD_FILE: /run/secrets/wordpress_db_password
      WORDPRESS_DB_NAME: wordpress
    volumes:
      - wordpress:/var/www/html
    secrets:
      - wordpress_db_password

  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD_FILE: /run/secrets/mysql_root_password
      MYSQL_DATABASE: wordpress
    volumes:
      - db_data:/var/lib/mysql
    secrets:
      - mysql_root_password

volumes:
  wordpress:
  db_data:

secrets:
  mysql_root_password:
    file: ./mysql_root_password.txt
  wordpress_db_password:
    file: ./wordpress_db_password.txt
EOF

# Subir containers com Docker Compose
sudo docker-compose up -d

# Esperar alguns segundos para garantir que os containers estão inicializados
sleep 30

# Verificar o status dos containers
sudo docker-compose ps
