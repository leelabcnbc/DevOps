#!/usr/bin/env bash
# Install CUDA 7.5 for Linux in home directory.
# check if the file exists.
# should be changed to /data2/leelab in the future, for all common, but not public files.
SOFTWARE_ROOT_PATH="/data2/leelab/software"
INSTALL_PATH="${HOME}/lib/cuDNN/v5"
# clean, since previously I installed cuDNN v5.0 before.
rm -rf ${INSTALL_PATH}
mkdir -p ${INSTALL_PATH}
tar -xzvf "${SOFTWARE_ROOT_PATH}/cudnn/cudnn-7.5-linux-x64-v5.1.tgz" -C ${INSTALL_PATH}
