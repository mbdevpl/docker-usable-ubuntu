#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

#
#
#

apt install -y software-properties-common

#
# system utilities
#

apt install -y screen
apt install -y iproute2
apt install -y sudo

#
# files
#

apt install -y curl wget
apt install -y unrar

#
# text, documents
#

apt install -y vim
apt install -y nano
apt install -y dos2unix
apt install -y fonts-ipafont # CJK fonts: IPAMincho IPAPMincho

#
# software development
#

apt install -y git
apt install -y doxygen
apt install -y build-essential libssl-dev libffi-dev
apt install -y cmake

#
# env modules
#

apt install -y environment-modules

#
# science
#

#apt install -y openmpi-bin libopenmpi-dev
#apt install -y libhdf5-dev libhdf5-mpi-dev
