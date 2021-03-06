FROM ros:melodic

ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i 's#http://tw.archive.ubuntu.com/#http://archive.ubuntu.com/#' /etc/apt/sources.list && \
    apt update && \
    apt install -y \
        dpkg \
        software-properties-common \
        git \
        curl \
        wget \
        lsb-release \
        python3-argcomplete \
        gnupg2 \
        dirmngr \
        g++ \
        fluid \
        build-essential \
        vim \
        tmux \
        python-catkin-tools \
        python-rosdep \
        python-rosinstall-generator \
        python-wstool \
        python-rosinstall \
    && \
    apt upgrade -y && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python
RUN pip install --upgrade tensorflow==2.0.0

ARG DOCKER_UID=1000
ARG DOCKER_USER=docker
ARG DOCKER_PASSWORD=docker
RUN useradd -m --uid ${DOCKER_UID} --groups sudo ${DOCKER_USER} \
  && echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd

USER ${DOCKER_USER}

WORKDIR /home/${DOCKER_USER}
CMD /bin/bash
