FROM yocto:dunfell

# package for build
RUN sudo apt-get update && sudo apt-get install -y curl python

# build setting
COPY setup.sh /home/dev
RUN /home/dev/setup.sh && rm /home/dev/setup.sh
COPY build.sh /home/dev

## SDK setting
#RUN mkdir /home/dev/agl-app && \
#	cp /home/dev/Downloads/poky-agl-glibc-x86_64-agl-demo-platform-crosssdk-corei7-64-qemux86-64-toolchain-10.90.0+snapshot.sh /home/dev/agl-app/ && \
#	cd /home/dev/agl-app && \
#	chmod 777 poky-agl-glibc-x86_64-agl-demo-platform-crosssdk-corei7-64-qemux86-64-toolchain-10.90.0+snapshot.sh && \
#	mkdir agl-sdk/ && \
#	yes | ./poky-agl-glibc-x86_64-agl-demo-platform-crosssdk-corei7-64-qemux86-64-toolchain-10.90.0+snapshot.sh && \
#	source /home/dev/agl-app/agl-sdk/environment-setup-corei7-64-agl-linux

CMD ["bash"]
