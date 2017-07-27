#!/bin/bash
set -euo pipefail

./init-os.sh

./init-cloud-init.sh

./install-awscli.sh

./install-docker.sh