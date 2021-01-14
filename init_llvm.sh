#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

# LLVM 10

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
add-apt-repository "deb http://apt.llvm.org/${UBUNTU_CODENAME}/ llvm-toolchain-${UBUNTU_CODENAME}-10 main" && apt-get update
apt-get install --no-install-recommends -y llvm-10 llvm-10-dev clang-10 libclang-10-dev clangd-10 lldb-10 clang-tools-10

update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-10 10
update-alternatives --install /usr/bin/clang clang /usr/bin/clang-10 10
update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-10 10
update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-10 10

llvm-config --version
clang --version
clang++ --version
clangd --version
