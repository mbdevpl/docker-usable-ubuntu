FROM ubuntu:17.10

MAINTAINER Mateusz Bysiek <mateusz.bysiek.spam@gmail.com>

#
#
#

RUN apt update
RUN apt dist-upgrade

RUN apt install -y curl
RUN apt install -y wget

#
# GCC 7
#

RUN apt install -y cpp-7 gcc-7 g++-7 gfortran-7

RUN update-alternatives --install /usr/bin/cpp cpp /usr/bin/cpp-7 70
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 70
RUN update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-7 70

RUN cpp --version
RUN gcc --version
RUN g++ --version
RUN gfortran --version

#
# LLVM 5
#

RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt update && apt install -y llvm-5.0 clang-5.0 lldb-5.0

RUN update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-5.0 50
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-5.0 50
RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-5.0 50

RUN llvm-config --version
RUN clang --version
RUN clang++ --version

#
# Python 3.6
#

RUN apt install -y build-essential libssl-dev libffi-dev
RUN apt install -y python3.6 python3.6-dev

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 10

RUN python --version || echo "not available"
RUN python3 --version
RUN python3.6 --version

RUN curl https://bootstrap.pypa.io/get-pip.py | python3.6
RUN pip3.6 install -U pip setuptools wheel twine

RUN pip --version || echo "not available"
RUN pip3 --version
RUN pip3.6 --version

#
# JDK 9
#

RUN apt install -y openjdk-9-jdk ca-certificates-java

RUN java -version

#
#
#

ENTRYPOINT ["/bin/bash"]
