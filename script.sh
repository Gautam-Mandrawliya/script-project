#!/bin/bash

# Create functions
function DockerPlugins() { 
# Check if Docker is installed
if ! command -v docker &> /dev/null; 
then
	    echo  "Docker is not installed. Installing Docker..."
          # Docker installation and start and enable docker service
	    sudo yum update -y
	    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
	    sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	    sudo usermod -a -G docker $USER
	    sudo systemctl enable --now docker
	    echo  "Docker is successfully install, configured and services start or enabled at boot time"
fi

# Check if Docker Compose is installed
if ! command -v docker compose &> /dev/null; 
then
	    echo "Docker Compose is not installed. Installing Docker Compose..."
	  # Docker Compose Installation
	    sudo yum install docker-compose-plugin -y
	    docker compose version
	    echo "Docker-Compose plugin is successfully installed."
fi
}

function SiteConfigure() {
echo "Creating WordPress site: example.com"

# Create /etc/hosts entry
	echo "127.0.0.1   example.com" | sudo tee -a /etc/hosts >/dev/null
	
# Access and add rules in the firewall
	sudo firewall-cmd --add-port={8080/tcp,80/tcp,3306/tcp} --permanent
	sudo firewall-cmd --reload

# Start the containers
	sudo docker compose up -d
	Status
	sudo docker container ls
}

function Status() {
	until $(curl --output /dev/null --silent --head --fail  http://example.com);
	do
		echo "Waiting for the site to be up..."
		sleep 5
	done
		echo "The site example.com is up and healthy. Please open http://example.com in your browser."	
}

function Start() {
# Additional subcommand: Start the site
	sudo docker compose start
	Status
	echo "The site example.com has been started."
}

function Stop(){
# Additional subcommand: Stop the site
	sudo docker compose stop
	echo "The site example.com has been stopped."
}

function Remove() {
# Additional subcommand: Delete the site
	sudo docker compose down --volumes
	sudo sed -i "/example.com/d" /etc/hosts
	echo "The site example.com  has been deleted from the /etc/hosts file."
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
	DockerPlugins
	SiteConfigure
fi
