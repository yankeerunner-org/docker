cd /home/dev/poky
source oe-init-build-env rpi-build
echo 'DL_DIR ?= "/home/dev/share/downloads"' >> ./rpi-build/conf/local.conf
echo 'SSTATE_DIR ?= "/home/dev/share/sstate-cache"' >> ./rpi-build/conf/local.conf
time bitbake core-image-base
cp /home/dev/poky/rpi-build/tmp/deploy/images/raspberrypi4-64/core-image-base-raspberrypi4-64.wic.bz2 /home/dev/host/deploy
