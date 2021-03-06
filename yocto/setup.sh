git clone git://git.yoctoproject.org/poky
cd /home/dev/poky
git checkout origin/gatesgarth -b gatesgarth
git clone git://git.yoctoproject.org/meta-raspberrypi
cd /home/dev/poky/meta-raspberrypi/
git checkout origin/gatesgarth -b gatesgarth
cd /home/dev/poky
git clone git://git.openembedded.org/meta-openembedded
source oe-init-build-env rpi-build
bitbake-layers add-layer ../meta-raspberrypi/
bitbake-layers add-layer ../meta-openembedded/meta-oe
bitbake-layers add-layer ../meta-openembedded/meta-python
bitbake-layers add-layer ../meta-openembedded/meta-multimedia
bitbake-layers add-layer ../meta-openembedded/meta-networking
sed -i -e "s/qemux86-64/raspberrypi4-64/g" /home/dev/poky/rpi-build/conf/local.conf
