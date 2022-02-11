cd /home/dev/poky
echo 'DL_DIR ?= "/home/dev/share/base/downloads"' >> ./rpi-build/conf/local.conf
echo 'SSTATE_DIR ?= "/home/dev/share/base/sstate-cache"' >> ./rpi-build/conf/local.conf
source oe-init-build-env rpi-build
time bitbake core-image-base
cp -R /home/dev/poky/rpi-build/tmp/deploy/images /home/dev/share/base
