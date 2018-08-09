#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

# LLVM 5

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
add-apt-repository "deb http://apt.llvm.org/${UBUNTU_CODENAME}/ llvm-toolchain-${UBUNTU_CODENAME}-5.0 main"
apt update && apt install -y llvm-5.0 llvm-5.0-dev clang-5.0 libclang-5.0-dev lldb-5.0

update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-5.0 50
update-alternatives --install /usr/bin/clang clang /usr/bin/clang-5.0 50
update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-5.0 50

llvm-config --version
clang --version
clang++ --version
