#! /bin/sh
sudo apt-get update && sudo apt-get upgrade -y 
curl -fsSL https://get.docker.com -o get-docker.sh
sudo apt-get install docker-compose -y
sudo sh get-docker.sh
sudo usermod -aG docker `whoami`