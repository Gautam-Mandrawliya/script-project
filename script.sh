#!/bin/bash

# Create functions
function Install() { 
# Check if Docker is installed
if ! command -v docker &> /dev/null; 
then
	    echo -e "\033[0;31m Docker is not installed. Installing Docker..."
          # Docker installation and start and enable docker service
	    yum update -y
	    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 
	    yum install -y docker-ce
	    systemctl start docker
	    systemctl enable docker
	    echo -e "\033[0;32m Docker is successfully installed and service start and enable at boot time"
else
       	    echo -e "\033[0;33m Docker is allready installed."	

fi

# Check if Docker Compose is installed
if ! command -v docker compose &> /dev/null; 
then
	    echo -e "\033[0;31m Docker Compose is not installed. Installing Docker Compose..."
	  # Docker Compose Installation
	    yum install docker-compose-plugin -y
    	    docker compose version
	    echo -e "\033[0;32m Docker Compse is successfully installed."
else
	    echo -e "\033[0;33m Docker-Compose is allready installed."
fi

echo -e "\033[0;33m Creating WordPress site: example.com"

# Create docker-compose.yml file
cat > docker-compose.yml << EOF
version: '3.9'

services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
       MYSQL_ROOT_PASSWORD: abhay2018
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD: wordpress
    networks:
       - wordpress-net

  wordpress:
    depends_on:
    - db
    image: wordpress:latest
    ports:
      - "80:80"
    restart: always
    volumes:
      - ./wp-content:/var/www/html/wp-content
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: wordpress
      WORDPRESS_DB_NAME: wordpress
    networks:
      - wordpress-net

networks:
  wordpress-net:
volumes:
  db_data:
EOF

# Create /etc/hosts entry
	echo "127.0.0.1   example.com" | sudo tee -a /etc/hosts >/dev/null

# Start the containers
	docker compose up -d
	Status
	docker container ls
}

function Status() {
	until $(curl --output /dev/null --silent --head --fail  http://example.com);
	do
		echo -e "\033[0;33m Waiting for the site to be up..."
		sleep 5
	done
		echo -e "\033[0;32m The site example.com is up and healthy."	
		echo -e "\033[0;32m Please open http://example.com in your browser."
}

function Start() {
# Additional subcommand: Start the site
	docker compose start
	Status
	echo -e "\033[0;32m The site example.com has been started."
}

function Stop(){
# Additional subcommand: Stop the site
	docker compose stop
	echo -e "\033[0;32m The site example.com has been stopped."
}

function Remove() {
# Additional subcommand: Delete the site
	docker compose down --volumes
	sudo sed -i "/example.com/d" /etc/hosts
	echo -e "\033[0;32m The site example.com  has been deleted from the /etc/hosts file."
#	rm -rvf docker-compose.yml wp-content
}

# Execute the program
if [[ "$1" == "start" ]]
then
	Start
elif [[ "$1" == "stop" ]]
then
	Stop
elif [[ "$1" == "delete" ]]
then
	Remove
else
	Install
fi
