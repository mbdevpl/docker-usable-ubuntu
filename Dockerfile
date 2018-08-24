FROM ubuntu:18.10

MAINTAINER Mateusz Bysiek <mateusz.bysiek.spam@gmail.com>

SHELL ["/bin/bash", "--login", "-c"]

ARG APT_MIRROR=us

USER root
COPY . /opt/usable-ubuntu
WORKDIR /opt/usable-ubuntu

#
# install stuff
# create user "user"
# configure git for local usage
# clear up after apt
# initialize "root" and "user" bash history
#

RUN bash init_ubuntu_docker.sh && \
  bash init_ubuntu_base.sh && \
  bash init_ubuntu_base_user.sh && \
  su - user -c "touch /home/user/.bash_history" && \
  su - user -c "git config --global user.email 'ubuntu-user@example.com'" && \
  su - user -c "git config --global user.name 'Ubuntu User'" && \
  bash init_ubuntu_more.sh && \
  bash init_gcc.sh && \
  bash init_llvm.sh && \
  bash init_python.sh && \
  bash init_java.sh && \
  # bash init_ruby.sh && \
  # bash init_texlive.sh && \
  bash init_python_packages.sh && \
  # bash init_python_packages_extra.sh && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  cat bash_history.sh >> /root/.bash_history && \
  cat bash_history_user.sh >> /home/user/.bash_history

USER user
WORKDIR /home/user

ENTRYPOINT ["/bin/bash", "--login"]
