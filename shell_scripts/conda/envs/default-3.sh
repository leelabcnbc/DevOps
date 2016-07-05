#!/usr/bin/env bash

# Yimeng Zhang, 2016

set -o nounset
set -o errexit

if [ $# -le 1 ]; then
    if [ $# -eq 0 ]; then
        ENV_NAME='default-3'
    else
        ENV_NAME=$1
    fi
else
    echo "Usage: $0 [ENV_NAME]"
    exit 1
fi

# create a default Python 3 environment for the lab,
# with all important things.
# I need to fix versions, as well as specify channel, so that packages from
# conda-forge will be used.
conda create --yes --channel conda-forge --show-channel-urls -n ${ENV_NAME} \
    python=3 numpy=1.11.0 scipy=0.17.1 matplotlib=1.5.2\
    pandas=0.18.1 nose=1.3.7 notebook=4.2.1 h5py=2.6.0 openblas=0.2.18

# then hack my own openblas...
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
"${DIR}/../../openblas/install_openblas_multithread.sh" /tmp/openblas
# then copy files
STATIC_FILE="${CONDA_ENV_PATH}/lib/libopenblas-r0.2.18.a"
if [ ! -f "${STATIC_FILE}" ]; then
    echo "static library file ${STATIC_FILE} doesn't exist!"
    exit 1
fi
SHARED_FILE="${CONDA_ENV_PATH}/lib/libopenblas-r0.2.18.so"
if [ ! -f "${SHARED_FILE}" ]; then
    echo "shared library file ${SHARED_FILE} doesn't exist!"
    exit 1
fi
mv /tmp/openblas/lib/libopenblasp-r0.2.18.a "${STATIC_FILE}"
mv /tmp/openblas/lib/libopenblasp-r0.2.18.so "${SHARED_FILE}"
