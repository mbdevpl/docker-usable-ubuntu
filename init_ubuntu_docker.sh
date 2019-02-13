#!/bin/bash
set -Eeuxo pipefail

echo "debconf debconf/frontend select Noninteractive" | debconf-set-selections

apt-get update
apt-get dist-upgrade -y

apt-get install --no-install-recommends -y apt-utils
apt-get install --no-install-recommends -y lsb-release
