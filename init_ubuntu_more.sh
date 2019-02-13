#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

#
# text, documents
#

apt-get install --no-install-recommends -y vim
apt-get install --no-install-recommends -y nano
apt-get install --no-install-recommends -y dos2unix
apt-get install --no-install-recommends -y fonts-ipafont # CJK fonts: IPAMincho IPAPMincho
apt-get install --no-install-recommends -y fonts-hanazono
apt-get install --no-install-recommends -y fonts-horai-umefont
apt-get install --no-install-recommends -y fonts-kouzan-mouhitsu
apt-get install --no-install-recommends -y fonts-motoya-l-cedar
apt-get install --no-install-recommends -y fonts-motoya-l-maruberi
apt-get install --no-install-recommends -y fonts-motoya-l-maruberi
apt-get install --no-install-recommends -y fonts-takao

#
# software development
#

apt-get install --no-install-recommends -y build-essential
apt-get install --no-install-recommends -y cmake

apt-get install --no-install-recommends -y doxygen
apt-get install --no-install-recommends -y libssl-dev
apt-get install --no-install-recommends -y libffi-dev
