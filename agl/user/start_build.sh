SCRIPT_DIR="$(cd $(dirname $0); pwd)"
source ${SCRIPT_DIR}/.env
docker run --name ${CONTAINER_NAME} -it ghcr.io/yankeerunner-org/agl:dunfell /bin/bash
