cd /home/dev/poky
source oe-init-build-env rpi-build
bitbake core-image-base
cp /home/dev/poky/rpi-build/tmp/deploy/images/raspberrypi4-64/core-image-base-raspberrypi4-64.wic.bz2 /home/dev/host/deploy
