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
mkdir koi
cd koi
repo init -b koi -m koi_11.0.1.xml -u https://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo
repo sync

# cutting edge...
#cd $AGL_TOP
#mkdir master
#cd master
#repo init -u https://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo
#repo sync

# setup build environment
cd $AGL_TOP/koi

# build setup
source meta-agl/scripts/aglsetup.sh -f -m raspberrypi4 -b raspberrypi4 agl-demo agl-appfw-smack

# if want to customise, please change /build/conf/local.conf file
echo 'DL_DIR ?= "/home/dev/share/agl/downloads"' >> $AGL_TOP/koi/raspberrypi4/conf/local.conf
echo 'SSTATE_DIR ?= "/home/dev/share/agl/sstate-cache"' >> $AGL_TOP/koi/raspberrypi4/conf/local.conf

# build agl-demo-platform
time bitbake agl-demo-platform
cp -R $AGL_TOP/koi/raspberrypi4/tmp/deploy/images/raspberrypi4-64 /home/dev/share/agl
