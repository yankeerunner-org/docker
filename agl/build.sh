# setup build environment
cd $AGL_TOP

# build setup
source meta-agl/scripts/aglsetup.sh -f -m raspberrypi4 -b raspberrypi4 agl-demo

# if want to customise, please change /build/conf/local.conf file
echo 'DL_DIR ?= "/home/dev/share/agl/downloads"' >> $AGL_TOP/raspberrypi4/conf/local.conf
echo 'SSTATE_DIR ?= "/home/dev/share/agl/sstate-cache"' >> $AGL_TOP/raspberrypi4/conf/local.conf

# build agl-demo-platform
time bitbake agl-demo-platform
cp -R $AGL_TOP/raspberrypi4/tmp/deploy/images/raspberrypi4-64 /home/dev/share/agl
