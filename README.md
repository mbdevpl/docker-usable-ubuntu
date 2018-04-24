# Usable Ubuntu

Ubuntu with several essential tools pre-installed.

## Tags

Currently maintained Docker tags (with corresponding Ubuntu versions):

* [16.04](https://github.com/mbdevpl/docker-usable-ubuntu/tree/16.04)
* [18.04](https://github.com/mbdevpl/docker-usable-ubuntu/tree/18.04)
* [latest](https://github.com/mbdevpl/docker-usable-ubuntu/tree/latest) is same as `ubuntu:latest` (currently 16.04)

No longer maintained tags:

* [17.10](https://github.com/mbdevpl/docker-usable-ubuntu/tree/17.10)

## Features

Currently supported programming languages:

* C, C++, Fortran (GCC 7, LLVM 5.0)
* Python 3.6
* Java (Open JDK 9 on 16.04 and 11 on 18.04)
* Ruby

Additionally, common tools and libraries including but not limited to:

* git
* MPI

Container has a user `user` configured with sudo priviliges and no password.

See the [contents of the repository](https://github.com/mbdevpl/docker-usable-ubuntu)
and [latest build logs](https://cloud.docker.com/app/mbdevpl/repository/docker/mbdevpl/usable-ubuntu/builds)
for details.
