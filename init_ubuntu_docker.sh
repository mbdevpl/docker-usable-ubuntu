#!/bin/bash
set -Eeuxo pipefail

echo "debconf debconf/frontend select Noninteractive" | debconf-set-selections

apt update
apt dist-upgrade -y

apt install -y apt-utils
apt install -y lsb-release
