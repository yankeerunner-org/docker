# setup build environment
source meta-agl/scripts/aglsetup.sh -f -m raspberrypi4 -b raspberrypi4 agl-demo agl-devel
echo '# reuse download directories' >> $AGL_TOP/site.conf
echo 'DL_DIR = "$HOME/downloads/"' >> $AGL_TOP/site.conf
echo 'SSTATE_DIR = "$AGL_TOP/sstate-cache/"' >> $AGL_TOP/site.conf
ln -sf $AGL_TOP/site.conf conf/

# if want to customise, please change /build/conf/local.conf file

# build agl-demo-platform
time bitbake agl-demo-platform
