#!/bin/bash
set -Eeuxo pipefail

#
# system utilities
#

# configure language

dpkg-reconfigure locales

# Webmin

curl -s http://www.webmin.com/jcameron-key.asc | apt-key add -
add-apt-repository "deb http://download.webmin.com/download/repository sarge contrib" && apt update
apt install -y webmin

# SSH

apt install -y openssh-client
apt install -y openssh-server
apt install -y autossh

#
#
#

apt install -y letsencrypt
apt install -y nginx
apt install -y davical
