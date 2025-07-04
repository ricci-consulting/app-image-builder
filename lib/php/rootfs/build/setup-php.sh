#!/usr/bin/env bash
set -euxo pipefail

# Check if PHP_VERSION is empty
if [ -z "$PHP_VERSION" ]; then
    echo "Error: PHP_VERSION environment variable is empty"
    exit 1
fi

export DEBIAN_FRONTEND="noninteractive"

# apt-get update -y
apt-get install -y --no-install-recommends software-properties-common

# Add PHP repository
add-apt-repository -y ppa:ondrej/php

apt-get update -y
apt-get install -y --no-install-recommends \
    unzip \
    wget \
    ca-certificates \
    php$PHP_VERSION-cli \
    php$PHP_VERSION-fpm \
    php$PHP_VERSION-bcmath \
    php$PHP_VERSION-bz2 \
    php$PHP_VERSION-curl \
    php$PHP_VERSION-exif \
    php$PHP_VERSION-gd \
    php$PHP_VERSION-gmp \
    php$PHP_VERSION-imagick \
    php$PHP_VERSION-imap \
    php$PHP_VERSION-intl \
    php$PHP_VERSION-ldap \
    php$PHP_VERSION-mbstring \
    php$PHP_VERSION-memcache \
    php$PHP_VERSION-memcached \
    php$PHP_VERSION-mongodb \
    php$PHP_VERSION-mysql \
    php$PHP_VERSION-odbc \
    php$PHP_VERSION-opcache \
    php$PHP_VERSION-pgsql \
    php$PHP_VERSION-readline \
    php$PHP_VERSION-redis \
    php$PHP_VERSION-snmp \
    php$PHP_VERSION-soap \
    php$PHP_VERSION-sqlite3 \
    php$PHP_VERSION-tidy \
    php$PHP_VERSION-xml \
    php$PHP_VERSION-xmlrpc \
    php$PHP_VERSION-xsl \
    php$PHP_VERSION-zip

# Clean up
apt-get purge -y software-properties-common
apt-get autoremove -y

ln -s /usr/sbin/php-fpm$PHP_VERSION /usr/sbin/php-fpm