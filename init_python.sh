#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

# Python 3.6

apt-get install --no-install-recommends -y libsqlite3-dev tk-dev libgdbm-dev libssl-dev
apt-get install --no-install-recommends -y libncurses5-dev libncursesw5-dev libreadline6-dev
apt-get install --no-install-recommends -y zlib1g-dev liblzma-dev libbz2-dev
apt-get install --no-install-recommends -y libdb5.3-dev # Python 2.7

if [[ "${UBUNTU_RELEASE}" == "16.04" ]] ; then
  add-apt-repository ppa:deadsnakes/ppa && apt-get update
fi

apt-get install --no-install-recommends -y python3.6 python3.6-dev

if [[ "${UBUNTU_RELEASE}" == "18.04" ]] ; then
  apt-get install --no-install-recommends -y python3-dev
fi

if [[ "${UBUNTU_RELEASE}" == "16.04" ]] ; then
  update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 36
  # update-alternatives --install /usr/bin/pip3 pip3 /usr/bin/pip3.6 36
fi

python --version || echo "not available"
python2 --version || echo "not available"
python3 --version
python3.6 --version

curl https://bootstrap.pypa.io/get-pip.py | python3

pip --version || echo "not available"
pip2 --version || echo "not available"
pip3 --version
pip3.6 --version
