#!/bin/bash
set -Eeuxo pipefail

UBUNTU_RELEASE="$(lsb_release -rs)"
UBUNTU_CODENAME="$(lsb_release -cs)"

python3 --version
python3 -m pip --version

# essential package support
python3 -m pip --no-cache-dir install -U --upgrade-strategy=eager pip
python3 -m pip --no-cache-dir install -U --upgrade-strategy=eager setuptools wheel

# package management packages
python3 -m pip install twine
python3 -m pip install pipdeptree
python3 -m pip install pip-autoremove

# utility / general-purpose packages
python3 -m pip install colorama
python3 -m pip install ordered-set
python3 -m pip install readchar
python3 -m pip install six
python3 -m pip install docutils
python3 -m pip install more-itertools

# date/time manipulation packages
python3 -m pip install python-dateutil
python3 -m pip install parsedatetime
python3 -m pip install tzlocal

# versioning packages
python3 -m pip install GitPython
python3 -m pip install semver
python3 -m pip install version-query

# debugging
python3 -m pip install ipdb

# code/ast manipulation packages
python3 -m pip install asttokens
python3 -m pip install astunparse
if [[ "${UBUNTU_RELEASE}" == "18.04" ]] ; then
  python3 -m pip install loo.py
fi
python3 -m pip install typed_ast
python3 -m pip install typed-astunparse
python3 -m pip install pcpp
python3 -m pip install pycparser
python3 -m pip install Cython
python3 -m pip install numba
python3 -m pip install Nuitka

# static anlysis packages
python3 -m pip install mypy
python3 -m pip install pycodestyle
python3 -m pip install pylint
python3 -m pip install flake8

# dynamic analysis packages
python3 -m pip install coverage
python3 -m pip install hypothesis
if [[ "${UBUNTU_RELEASE}" == "18.04" ]] ; then
  python3 -m pip install line_profiler
  python3 -m pip install memory_profiler
fi

# io packages
python3 -m pip install oauthlib
python3 -m pip install requests
python3 -m pip install wget
python3 -m pip install defusedxml
python3 -m pip install lxml

# sci packages
python3 -m pip install networkx
python3 -m pip install pymbolic
python3 -m pip install sympy
python3 -m pip install numpy
if [[ "${UBUNTU_RELEASE}" == "18.04" ]] ; then
  python3 -m pip install Bottleneck
fi
python3 -m pip install scipy
python3 -m pip install statsmodels
python3 -m pip install Pillow
python3 -m pip install matplotlib
python3 -m pip install tables
python3 -m pip install pandas

# machine learning packages
python3 -m pip install scikit-learn
python3 -m pip install chainer
python3 -m pip install Keras

# geo packages
python3 -m pip install motionless
python3 -m pip install haversine
python3 -m pip install pycountry

# ipython/jupyter packages
python3 -m pip install ipython
python3 -m pip install jupyter
python3 -m pip install notebook

python3 -m pip freeze
