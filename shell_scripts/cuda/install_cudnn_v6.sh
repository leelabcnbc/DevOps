#!/usr/bin/env bash
# Install CUDNN v6.0.21 for CUDA 8.0 for Linux in home directory.
INSTALL_PATH="${HOME}/lib/cuDNN/v6"
rm -rf ${INSTALL_PATH}
mkdir -p ${INSTALL_PATH}
cd ~
# this is adapted from <https://gitlab.com/nvidia/cuda/blob/centos6/8.0/devel/cudnn6/Dockerfile>
CUDNN_DOWNLOAD_SUM=9b09110af48c9a4d7b6344eb4b3e344daa84987ed6177d5c44319732f3bb7f9c && \
curl -fsSL http://developer.download.nvidia.com/compute/redist/cudnn/v6.0/cudnn-8.0-linux-x64-v6.0.tgz -O && \
echo "$CUDNN_DOWNLOAD_SUM  cudnn-8.0-linux-x64-v6.0.tgz" | sha256sum -c - && \
tar --no-same-owner -xzf cudnn-8.0-linux-x64-v6.0.tgz -C ${INSTALL_PATH} && \
rm ~/cudnn-8.0-linux-x64-v6.0.tgz
