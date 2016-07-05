#!/usr/bin/env bash
# Install OpenBLAS for Linux in home directory.
# check if the file exists.
# should be changed to /data2/leelab in the future, for all common, but not public files.
SOFTWARE_ROOT_PATH="${HOME}/software"
INSTALL_PATH="${HOME}/lib/OpenBLAS"
mkdir -p ${INSTALL_PATH}
tar -xjvf "${SOFTWARE_ROOT_PATH}/openblas/linux-64-openblas-0.2.18-2.tar.bz2" -C ${INSTALL_PATH}
