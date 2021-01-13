#!/bin/bash
set -Eeuxo pipefail

echo "${TIMEZONE}" > /etc/timezone
rm /etc/localtime
ln -s "/usr/share/zoneinfo/${TIMEZONE}" /etc/localtime
