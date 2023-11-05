git clone git://git.yoctoproject.org/poky -b kirkstone
cd /home/dev/poky
git clone git://git.yoctoproject.org/meta-raspberrypi -b kirkstone
git clone git://git.openembedded.org/meta-openembedded -b kirkstone
source oe-init-build-env rpi-build
bitbake-layers add-layer ../meta-raspberrypi/
bitbake-layers add-layer ../meta-openembedded/meta-oe
bitbake-layers add-layer ../meta-openembedded/meta-python
bitbake-layers add-layer ../meta-openembedded/meta-multimedia
bitbake-layers add-layer ../meta-openembedded/meta-networking
sed -i -e "s/qemux86-64/raspberrypi4-64/g" /home/dev/poky/rpi-build/conf/local.conf
