FROM ubuntu:17.10

MAINTAINER Mateusz Bysiek <mateusz.bysiek.spam@gmail.com>

#
#
#

RUN apt update
RUN apt dist-upgrade

RUN apt install -y curl

#
# Python 3.6
#

RUN apt install -y python3.6

#RUN python --version
#RUN python3 --version
RUN python3.6 --version

RUN curl https://bootstrap.pypa.io/get-pip.py | python3.6
RUN pip3.6 install -U pip setuptools wheel twine

#RUN pip --version
#RUN pip3 --version
RUN pip3.6 --version

#
# JDK 9
#

RUN apt install -y openjdk-9-jdk ca-certificates-java

#
#
#

CMD ["bin", "bash"]
