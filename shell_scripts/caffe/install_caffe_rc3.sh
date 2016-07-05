#!/usr/bin/env bash

# should be changed to /data2/leelab in the future, for all common, but not public files.
SOFTWARE_ROOT_PATH="${HOME}/software"  # this is for software source, not their destination.

INSTALL_PATH="${HOME}/software/caffe-rc3"
mkdir -p "${INSTALL_PATH}"
# so we don't end up with caffe-rc3/caffe-rc3
tar -xvzf "${SOFTWARE_ROOT_PATH}/caffe/caffe-rc3.tar.gz" --strip-components=1 -C "${INSTALL_PATH}"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp "${DIR}/Makefile.config.rc3" "${INSTALL_PATH}/Makefile.config"

cd "${INSTALL_PATH}"

# enable cuDNN v4 in the directory
. ${DIR}/../../env_scripts/add_cudnn_v4.sh

make all -j8
make test -j8
make pycaffe
