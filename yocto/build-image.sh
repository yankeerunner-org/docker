docker run --rm -v "$(cd $(dirname $0); pwd):/home/dev/host" -v "${HOME}/develop/yocto/share:/home/dev/share" -e TZ=Asia/Tokyo yocto:dunfell /bin/bash /home/dev/host/build.sh