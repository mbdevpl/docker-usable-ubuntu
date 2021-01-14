# Usable Ubuntu

Ubuntu with several essential tools pre-installed.

Motivation behind it is need for a convenient debugging/development image,
especially for projects implemented in more than one programming language.
The image size is a priority too, but the highest priority is ease of development/debugging in it.


## Tags

Currently maintained Docker tags (with corresponding Ubuntu versions):

* [latest](https://github.com/mbdevpl/docker-usable-ubuntu/tree/latest) is based on `ubuntu:latest` (currently 20.04)
* [20.04](https://github.com/mbdevpl/docker-usable-ubuntu/tree/20.04) is based on `ubuntu:20.04`
* [20.04-cuda](https://github.com/mbdevpl/docker-usable-ubuntu/tree/20.04-cuda) is based on `nvidia/cuda:11.1-devel-ubuntu20.04`
* [18.04](https://github.com/mbdevpl/docker-usable-ubuntu/tree/18.04) is based on `ubuntu:18.04`
* [18.04-cuda](https://github.com/mbdevpl/docker-usable-ubuntu/tree/18.04-cuda) is based on `nvidia/cuda:10.2-devel-ubuntu18.04`

Tags that are no longer maintained:

* [19.04](https://github.com/mbdevpl/docker-usable-ubuntu/tree/19.04)
* [18.10](https://github.com/mbdevpl/docker-usable-ubuntu/tree/18.10)
* [17.10](https://github.com/mbdevpl/docker-usable-ubuntu/tree/17.10)
* [16.04](https://github.com/mbdevpl/docker-usable-ubuntu/tree/16.04)

See the [Docker Hub repository](https://hub.docker.com/r/mbdevpl/usable-ubuntu/) for details.


## Features

Looking through the
[latest build logs](https://cloud.docker.com/repository/docker/mbdevpl/usable-ubuntu/builds)
reveals details about all built libraries and their exact versions.
Viewing the logs, however, requires Docker Hub ID.

Please see below for the high-level overview of the features.

Container has two users:

* default user `user` with sudo privileges and no password -- use `sudo su` to become root.
* `root` -- use `su - user -c something` to execute something as `user`.


### Software development

Currently supported programming languages:

* C, C++ (GCC 8, LLVM 10)
* Fortran (GCC 8)
* Python 3 (CPython 3.6 on 18.04, CPython 3.8 on 20.04)
* Java (Open JDK 11)

Not installed by default, but also easily available:

* Ruby -- run `sudo /opt/usable-ubuntu/init_ruby.sh` to install
* LaTeX (texlive 2018) -- run `/opt/usable-ubuntu/init_texlive.sh` to install


### Python packages

Python comes with many useful packages pre-installed for convenience.

The feature categories include but aren't limited to:

* debugging (ipdb)
* code analysis (coverage, mypy, pylint, ...)
* parsing, compilation and code generation (numba, Cython, astunparse, typed_ast, ...)
* interactive interfaces (ipython, jupyter, ...)
* numerics and data science (numpy, scipy, pandas, matplotlib, ...)
* machine learning (scikit-learn, chainer, keras)


### Tools

Additionally, common tools and libraries including but not limited to:

* screen
* curl
* wget
* git
* environment modules (`module` command)
* vim
* nano
* cmake
* doxygen


### Extensibility

Image is built in a way as to help to build on top of it.

It can also be stripped out of some features that are enabled by default,
or have some features that are disabled by default, enabled.


#### Disabling and enabling features

Simply comment out a line in the `Dockerfile` which runs a script with
a given feature to disable it, or uncomment it to enable a feature.

Customisable features:

* more Ubuntu apps `init_ubuntu_more.sh`
* GCC: `init_gcc.sh`
* LLVM: `init_llvm.sh`
* CPython: `init_python.sh`
* JDK: `init_java.sh`
* Ruby: `init_ruby.sh`
* Texlive `init_texlive.sh`
* common Python packages: `init_python_packages.sh`
* more Python packages: `init_python_packages_extra.sh`


#### Changing apt mirror

It's controlled via `APT_MIRROR` build argument, `us` by default.

Change is made by running `/opt/usable/ubuntu/refresh_apt_mirror.sh` in docker build.

Usage example:

```
FROM mbdevpl/usable-ubuntu:latest

ARG APT_MIRROR=jp

USER root

RUN /opt/usable/ubuntu/refresh_apt_mirror.sh

...
```


#### Changing timezone

It's controlled via `TIMEZONE` build argument, `UTC` by default.

Change is made by running `/opt/usable/ubuntu/refresh_timezone.sh` in docker build.

```
FROM mbdevpl/usable-ubuntu:latest

ARG TIMEZONE=Asia/Tokyo

USER root

RUN /opt/usable/ubuntu/refresh_timezone.sh

...
```


## Contributing

Contributions of any kind are welcome.
Please open issues and/or submit pull requests
in the [GitHub repository](https://github.com/mbdevpl/docker-usable-ubuntu) of the project
if you see some problem with the images and/or wish something changed.
