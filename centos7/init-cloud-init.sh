#!/bin/bash
set -euo pipefail

. ./params.conf

echo "set locale on cloud-init"
sed -i.bak -e 's/^ - locale$/ - locale: ja_JP.utf8/' /etc/cloud/cloud.cfg

echo "enable ssh_pwauth on cloud-init"
sed -i.bak -e 's/^ssh_pwauth:.*$/ssh_pwauth:   yes/' \
           -e 's/lock_passwd:.*true/lock_passwd: false/' \
  /etc/cloud/cloud.cfg

sed -i.bak -e 's/^#Protocol 2/Protocol 2/' \
           -e 's/^#RhostsRSAAuthentication no/RhostsRSAAuthentication no/' \
           -e 's/^#HostbasedAuthentication no/HostbasedAuthentication no/' \
           -e 's/^#PermitEmptyPasswords no/PermitEmptyPasswords no/' \
           -e 's/^PasswordAuthentication no/PasswordAuthentication yes/' \
           -e 's/^#RSAAuthentication yes/RSAAuthentication no/' \
           -e 's/^#PubkeyAuthentication yes/PubkeyAuthentication yes/' \
           -e 's/^#PermitRootLogin yes/PermitRootLogin no/' \
           -e 's/^#AddressFamily any/AddressFamily inet/' \
  /etc/ssh/sshd_config

systemctl restart sshd.service
