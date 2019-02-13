#!/bin/bash
set -Eeuxo pipefail

python3 --version
pip3 --version

# io packages
pip3 install mpi4py

# utility / general-purpose packages
pip3 install py-cpuinfo
pip3 install psutil
pip3 install system-query

# accelerator packages
pip3 install pycuda
pip3 install pyopencl
pip3 install PyOpenGL
pip3 install PyOpenGL-accelerate

# code/ast manipulation packages
pip3 install PyLaTeX
pip3 install Pygments

# Jupyter notebook extensions
pip3 install nbextensions
pip3 install jupyter_contrib_nbextensions

# project/configuration management
pip3 install encrypted-config
pip3 install ingit

# interoperability
pip3 install slackclient
pip3 install py-trello

# for Atom code editor
pip3 install python-language-server[all]
pip3 install fortran-language-server
