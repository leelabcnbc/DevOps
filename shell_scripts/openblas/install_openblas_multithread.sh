#!/usr/bin/env bash

set -o nounset
set -o errexit

# Install OpenBLAS for Linux in home directory.
# check if the file exists.
# should be changed to /data2/leelab in the future, for all common, but not public files.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Yimeng Zhang, 2016
if [ $# -le 1 ]; then
    if [ $# -eq 0 ]; then
        INSTALL_PATH="${HOME}/lib/OpenBLAS"
    else
        INSTALL_PATH=$1
    fi
else
    echo "Usage: $0 [INSTALL_PATH]"
    exit 1
fi

mkdir -p "${INSTALL_PATH}"
tar -xjvf "${DIR}/OpenBLAS-0.2.18-multithread.tar.bz2" -C ${INSTALL_PATH}
