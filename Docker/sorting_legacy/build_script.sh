#!/usr/bin/env bash

CONTAINER_NAME=leelabcnbc_sorting_legacy
IMAGE_BUILD_NAME=leelabcnbc/sorting_legacy_build

# build image
docker build -t ${IMAGE_BUILD_NAME} .
# run once to get container
docker run --name=${CONTAINER_NAME} ${IMAGE_BUILD_NAME}
docker export --output="${CONTAINER_NAME}.tar" ${CONTAINER_NAME}

# remove all container and image
docker rm ${CONTAINER_NAME}
docker rmi ${IMAGE_BUILD_NAME}
# to run it, first import it
# docker import leelabcnbc_sorting_legacy.tar leelabcnbc/sorting_legacy
# since CMD is lost, now we need to specify a command.
# it should be the vnc one to start the VNC server.
# also, we need to expose the port for VNC.
# docker run -p 5901:5901 -d --name=sorting_legacy leelabcnbc/sorting_legacy /opt/vnc.sh