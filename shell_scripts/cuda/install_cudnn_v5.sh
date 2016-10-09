#!/usr/bin/env bash
# Install CUDNN v5.1 for CUDA 7.5 for Linux in home directory.
INSTALL_PATH="${HOME}/lib/cuDNN/v5"
rm -rf ${INSTALL_PATH}
mkdir -p ${INSTALL_PATH}
cd ~
CUDNN_DOWNLOAD_SUM=40d506d0a8a00a3faccce1433346806b8cd2535683b6f08a63683ce6e474419f && \
curl -fL http://developer.download.nvidia.com/compute/redist/cudnn/v5.1/cudnn-7.5-linux-x64-v5.1.tgz -O && \
echo "$CUDNN_DOWNLOAD_SUM  cudnn-7.5-linux-x64-v5.1.tgz" | sha256sum -c - && \
tar -xzvf "cudnn-7.5-linux-x64-v5.1.tgz" -C ${INSTALL_PATH} && \
rm ~/cudnn-7.5-linux-x64-v5.1.tgz
