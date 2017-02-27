#!/usr/bin/env bash
# Install CUDNN v5.1.10 for CUDA 8.0 for Linux in home directory.
INSTALL_PATH="${HOME}/lib/cuDNN/v5"
rm -rf ${INSTALL_PATH}
mkdir -p ${INSTALL_PATH}
cd ~
# this is from <https://github.com/NVIDIA/nvidia-docker/blob/master/centos-6/cuda/8.0/devel/cudnn5/Dockerfile>
# I fixed the checksum, see <https://github.com/NVIDIA/nvidia-docker/issues/299>
CUDNN_DOWNLOAD_SUM=c10719b36f2dd6e9ddc63e3189affaa1a94d7d027e63b71c3f64d449ab0645ce && \
curl -fsSL http://developer.download.nvidia.com/compute/redist/cudnn/v5.1/cudnn-8.0-linux-x64-v5.1.tgz -O && \
echo "$CUDNN_DOWNLOAD_SUM  cudnn-8.0-linux-x64-v5.1.tgz" | sha256sum -c - && \
tar -xzvf "cudnn-8.0-linux-x64-v5.1.tgz" -C ${INSTALL_PATH} && \
rm ~/cudnn-8.0-linux-x64-v5.1.tgz
