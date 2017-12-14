#!/bin/bash

adduser --shell /bin/bash --disabled-password --gecos "" --home /home/user user
usermod -aG sudo user

echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user
passwd -d user
