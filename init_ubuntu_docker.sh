#!/bin/bash
set -Eeuxo pipefail

echo "debconf debconf/frontend select Noninteractive" | debconf-set-selections

apt update
apt dist-upgrade -y

apt install --no-install-recommends -y apt-utils
apt install --no-install-recommends -y lsb-release
