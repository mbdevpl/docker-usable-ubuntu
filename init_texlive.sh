#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

# usual texlive

# apt-get install --no-install-recommends -y texlive biber texlive-music texlive-lang-polish texlive-lang-french texlive-lang-cjk

# texlive from source

dir_prefix="install-tl-"
archive="install-tl-unx.tar.gz"
download_url="http://mirror.ctan.org/systems/texlive/tlnet/${archive}"
build_dir="/tmp"
installer="install-tl"
prefix="${HOME}/.local/texlive"

prev_dir="$(pwd)"
# cp "${archive}" "${build_dir}"
cd "${build_dir}"
wget "${download_url}"
tar -axf "${archive}"
rm "${archive}"
cd ${dir_prefix}*
# TEXLIVE_INSTALL_TEXDIR="${prefix}/2016"
TEXLIVE_INSTALL_PREFIX="${prefix}" "./${installer}" --gui=text -v -no-persistent-downloads
cd "${prev_dir}"
