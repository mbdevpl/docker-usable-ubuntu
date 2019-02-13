#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

#
# essential
#

apt-get install --no-install-recommends -y software-properties-common
apt-get install --no-install-recommends -y sudo

#
# system utilities
#

apt-get install --no-install-recommends -y screen
apt-get install --no-install-recommends -y iproute2

#
# files
#

apt-get install --no-install-recommends -y curl
apt-get install --no-install-recommends -y wget
apt-get install --no-install-recommends -y unrar

#
# software development
#

apt-get install --no-install-recommends -y git

#
# env modules
#

apt-get install --no-install-recommends -y tcl
apt-get install --no-install-recommends -y environment-modules

#
# security
#

apt-get install --no-install-recommends -y gnupg-agent

#
# science
#

#apt-get install -y openmpi-bin libopenmpi-dev
#apt-get install -y libhdf5-dev libhdf5-mpi-dev
