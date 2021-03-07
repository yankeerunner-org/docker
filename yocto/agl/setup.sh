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
# staple release
cd $AGL_TOP
mkdir jellyfish
cd jellyfish
repo init -b jellyfish -u https://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo
repo sync

# cutting edge...
#cd $AGL_TOP
#mkdir master
#cd master
#repo init -u https://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo
#repo sync
