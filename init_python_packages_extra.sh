#!/bin/bash
set -Eeuxo pipefail

python3 --version
python3 -m pip --version

# io packages
python3 -m pip install mpi4py

# utility / general-purpose packages
python3 -m pip install py-cpuinfo
python3 -m pip install psutil
python3 -m pip install system-query

# accelerator packages
python3 -m pip install pycuda
python3 -m pip install pyopencl
python3 -m pip install PyOpenGL
python3 -m pip install PyOpenGL-accelerate

# code/ast manipulation packages
python3 -m pip install PyLaTeX
python3 -m pip install Pygments

# Jupyter notebook extensions
python3 -m pip install ipyparallel
python3 -m pip install ipykernel
python3 -m pip install jupyter_contrib_nbextensions
python3 -m pip install jupyter_nbextensions_configurator
python3 -m jupyter contrib nbextension install --sys-prefix  # --user
python3 -m jupyter nbextensions_configurator enable --sys-prefix  # --user
python3 -m jupyter nbextension enable --sys-prefix execute_time/ExecuteTime  # --user
python3 -m jupyter nbextension enable --sys-prefix toc2/main  # --user
python3 -m jupyter nbextension enable --sys-prefix printview/main  # --user
python3 -m jupyter nbextension enable --sys-prefix ruler/main  # --user

# project/configuration management
python3 -m pip install encrypted-config
python3 -m pip install ingit

# interoperability
python3 -m pip install slackclient
python3 -m pip install py-trello

# for Atom code editor
python3 -m ipykernel install --sys-prefix  # --user
python3 -m pip install python-language-server[all]  # ide-python
python3 -m pip install fortran-language-server  # ide-fortran

python3 -m pip freeze
jupyter nbextension list
