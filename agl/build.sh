# setup build environment
cd $AGL_TOP/koi

# build setup
source meta-agl/scripts/aglsetup.sh -f -m raspberrypi4 -b raspberrypi4 agl-demo agl-appfw-smack

# if want to customise, please change /build/conf/local.conf file

# build agl-demo-platform
time bitbake agl-demo-platform
cp -R $AGL_TOP/koi/raspberrypi4/tmp/deploy/images/raspberrypi4-64 /home/dev/share/agl
