cd /home/dev/poky
source oe-init-build-env rpi-build
cd /home/dev/poky
bitbake-layers craete-layer meta-hello
cd /home/dev/poky/rpi-build
bitbake-layers add-layer ../meta-hello/
mkdir -p /home/dev/poky/meta-hello/recipes-hello/hello/files/
cp /home/dev/host/meta-hello/hello.c /home/dev/poky/meta-hello/recipes-hello/hello/files/
cp /home/dev/host/meta-hello/hello_1.0.bb /home/dev/poky/meta-hello/recipes-hello/hello/
echo 'IMAGE_INSTALL_append = " hello"' >> /home/dev/poky/rpi-build/conf/local.conf
cd /home/dev/poky/rpi-build
bitbake core-image-base
