#!/bin/bash
set -eu

. ./params.conf

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y install docker-ce
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -a -G docker centos

sudo sh -c "curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod 755 /usr/local/bin/docker-compose
