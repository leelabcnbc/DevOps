#!/usr/bin/env bash

# Yimeng Zhang, 2016
# set -o nounset
# set -o errexit
# create a default Python 2 environment for Caffe (at least should work for rc3 and rc4)
# I really wanted to use clone, but somehow it's broken for packages from non-standard channels.
# <https://github.com/conda/conda/issues/2633>
# from <http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in?page=1&tab=votes#tab-top>
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/common.sh"

if [ $# -le 1 ]; then
    if [ $# -eq 0 ]; then
        ENV_NAME='caffe'
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
    "${DIR}/default.sh" "${ENV_NAME}"
fi

. activate "${ENV_NAME}"
# only specify version for opencv and python-flags. python-gflags is claimed to have some some incompatibility with 2.
# so just stick to 2.
conda install --yes --no-update-dependencies --channel conda-forge --show-channel-urls \
    cython opencv=2 \
    snappy leveldb lmdb glog gflags \
    protobuf networkx scikit-image \
    pillow pyyaml boost python-leveldb \
    python-gflags=2
# install a compiler to handle compiling, instead of the old GCC 4.4 on CentOS.
# also add conda-forge to avoid default channel packages superceding those from conda-forge
conda install --yes --no-update-dependencies --channel serge-sans-paille --channel conda-forge --show-channel-urls \
    gcc_49=4.9.1

# seems that dateutil already has a higher version when installing other things...
# so `python-dateutil>=1.4,<2` can't be honored. If pip tries uninstalling newer version,
# then it will still be overwritten by some new packages as well. I believe it doesn't matter.
