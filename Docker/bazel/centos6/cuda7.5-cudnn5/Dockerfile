# Dockerfile for a GPU-enabled Bazel environment, based on Bazel 0.3.1, and CentOS 6 + CUDA 7.5 + cuDNN v5.
# tag name: leelabcnbc/bazel:0.3.1-cuda7.5-cudnn5-centos6

# pull base image
FROM nvidia/cuda:7.5-cudnn5-devel-centos6
MAINTAINER Yimeng Zhang <zym1010@gmail.com>

# install relevant software to build tensorflow and bazel. swig is tensorflow specific.
RUN echo "===> Add relevant software..."  && \
    yum -y install centos-release-scl && \
    yum -y install swig java-1.8.0-openjdk-devel devtoolset-3-toolchain zip unzip zlib zlib-devel git && \
    yum clean all

COPY CROSSTOOL /tmp/CROSSTOOL

# install Bazel
RUN echo "===> install Bazel..."  && \
    cd ~ && curl -k -L -O https://github.com/bazelbuild/bazel/archive/0.3.1.tar.gz && \
   	tar -zxf 0.3.1.tar.gz && rm -rf 0.3.1.tar.gz && cd bazel-0.3.1/ && cp /tmp/CROSSTOOL tools/cpp/CROSSTOOL && \
   	ls -la tools/cpp/ && \
   	scl enable devtoolset-3 './compile.sh' && \
   	mkdir -p ~/bin && cp output/bazel ~/bin && cd ~ && rm -rf bazel-0.3.1 && rm -rf .cache

# default command: run bash
CMD ["echo", "bazel is at ~/bin"]
