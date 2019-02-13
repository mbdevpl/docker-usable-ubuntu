#!/bin/bash
set -Eeuxo pipefail

echo "debconf debconf/frontend select Noninteractive" | debconf-set-selections

if [ -n ${APT_MIRROR} ] ; then
  sed -i 's|http://archive.ubuntu.com|http://'"${APT_MIRROR}"'.archive.ubuntu.com|g' /etc/apt/sources.list
fi

apt-get update
apt-get dist-upgrade -y

apt-get install --no-install-recommends -y apt-utils
apt-get install --no-install-recommends -y lsb-release
