FROM jenkins/jenkins:lts

WORKDIR /apps

RUN apt-get update && \
    apt-get -y install sudo

RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

USER docker
CMD /bin/bash

RUN  apt-get update \
    && apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080

ADD . /apps/

