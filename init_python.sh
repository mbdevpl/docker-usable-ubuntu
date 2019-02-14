#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

# Python 3 (3.6 on 18.04 and 18.10, 3.7 on 19.04)

# apt-get install --no-install-recommends -y libsqlite3-dev tk-dev libgdbm-dev libssl-dev
# apt-get install --no-install-recommends -y libncurses5-dev libncursesw5-dev libreadline-dev
# apt-get install --no-install-recommends -y zlib1g-dev liblzma-dev libbz2-dev
# apt-get install --no-install-recommends -y libdb5.3-dev
# apt-get install --no-install-recommends -y libexpat1-dev libffi-dev
# apt-get install --no-install-recommends -y xz-utils

apt-get install --no-install-recommends -y python3
apt-get install --no-install-recommends -y python3-dev
apt-get install --no-install-recommends -y python3-pip

python --version || echo "not available"
python2 --version || echo "not available"
python3 --version
python3.6 --version || echo "not available"
python3.7 --version || echo "not available"

# curl https://bootstrap.pypa.io/get-pip.py | python3

pip --version || echo "not available"
pip2 --version || echo "not available"
pip3 --version
pip3.6 --version || echo "not available"
pip3.7 --version || echo "not available"
