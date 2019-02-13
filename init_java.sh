#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

# JDK 11

apt-get install --no-install-recommends -y openjdk-11-jdk
apt-get install --no-install-recommends -y ca-certificates-java ant

java -version
