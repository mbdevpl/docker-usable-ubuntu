#!/bin/bash
set -Eeuxo pipefail

python3 --version
pip3 --version

# io packages
pip3 install mpi4py

# accelerator packages
pip3 install pycuda
pip3 install pyopencl

# code/ast manipulation packages
pip3 install PyLaTeX
