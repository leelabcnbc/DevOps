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

# install cafferc3 env
${DIR}/../conda/envs/cafferc3.sh
# activate cafferc3 env
. activate cafferc3
# install cuDNN v4 (can be done many times)
${DIR}/../cuda/install_cudnn_v4.sh
# enable cuDNN v4 in the directory
. ${DIR}/../../env_scripts/add_cudnn_v4.sh
# try fixing LDFLAGS for opencv, for some reason. Whatever...
export LDFLAGS="-Wl,-rpath,${HOME}/miniconda2/envs/cafferc3/lib"
sleep 5  # maybe it's good to do this for files to sync?
make all -j12
make test -j12
make pycaffe
