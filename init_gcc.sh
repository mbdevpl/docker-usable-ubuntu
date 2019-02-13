#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

# GCC 8

apt-get install --no-install-recommends -y cpp-8 gcc-8 g++-8 gfortran-8

update-alternatives --install /usr/bin/cpp cpp /usr/bin/cpp-8 80
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 80
update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-8 80

cpp --version
gcc --version
g++ --version
gfortran --version
