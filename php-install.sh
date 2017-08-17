#!/usr/bin/env bash

# Installing PHP
yum -y install epel-release
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum -y --enablerepo=remi,remi-php71w install nginx php71w-cli php71w-devel php71w-fpm php71w-gd php71w-mbstring php71w-mcrypt php71w-mysql php71w-pear php71w-opcache php71w-common

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer

/usr/local/bin/composer global require "laravel/installer"
