#!/usr/bin/env bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update -y 
apt-get install -y --no-install-recommends openssh-server openssh-client
