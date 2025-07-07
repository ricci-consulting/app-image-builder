#!/usr/bin/env bash
set -euxo pipefail

apt-get install -y --no-install-recommends less

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
