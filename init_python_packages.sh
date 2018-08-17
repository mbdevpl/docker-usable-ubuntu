#!/bin/bash
set -Eeuxo pipefail

python3 --version
pip3 --version

# package management packages
pip3 install pipdeptree pip-autoremove

# utility / general-purpose packages
pip3 install colorama
pip3 install ordered-set
pip3 install readchar==0.1.0
pip3 install six
pip3 install docutils
pip3 install more-itertools

# date/time manipulation packages
pip3 install python-dateutil
pip3 install parsedatetime
pip3 install tzlocal

# versioning packages
pip3 install GitPython
pip3 install semver
pip3 install version-query

# code anlysis packages
pip3 install coverage hypothesis
pip3 install mypy
pip3 install pycodestyle
pip3 install pylint
pip3 install flake8
pip3 install line_profiler
pip3 install memory_profiler

# io packages
pip3 install oauthlib
pip3 install requests wget
pip3 install defusedxml lxml

# sci packages
pip3 install networkx
pip3 install pymbolic sympy
pip3 install numpy Bottleneck scipy
pip3 install statsmodels
pip3 install Pillow
pip3 install matplotlib
pip3 install tables
pip3 install pandas

# deep learning packages
pip3 install chainer
pip3 install Keras

# code/ast manipulation packages
pip3 install asttokens
pip3 install astunparse
pip3 install loo.py
pip3 install typed_ast
pip3 install typed-astunparse
pip3 install pcpp
pip3 install pycparser
pip3 install Cython numba Nuitka

# geo packages
pip3 install motionless
pip3 install haversine
pip3 install pycountry

# ipython/jupyter packages
pip3 install ipython
pip3 install jupyter notebook ipyparallel
pip3 install nbextensions jupyter_contrib_nbextensions

pip3 freeze
