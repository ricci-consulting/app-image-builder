#!/usr/bin/env bash
set -euxo pipefail

# Check if PHP_VERSION is empty
if [ -z "$PHP_VERSION" ]; then
    echo "Error: PHP_VERSION environment variable is empty"
    exit 1
fi

export DEBIAN_FRONTEND="noninteractive"
export ACCEPT_EULA="Y"

# Add Microsoft repository for SQL Server drivers
curl -sSL -O https://packages.microsoft.com/config/ubuntu/$(grep VERSION_ID /etc/os-release | cut -d '"' -f 2)/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

apt-get update -y
apt-get install -y --no-install-recommends \
    php$PHP_VERSION-dev \
    php$PHP_VERSION-xml \
    unixodbc-dev \
    msodbcsql18 \
    mssql-tools18 \

pecl install sqlsrv
pecl install pdo_sqlsrv

printf "; priority=20\nextension=sqlsrv.so\n" | tee /etc/php/$PHP_VERSION/mods-available/sqlsrv.ini
printf "; priority=30\nextension=pdo_sqlsrv.so\n" | tee /etc/php/$PHP_VERSION/mods-available/pdo_sqlsrv.ini

# Clean up
apt-get purge -y php$PHP_VERSION-dev unixodbc-dev
apt-get autoremove -y
