# define top level directory
export AGL_TOP=$HOME/AGL
echo 'export AGL_TOP=$HOME/AGL' >> $HOME/.bashrc
mkdir -p $AGL_TOP

# download the repo tool and set permissions
mkdir -p $HOME/bin
export PATH=$HOME/bin:$PATH
echo 'export PATH=$HOME/bin:$PATH' >> $HOME/.bashrc
curl https://storage.googleapis.com/git-repo-downloads/repo > $HOME/bin/repo
chmod a+x $HOME/bin/repo

# download the agl source files
# stable release
cd $AGL_TOP
repo init -b marlin -m marlin_13.0.0.xml -u https://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo
repo sync

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
