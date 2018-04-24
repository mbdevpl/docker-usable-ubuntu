#!/bin/bash
set -Eeuxo pipefail

echo "debconf debconf/frontend select Noninteractive" | debconf-set-selections

apt update
apt dist-upgrade -y

apt install -y apt-utils
apt install -y lsb-release

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
apt install -y dos2unix
apt install -y fonts-ipafont # CJK fonts: IPAMincho IPAPMincho

#
# software development
#

apt install -y git
apt install -y doxygen
apt install -y build-essential libssl-dev libffi-dev
apt install -y cmake

# GCC 7

if [[ "${UBUNTU_RELEASE}" == "16.04" ]] ; then
  add-apt-repository ppa:jonathonf/gcc-7.1 && apt update
fi

apt install -y cpp-7 gcc-7 g++-7 gfortran-7

update-alternatives --install /usr/bin/cpp cpp /usr/bin/cpp-7 70
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 70
update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-7 70

cpp --version
gcc --version
g++ --version
gfortran --version

# LLVM 5

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
add-apt-repository "deb http://apt.llvm.org/${UBUNTU_CODENAME}/ llvm-toolchain-${UBUNTU_CODENAME}-5.0 main"
apt update && apt install -y llvm-5.0 llvm-5.0-dev clang-5.0 libclang-5.0-dev lldb-5.0

update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-5.0 50
update-alternatives --install /usr/bin/clang clang /usr/bin/clang-5.0 50
update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-5.0 50

llvm-config --version
clang --version
clang++ --version

# Python 3.6

apt install -y libsqlite3-dev tk-dev libgdbm-dev libssl-dev
apt install -y libncurses5-dev libncursesw5-dev libreadline6-dev
apt install -y zlib1g-dev liblzma-dev libbz2-dev
apt install -y libdb5.3-dev # Python 2.7

if [[ "${UBUNTU_RELEASE}" == "16.04" ]] ; then
  add-apt-repository ppa:deadsnakes/ppa && apt-get update
fi

apt install -y python3.6 python3.6-dev

if [[ "${UBUNTU_RELEASE}" == "18.04" ]] ; then
  apt install -y python3-dev
fi

if [[ "${UBUNTU_RELEASE}" == "16.04" ]] ; then
  update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 36
fi

python --version || echo "not available"
python2 --version || echo "not available"
python3 --version
python3.6 --version

curl https://bootstrap.pypa.io/get-pip.py | python3

pip3 install -U pip setuptools wheel twine

pip --version || echo "not available"
pip2 --version || echo "not available"
pip3 --version
pip3.6 --version

# JDK 9 (on 16.04) or JDK 11 (on 18.04)

if [[ "${UBUNTU_RELEASE}" == "16.04" ]] ; then
  apt -o Dpkg::Options::="--force-overwrite" install -y openjdk-9-jdk
else
  apt install -y openjdk-11-jdk
fi

apt install -y ca-certificates-java ant

java -version

# Ruby

apt install -y ruby ruby-dev

ruby --version

#
# science
#

apt install -y openmpi-bin libopenmpi-dev
apt install -y libhdf5-dev libhdf5-mpi-dev
