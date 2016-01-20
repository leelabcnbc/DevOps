#!/usr/bin/env bash

# build image
docker build -t leelabcnbc/vr2014_build .
# run once to get container
docker run --name=leelabcnbc_docker_vr2014 leelabcnbc/vr2014_build
docker export --output="leelabcnbc_docker_vr2014.tar" leelabcnbc_docker_vr2014

# remove all container and image
docker rm leelabcnbc_docker_vr2014
docker rmi vr2014_build

# to run it, first import it
# docker import leelabcnbc_docker_vr2014.tar leelabcnbc/vr2014
# since CMD is lost, now we need to specify a command.
# docker run -i -t leelabcnbc/vr2014 bash