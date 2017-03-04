#!/usr/bin/env bash

# Yimeng Zhang, 2016
# set -o nounset
# set -o errexit
# create a default Python 3 environment for torch (maybe later for PyTorch as well, which supports Python 3)
# I really wanted to use clone, but somehow it's broken for packages from non-standard channels.
# <https://github.com/conda/conda/issues/2633>
# from <http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in?page=1&tab=votes#tab-top>
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/common.sh"

if [ $# -le 1 ]; then
    if [ $# -eq 0 ]; then
        ENV_NAME='torch'
    else
        ENV_NAME=$1
    fi
else
    echo "Usage: $0 [ENV_NAME]"
    exit 1
fi
check_env_exists "${ENV_NAME}"
ENV_EXIST_RESULT=$? # '$?' is the return value of the previous command
if [ "${ENV_EXIST_RESULT}" -eq 1 ]; then
    "${DIR}/default3.sh" "${ENV_NAME}"
fi

. activate "${ENV_NAME}"
conda install --yes --no-update-dependencies --channel conda-forge --show-channel-urls \
    fftw=3.3.6 sox=14.4.2 cmake=3.7.1 gnuplot=5.0.5 unzip=6.0
# install a compiler to handle compiling, instead of the old GCC 4.4 on CentOS.
# also add conda-forge to avoid default channel packages superceding those from conda-forge
conda install --yes --no-update-dependencies --channel serge-sans-paille --channel conda-forge --show-channel-urls \
    gcc_49=4.9.1
