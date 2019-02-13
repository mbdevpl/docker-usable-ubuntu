#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

# GCC 7

if [[ "${UBUNTU_RELEASE}" == "16.04" ]] ; then
  add-apt-repository ppa:jonathonf/gcc-7.1 && apt update
fi

apt-get install --no-install-recommends -y cpp-7 gcc-7 g++-7 gfortran-7

update-alternatives --install /usr/bin/cpp cpp /usr/bin/cpp-7 70
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 70
update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-7 70

cpp --version
gcc --version
g++ --version
gfortran --version
