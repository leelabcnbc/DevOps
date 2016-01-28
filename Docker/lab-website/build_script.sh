#!/usr/bin/env bash

IMAGE_BUILD_NAME=leelabcnbc/lab-website

# build image
docker build -t ${IMAGE_BUILD_NAME} .
# after this (when using Dockerfile_old), I manually tar the /tmp/nodes_modules into node_modules.tar.gz.

# run the container like this.
# docker run --rm -v /vagrant:/srv/jekyll -it -p 4000:4000 leelabcnbc/lab-website
# where /vagrant has the website folder

# when running, use the following to extract nodes_modules (zxvpf, not xvpf).
# Perhaps this is due to Apline Linux's problem on tar.
# tar zxvpf node_modules.tar.gz -C node_modules/
