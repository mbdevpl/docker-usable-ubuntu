#!/bin/bash
set -Eeuxo pipefail

UBUNTU_CODENAME="$(lsb_release -cs)"

#
#
#

apt install -y ubuntu-restricted-extras

#
# system utilities
#

apt install -y gparted synaptic
apt install -y indicator-cpufreq indicator-keylock indicator-multiload
apt install -y dconf-editor
apt install -y gnome-tweak-tool
apt install -y compizconfig-settings-manager compiz-plugins
apt install -y psensor

# apt-file

apt install -y apt-file
apt-file update

#
# files
#

apt install -y filezilla
apt install -y keepassx

# Seafile

add-apt-repository ppa:seafile/seafile-client && apt update
apt install -y seafile-gui

# Syncthing

curl -s https://syncthing.net/release-key.txt | apt-key add -
add-apt-repository "deb https://apt.syncthing.net/ syncthing release" && apt update
apt install -y syncthing

# Syncthing GTK

sudo add-apt-repository ppa:nilarimogard/webupd8 && apt update
apt install -y syncthing-gtk

#
# text, documents
#

apt install -y xournal
apt install -y bless # HEX editor

#
# software development
#

apt install -y git-gui gitk
apt install -y doxygen-gui
apt install -y virtualbox-qt virtualbox-guest-additions-iso virtualbox-ext-pack

# travis

gem install --user-install travis --no-rdoc --no-ri

# Docker

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu ${UBUNTU_CODENAME} stable" && apt update
apt install -y docker-ce

#
# productivity
#

# Synergy

wget -q -O- http://archive.getdeb.net/getdeb-archive.key | apt-key add -
add-apt-repository "deb http://archive.getdeb.net/ubuntu ${UBUNTU_CODENAME}-getdeb apps" && apt update
apt install -y synergy

#
# science
#

apt install -y speedcrunch

#
# communication
#

# Telegram

add-apt-repository ppa:atareao/telegram && apt update
apt install -y telegram

#
# audio
#

apt install -y libtag1-dev
apt install -y audacity
apt install -y puddletag # music tag editor
add-apt-repository ppa:fossfreedom/rhythmbox-plugins && apt update

#
# graphics/video
#

apt install -y gimp gimp-data-extras
apt install -y inkscape
apt install -y vlc

#
#
#
