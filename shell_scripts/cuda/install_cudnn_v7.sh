#!/usr/bin/env bash
# Install CUDNN v7.0.5.15 for CUDA 9.0 for Linux in home directory.
INSTALL_PATH="${HOME}/lib/cuDNN/v7"
rm -rf ${INSTALL_PATH}
mkdir -p ${INSTALL_PATH}
cd ~
# this is adapted from <https://gitlab.com/nvidia/cuda/blob/centos6/9.0/devel/cudnn7/Dockerfile>
CUDNN_DOWNLOAD_SUM=1a3e076447d5b9860c73d9bebe7087ffcb7b0c8814fd1e506096435a2ad9ab0e && \
curl -fsSL http://developer.download.nvidia.com/compute/redist/cudnn/v7.0.5/cudnn-9.0-linux-x64-v7.tgz -O && \
echo "$CUDNN_DOWNLOAD_SUM  cudnn-9.0-linux-x64-v7.tgz" | sha256sum -c - && \
tar --no-same-owner -xzf cudnn-9.0-linux-x64-v7.tgz -C ${INSTALL_PATH} && \
rm ~/cudnn-9.0-linux-x64-v7.tgz
