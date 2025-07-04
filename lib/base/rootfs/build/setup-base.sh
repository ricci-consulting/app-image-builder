#!/usr/bin/env bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

rm -f /etc/apt/apt.conf.d/docker-clean

apt-get update -y 
apt-get install -y --no-install-recommends git curl ca-certificates

groupmod -n app ubuntu
usermod -l app ubuntu