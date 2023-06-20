# **Scripts for WordPress Site**
Designed script - **script.sh**, and the script has been tested on Amazon AMI Linux, RHEL-9 Linux, and locally on CentOS-8 machines. The script execution results were successful.

**If installing Docker in Amazon Linux AMI and add these commands in the script file and remove or comment on the commands for the process of RHEL-9 and CentOS-8 Linux machine.**

yum install -y docker
            
**Install Docker Compose**

DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}

mkdir -p $DOCKER_CONFIG/cli-plugins

curl -SL https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose

chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose


                  
# **Executing Process of the Script:**

# **script.sh**
1. Download the script and assign execute permission to the script file.

  chmod +x script.sh
  
2. Install the script.

  ./script.sh
  
3. Open wesite on web-browsor like http://example.com

4. Sub-commands:

i. Stop the program and website.

  ./script stop
  
ii. Start the program or website.

  ./script start
  
iii. Remove/Delete the program or website.

  ./script.sh delete
  
**Thank you**
