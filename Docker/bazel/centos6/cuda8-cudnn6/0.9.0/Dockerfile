# Dockerfile for a GPU-enabled Bazel environment, based on Bazel 0.4.3, and CentOS 6 + CUDA 8.0 + cuDNN v5.
# tag name: leelabcnbc/bazel:0.9.0-cuda8.0-cudnn5-centos6
# don't use 0.4.4 for building tensorflow. see <https://github.com/bazelbuild/bazel/issues/2478>.

# pull base image
FROM nvidia/cuda:8.0-cudnn6-devel-centos6
MAINTAINER Yimeng Zhang <zym1010@gmail.com>

# install relevant software to build tensorflow and bazel.
# java has to be low enough
# https://github.com/bazelbuild/bazel/issues/4483
RUN echo "===> Add relevant software..."  && \
    yum -y install centos-release-scl && \
    yum -y install java-1.8.0-openjdk-devel-1.8.0.151 devtoolset-3-toolchain zip unzip zlib zlib-devel git patch && \
    yum clean all

COPY CROSSTOOL /tmp/CROSSTOOL

# install Bazel
RUN echo "===> install Bazel..."  && \
    cd ~ && curl -k -L -O https://github.com/bazelbuild/bazel/releases/download/0.9.0/bazel-0.9.0-dist.zip && \
    unzip bazel-0.9.0-dist.zip -d bazel-0.9.0-dist && rm -rf bazel-0.9.0-dist.zip && cd bazel-0.9.0-dist/ && cp /tmp/CROSSTOOL tools/cpp/CROSSTOOL && \
   	ls -la tools/cpp/ && \
   	scl enable devtoolset-3 './compile.sh' && \
   	mkdir -p ~/bin && cp output/bazel ~/bin && cd ~ && rm -rf bazel-0.9.0-dist && rm -rf .cache

# default command: run bash
CMD ["echo", "bazel is at ~/bin"]
