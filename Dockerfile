FROM ubuntu:17.10

MAINTAINER Mateusz Bysiek <mateusz.bysiek.spam@gmail.com>

USER root
COPY . /root/Projects/docker-usable-ubuntu
WORKDIR /root/Projects/docker-usable-ubuntu

#
#
#

RUN bash init_ubuntu_base.sh
RUN bash init_ubuntu_base_user.sh

#
#
#

USER root

RUN cat bash_history.sh >> /root/.bash_history

USER user

RUN cat bash_history_user.sh >> /home/user/.bash_history

ENTRYPOINT ["/bin/bash"]
