FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

# packages
RUN apt-get update && apt-get install -y gawk wget git-core diffstat unzip \
    texinfo gcc-multilib build-essential chrpath socat cpio \
    python3 python3-pip python3-pexpect xz-utils debianutils \
    iputils-ping python3-git python3-jinja2 libegl1-mesa \
    libsdl1.2-dev pylint3 xterm python3-subunit mesa-common-dev

# locales
RUN apt-get install -y locales \
	&& locale-gen en_US.UTF-8 \
	&& update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LC_ALL   en_US.UTF-8
ENV LANG     en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# user
RUN groupadd -g 1000 dev \
    && useradd -u 1000 -g dev -d /home/dev dev \
    && mkdir /home/dev \
    && chown -R dev:dev /home/dev
USER dev
WORKDIR /home/dev

# for build
COPY build.sh /home/dev
