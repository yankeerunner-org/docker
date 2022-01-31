cd /home/dev/poky
source oe-init-build-env rpi-build
cd /home/dev/poky
bitbake-layers create-layer meta-hello
cd /home/dev/poky/rpi-build
bitbake-layers add-layer ../meta-hello/
mkdir -p /home/dev/poky/meta-hello/recipes-hello/hello/files/
cp /home/dev/host/hello.c /home/dev/poky/meta-hello/recipes-hello/hello/files/
cp /home/dev/host/hello_1.0.bb /home/dev/poky/meta-hello/recipes-hello/hello/

# create yocto config
cat >> /home/dev/poky/rpi-build/conf/local.conf << "EOF"
# image
IMAGE_INSTALL_append = " hello connman connman-client openssh-sftp-server sudo python3 python3-pip rpi-gpio raspi-gpio libstdc++"
IMAGE_FEATURES_append = " ssh-server-openssh"

# user settings
INHERIT_append = " extrausers"
EXTRA_USERS_PARAMS = "useradd -P raspberry pi;usermod -P raspberry root;"

# systemd settings
DISTRO_FEATURES_append = " systemd"
VIRTUAL-RUNTIME_init_manager = "systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
VIRTUAL-RUNTIME_initscripts = ""
IMX_DEFAULT_DISTRO_FEATURES_append = " systemd"

# for c++
TOOLCHAIN_TARGET_TASK_append = " libstdc++-staticdev"

# for cache
DL_DIR ?= "/home/dev/share/downloads"
SSTATE_DIR ?= "/home/dev/share/sstate-cache"
EOF

# OS image build
cd /home/dev/poky/rpi-build
bitbake core-image-base
cp /home/dev/poky/rpi-build/tmp/deploy/images/raspberrypi4-64/core-image-base-raspberrypi4-64.wic.bz2 /home/dev/share/deploy/core-image-base-raspberrypi4-64-hello.wic.bz2

# Tool chain build
cd /home/dev/poky/rpi-build
bitbake core-image-base -c populate_sdk
cp -R /home/dev/poky/rpi-build/tmp/deploy/sdk /home/dev/share/deploy/sdk
