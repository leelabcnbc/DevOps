#!/usr/bin/env bash

CONTAINER_NAME=leelabcnbc_docker_vr2014
IMAGE_BUILD_NAME=leelabcnbc/vr2014_build

# build image
docker build -t leelabcnbc/vr2014_build .
# run once to get container
docker run --name=${CONTAINER_NAME} ${IMAGE_BUILD_NAME}
docker export --output="${CONTAINER_NAME}.tar" ${CONTAINER_NAME}

# remove all container and image
docker rm ${CONTAINER_NAME}
docker rmi ${IMAGE_BUILD_NAME}
# to run it, first import it
# docker import leelabcnbc_docker_vr2014.tar leelabcnbc/vr2014
# since CMD is lost, now we need to specify a command.
# docker run -i -t leelabcnbc/vr2014 bash