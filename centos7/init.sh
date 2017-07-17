#!/bin/bash
set -eu

sudo yum -y update
sudo localectl set-locale LANG=ja_JP.utf8
sudo localectl set-keymap jp106
sudo timedatectl set-timezone Asia/Tokyo

sudo systemctl stop postfix.service
sudo systemctl disable postfix.service

sudo sed -i -e "s/SELINUX=enforcing/SELINUX=disabled/" /etc/sysconfig/selinux

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y install docker-ce
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -a -G docker centos

sudo sh -c "curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod 755 /usr/local/bin/docker-compose
