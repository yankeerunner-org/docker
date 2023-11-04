FROM ghcr.io/yankeerunner-org/yocto:dunfell

# package for build
RUN sudo apt-get update && sudo apt-get install -y curl python

# build setting
COPY setup.sh /home/dev
RUN /home/dev/setup.sh && rm /home/dev/setup.sh
COPY build.sh /home/dev

CMD ["bash"]
