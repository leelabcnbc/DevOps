# Dockerfile for a GPU-enabled Bazel environment, based on Bazel 0.3.1, and CentOS 6 + CUDA 7.5 + cuDNN v5.


# pull base image
FROM nvidia/cuda:7.5-cudnn5-devel-centos6
MAINTAINER Yimeng Zhang <zym1010@gmail.com>

# install relevant software to build tensorflow and bazel. swig is tensorflow specific.
RUN echo "===> Add relevant software..."  && \
    yum install centos-release-scl && \
    yum install swig java-1.8.0-openjdk-devel devtoolset-4-toolchain zip unzip zlib zlib-devel && \
    yum clean all

# install Bazel
RUN echo "===> install Bazel..."  && \
    cd ~ && curl -k -L -O https://github.com/bazelbuild/bazel/archive/0.3.1.tar.gz && \
   	tar -zxf 0.3.1.tar.gz && rm -rf 0.3.1.tar.gz && cd bazel-0.3.1/ && ./compile.sh && \
   	mkdir -p ~/bin && cp output/bazel ~/bin && rm -rf bazel-0.3.1

# default command: run bash
CMD ["echo", "bazel is at ~/bin"]
