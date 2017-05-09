#!/usr/bin/env bash
# Install OpenBLAS for Linux in home directory.
# check if the file exists.
# should be changed to /data2/leelab in the future, for all common, but not public files.
INSTALL_PATH="${HOME}/lib/OpenBLAS"
rm -rf "${INSTALL_PATH}"
mkdir -p ${INSTALL_PATH}
TEMP_PATH="${HOME}/openblas-latest.tar.bz2"
curl -k -L -o "${TEMP_PATH}" \
    https://anaconda.org/conda-forge/openblas/0.2.19/download/linux-64/openblas-0.2.19-1.tar.bz2
tar -xjvf "${TEMP_PATH}" -C "${INSTALL_PATH}"
rm -rf "${TEMP_PATH}"
