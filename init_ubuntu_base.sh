#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

#
# essential
#

apt install --no-install-recommends -y software-properties-common
apt install --no-install-recommends -y sudo

#
# system utilities
#

apt install --no-install-recommends -y screen
apt install --no-install-recommends -y iproute2

#
# files
#

apt install --no-install-recommends -y curl
apt install --no-install-recommends -y wget
apt install --no-install-recommends -y unrar

#
# software development
#

apt install --no-install-recommends -y git

#
# env modules
#

apt install --no-install-recommends -y tcl
apt install --no-install-recommends -y environment-modules

#
# security
#

apt install --no-install-recommends -y gnupg-agent

#
# science
#

#apt install -y openmpi-bin libopenmpi-dev
#apt install -y libhdf5-dev libhdf5-mpi-dev
