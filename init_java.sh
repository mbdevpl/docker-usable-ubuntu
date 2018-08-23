#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

# JDK 9 (on 16.04) or JDK 11 (on 18.04)

if [[ "${UBUNTU_RELEASE}" == "16.04" ]] ; then
  apt -o Dpkg::Options::="--force-overwrite" install --no-install-recommends -y openjdk-9-jdk
else
  apt install --no-install-recommends -y openjdk-11-jdk
fi

apt install --no-install-recommends -y ca-certificates-java ant

java -version
