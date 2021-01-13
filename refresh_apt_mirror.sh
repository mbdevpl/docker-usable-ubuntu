#!/bin/bash
set -Eeuxo pipefail

sed -i -r 's|http://(..\.)?archive\.ubuntu\.com|http://'"${APT_MIRROR}"'.archive.ubuntu.com|g' /etc/apt/sources.list
