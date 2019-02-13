#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

# Ruby

apt-get install --no-install-recommends -y ruby ruby-dev

ruby --version
