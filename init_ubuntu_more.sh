#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

#
# text, documents
#

apt install --no-install-recommends -y vim
apt install --no-install-recommends -y nano
apt install --no-install-recommends -y dos2unix
apt install --no-install-recommends -y fonts-ipafont # CJK fonts: IPAMincho IPAPMincho

#
# software development
#

apt install --no-install-recommends -y build-essential
apt install --no-install-recommends -y cmake

apt install --no-install-recommends -y doxygen
apt install --no-install-recommends -y libssl-dev
apt install --no-install-recommends -y libffi-dev
