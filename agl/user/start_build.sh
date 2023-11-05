SCRIPT_DIR="$(cd $(dirname $0); pwd)"
source ${SCRIPT_DIR}/.env
if [ "$(docker ps -a | grep ${CONTAINER_NAME})" ] ; then
  echo "found container. remove it. name=${CONTAINER_NAME}"
  docker rm ${CONTAINER_NAME} -f
else
  echo "not found container. ignore it. name=${CONTAINER_NAME}"
fi
docker run --name ${CONTAINER_NAME} -it ghcr.io/yankeerunner-org/agl:latest /bin/bash -i -c "/home/dev/build.sh && /bin/bash"
