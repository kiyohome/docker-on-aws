#!/bin/bash
set -euo pipefail

. ./params.conf

echo "install awscli"
sudo curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
sudo python get-pip.py
sudo pip install awscli
