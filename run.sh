#!/bin/sh

sudo apt-get update -y
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \ 
   $(lsb_release -cs) \
   stable" -y
sudo apt-get update -y
sudo apt-get install docker-ce -y
apt-cache madison docker-ce
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
mkdir tugas/
cd tugas/
wget https://tugasdoni.s3.amazonaws.com/docker-compose.yml
wget https://tugasdoni.s3.amazonaws.com/nginx.conf
echo "user=adsis" >> .env
echo "dBaseName=adsis-db" >> .env
echo "dbPass=adsis-pass" >> .env
echo "rootPass=adsis-root" >> .env
echo "pmaHost=db" >> .env
sudo docker-compose up
