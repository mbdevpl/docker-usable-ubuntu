FROM ubuntu:17.10

MAINTAINER Mateusz Bysiek <mateusz.bysiek.spam@gmail.com>

#
#
#

RUN apt update
RUN apt dist-upgrade

RUN apt install -y curl wget
RUN apt install -y screen vim apt-file dos2unix unrar iproute2
RUN apt install -y git
RUN apt install -y fonts-ipafont

RUN apt install -y software-properties-common

RUN apt install -y build-essential libssl-dev libffi-dev
RUN apt install -y openmpi-bin libopenmpi-dev
RUN apt install -y libhdf5-dev libhdf5-mpi-dev
RUN apt install -y libtag1-dev
RUN apt install -y sudo

RUN adduser --shell /bin/bash --disabled-password --gecos "" --home /home/user user
RUN usermod -aG sudo user

RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user
RUN passwd -d user

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
RUN add-apt-repository "deb http://apt.llvm.org/artful/ llvm-toolchain-artful-5.0 main"
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

RUN apt install -y openjdk-9-jdk
RUN apt install -y ca-certificates-java
RUN apt install -y ant

RUN java -version

#
# Ruby
#

RUN apt install -y ruby ruby-dev

RUN ruby --version

#
#
#

WORKDIR /root

RUN echo "ip address" >> .bash_history

USER user

WORKDIR /home/user

RUN echo "ip address" >> .bash_history

ENTRYPOINT ["/bin/bash"]
