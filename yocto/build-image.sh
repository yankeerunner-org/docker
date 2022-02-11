docker pull ghcr.io/yankeerunner-org/yocto:dunfell
docker run --rm -v "$(cd $(dirname $0); pwd):/home/dev/host" -v "${HOME}/develop/yocto/share:/home/dev/share" -e TZ=Asia/Tokyo ghcr.io/yankeerunner-org/yocto:dunfell /bin/bash /home/dev/host/build.sh
