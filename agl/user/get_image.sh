SCRIPT_DIR="$(cd $(dirname $0); pwd)"
source ${SCRIPT_DIR}/.env
docker cp -L ${CONTAINER_NAME}:/home/dev/AGL/raspberrypi4/tmp/deploy/images/raspberrypi4-64/agl-demo-platform-raspberrypi4-64.wic.xz .
