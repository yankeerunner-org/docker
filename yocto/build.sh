cd /home/dev/poky
echo 'DL_DIR ?= "/home/dev/downloads"' >> ./rpi-build/conf/local.conf
echo 'SSTATE_DIR ?= "/home/dev/sstate-cache"' >> ./rpi-build/conf/local.conf
# source oe-init-build-env rpi-build
# time bitbake core-image-base
# XXX
mkdir -p /home/dev/downloads
mkdir -p /home/dev/sstate-cache
mkdir -p /home/dev/image
mkdir -p /home/dev/sdk
touch /home/dev/downloads/sample-file
touch /home/dev/sstate-cache/sample-file
touch /home/dev/image/sample-file
touch /home/dev/sdk/sample-file
cp -R /home/dev/downloads /home/dev/host
cp -R /home/dev/sstate-cache /home/dev/host
cp -R /home/dev/image /home/dev/host
cp -R /home/dev/sdk /home/dev/host
# XXX

# cp -R /home/dev/downloads /home/dev/host
# cp -R /home/dev/sstate-cache /home/dev/host
# cp -R /home/dev/poky/rpi-build/tmp/deploy/images /home/dev/host
