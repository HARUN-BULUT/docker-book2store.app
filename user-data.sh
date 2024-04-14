#!/bin/bash

hostnamectl set-hostname docker_instance
dnf update -y
dnf install git -y
dnf install docker -y
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user
# install docker-compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
cd /home/ec2-user && git clone https://github.com/HARUN-BULUT/docker-book2store.app.git
cd docker-book2store.app
docker-compose up