FROM yocto:latest

# package for build
RUN sudo apt-get update && sudo apt-get install -y curl python

# build setting
COPY setup.sh /home/dev
RUN /home/dev/setup.sh && rm /home/dev/setup.sh

CMD ["bash"]
