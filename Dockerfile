############################################################
# Based on CentOS
# Php
# Nginx
# Laravel
############################################################

# Set the base image to Ubuntu
FROM centos:7

# File Author / Maintainer
MAINTAINER Luis García <luis_garcia_p@hotmail.com>

# Update library
RUN yum -y update

# Add the ngix and PHP dependent repository
ADD nginx.repo /etc/yum.repos.d/nginx.repo

# Installing nginx 
RUN yum -y install nginx

# Installing supervisor
RUN yum install -y python-setuptools
RUN easy_install pip
RUN pip install supervisor

# Adding the configuration file of the nginx
ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf

# Adding the configuration file of the Supervisor
ADD supervisord.conf /etc/

# Adding the default file
ADD index.php /var/www/index.php

# Adding the shell file
ADD php-install.sh /php-install.sh
RUN chmod +x /*.sh
RUN ./php-install.sh

# Set the port to 80 
EXPOSE 80

VOLUME ["/etc/nginx/conf.d", "/var/www"]

# Executing supervisord
CMD ["supervisord", "-n"]
