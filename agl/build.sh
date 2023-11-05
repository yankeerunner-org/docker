# setup build environment
source $HOME/.bashrc
cd $AGL_TOP

# build setup
source meta-agl/scripts/aglsetup.sh -f -m raspberrypi4 -b raspberrypi4 agl-demo

# if want to customise, please change /build/conf/local.conf file
echo 'DL_DIR ?= "/home/dev/share/agl/downloads"' >> $AGL_TOP/raspberrypi4/conf/local.conf
echo 'SSTATE_DIR ?= "/home/dev/share/agl/sstate-cache"' >> $AGL_TOP/raspberrypi4/conf/local.conf

# build
time bitbake agl-ivi-demo-platform-flutter
