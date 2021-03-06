FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

# package for yocto
RUN apt-get update && apt-get install -y gawk wget git-core diffstat unzip \
    texinfo gcc-multilib build-essential chrpath socat cpio \
    python3 python3-pip python3-pexpect xz-utils debianutils \
    iputils-ping python3-git python3-jinja2 libegl1-mesa \
    libsdl1.2-dev pylint3 xterm python3-subunit mesa-common-dev

# locales setting
RUN apt-get install -y locales \
	&& locale-gen en_US.UTF-8 \
	&& update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LC_ALL   en_US.UTF-8
ENV LANG     en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# user setting
RUN apt-get install -y sudo
ARG username=dev
ARG wkdir=/home/dev
RUN echo "root:root" | chpasswd && \
    adduser --disabled-password --gecos "" "${username}" && \
    echo "${username}:${username}" | chpasswd && \
    echo "%${username}    ALL=(ALL)   NOPASSWD:    ALL" >> /etc/sudoers.d/${username} && \
    chmod 0440 /etc/sudoers.d/${username}
WORKDIR ${wkdir}
RUN chown ${username}:${username} ${wkdir}
USER ${username}

# yocto setting
COPY setup.sh /home/dev
COPY build.sh /home/dev
RUN /home/dev/setup.sh

# develop setting
RUN sudo apt-get install -y vim

CMD ["bash"]
