#!/usr/bin/env bash

# Yimeng Zhang, 2016

# set -o nounset
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

# create a default Python 3(.5) environment for the lab,
# with all important things.
# I need to fix versions, as well as specify channel, so that packages from
# conda-forge will be used.
conda create --yes --channel conda-forge --show-channel-urls -n ${ENV_NAME} \
    python=3.5 numpy=1.11.1 scipy=0.17.1 matplotlib=1.5.2\
    pandas=0.18.1 nose=1.3.7 notebook=4.2.1 h5py=2.6.0 openblas=0.2.18 git=2.8.2
