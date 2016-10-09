#!/usr/bin/env bash
# Install CUDNN v4.0 for CUDA 7.0+ for Linux in home directory.
INSTALL_PATH="${HOME}/lib/cuDNN/v4"
rm -rf ${INSTALL_PATH}
mkdir -p ${INSTALL_PATH}
cd ~
CUDNN_DOWNLOAD_SUM=4e64ef7716f20c87854b4421863328e17cce633330c319b5e13809b61a36f97d && \
curl -fL http://developer.download.nvidia.com/compute/redist/cudnn/v4/cudnn-7.0-linux-x64-v4.0-prod.tgz -O && \
echo "$CUDNN_DOWNLOAD_SUM  cudnn-7.0-linux-x64-v4.0-prod.tgz" | sha256sum -c - && \
tar -xzvf "cudnn-7.0-linux-x64-v4.0-prod.tgz" -C ${INSTALL_PATH} && \
rm ~/cudnn-7.0-linux-x64-v4.0-prod.tgz
