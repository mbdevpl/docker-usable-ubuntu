#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

# LLVM 7

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
add-apt-repository "deb http://apt.llvm.org/${UBUNTU_CODENAME}/ llvm-toolchain-${UBUNTU_CODENAME}-7 main" && apt-get update
apt-get install --no-install-recommends -y llvm-7 llvm-7-dev clang-7 libclang-7-dev lldb-7 clang-tools-7

update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-7 70
update-alternatives --install /usr/bin/clang clang /usr/bin/clang-7 70
update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-7 70
update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-7 70

llvm-config --version
clang --version
clang++ --version
clangd --version
