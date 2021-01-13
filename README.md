# Usable Ubuntu

Ubuntu with several essential tools pre-installed.

Motivation behind it is need for a convenient debugging/development image,
especially for projects which implemented in more than one programming language.
The image size is a priority too, but the highest priority is ease of development/debugging in it.


## Tags

Currently maintained Docker tags (with corresponding Ubuntu versions):

* [18.04](https://github.com/mbdevpl/docker-usable-ubuntu/tree/18.04)
* [latest](https://github.com/mbdevpl/docker-usable-ubuntu/tree/latest) is same as `ubuntu:latest` (currently 18.04)

Tags that are no longer maintained:

* [19.04](https://github.com/mbdevpl/docker-usable-ubuntu/tree/19.04)
* [18.10](https://github.com/mbdevpl/docker-usable-ubuntu/tree/18.10)
* [17.10](https://github.com/mbdevpl/docker-usable-ubuntu/tree/17.10)
* [16.04](https://github.com/mbdevpl/docker-usable-ubuntu/tree/16.04)

See the [Docker Hub repository](https://hub.docker.com/r/mbdevpl/usable-ubuntu/) for details.


## Features

Looking through the
[latest build logs](https://cloud.docker.com/repository/docker/mbdevpl/usable-ubuntu/builds)
reveals the detailed information about all features.
Viewing the logs, however, requires Docker Hub ID. Below is the general overview of the features.

Container has two users:

* default user `user` with sudo privileges and no password -- use `sudo su` to become root.
* `root` -- use `su - user -c something` to execute something as `user`.

### Extensibility

Image is built in a way as to help to build on top of it.

#### Changing apt mirror

It's controlled via `APT_MIRROR` build argument, `us` by default.

Change is made by running `/opt/usable/ubuntu/refresh_apt_mirror.sh` in docker build.

Usage example:

```
FROM mbdevpl/usable-ubuntu:latest

ARG APT_MIRROR=jp

RUN sudo /opt/usable/ubuntu/refresh_apt_mirror.sh

...
```

#### Changing timezone

It's controlled via `TIMEZONE` build argument, `UTC` by default.

Change is made by running `/opt/usable/ubuntu/refresh_timezone.sh` in docker build.

```
FROM mbdevpl/usable-ubuntu:latest

ARG TIMEZONE=Asia/Tokyo

RUN sudo /opt/usable/ubuntu/refresh_timezone.sh

...
```


### Software development

Currently supported programming languages:

* C, C++ (GCC 8, LLVM 7)
* Fortran (GCC 8)
* Python 3 (CPython 3.6 on 18.04 and 18.10, CPython 3.7 on 19.04)
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
* interactive interfaces (ipython, notebook, ...)
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


## Contributing

Contributions of any kind are welcome.
Please open issues and/or submit pull requests
in the [GitHub repository](https://github.com/mbdevpl/docker-usable-ubuntu) of the project
if you see some problem with the images and/or wish something changed.
