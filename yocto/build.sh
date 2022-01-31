cd /home/dev/poky
echo 'DL_DIR ?= "/home/dev/share/downloads"' >> ./rpi-build/conf/local.conf
echo 'SSTATE_DIR ?= "/home/dev/share/sstate-cache"' >> ./rpi-build/conf/local.conf
source oe-init-build-env rpi-build
time bitbake core-image-base
mkdir -p /home/dev/host/deploy/image
cp /home/dev/poky/rpi-build/tmp/deploy/images/raspberrypi4-64/core-image-base-raspberrypi4-64.wic.bz2 /home/dev/host/deploy/image/core-image-base-raspberrypi4-64.wic.bz2 
mkdir -p /home/dev/share/deploy/image
cp /home/dev/poky/rpi-build/tmp/deploy/images/raspberrypi4-64/core-image-base-raspberrypi4-64.wic.bz2 /home/dev/share/deploy/image/core-image-base-raspberrypi4-64.wic.bz2 
