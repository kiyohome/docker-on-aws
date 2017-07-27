#!/bin/bash
set -euo pipefail

. ./params.conf

echo "update package"
sudo yum -y update

echo "set locale and timezone"
sudo localectl set-locale LANG=ja_JP.utf8
sudo localectl set-keymap jp106
sudo timedatectl set-timezone Asia/Tokyo

echo "disable selinux"
sudo setenforce 0
sudo sed -i.bak -e "s/SELINUX=enforcing/SELINUX=disabled/" /etc/sysconfig/selinux

echo "disable postfix"
sudo systemctl stop postfix.service
sudo systemctl disable postfix.service

echo "set password to centos"
sudo passwd centos
