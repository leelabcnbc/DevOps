#!/usr/bin/env bash
# should be changed to /data2/leelab in the future, for all common, but not public files.
#set -o nounset
#set -o errexit
INSTALL_PATH="${HOME}/software/caffe-deepvis-latest"
rm -rf "${INSTALL_PATH}"
mkdir -p "${INSTALL_PATH}"
TEMP_PATH="${HOME}/caffe-deepvis-latest.tar.gz"
# latest as of 03/05/2017
CAFFE_LATEST_COMMIT="e87d437181557f64c10b24f0367d3bc8ddf7fe12"
curl -k -L -o "${TEMP_PATH}" \
    "https://github.com/leelabcnbc/caffe/archive/${CAFFE_LATEST_COMMIT}.tar.gz"
# so we don't end up with caffe-rc3/caffe-rc3
tar -xvzf "${TEMP_PATH}" --strip-components=1 -C "${INSTALL_PATH}"
rm -rf "${TEMP_PATH}"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp "${DIR}/Makefile.config.rc4" "${INSTALL_PATH}/Makefile.config"

cd "${INSTALL_PATH}"

# install caffe env. this is for GPU version on cluster, without needing any GUI. So don't need fancy GUI opencv.
# this will still work even if it exists.
${DIR}/../conda/envs/caffe.sh caffe
# activate cafferc3 env
. activate caffe
# install NCCL (can be done many times)
CC=gcc-4.9 CXX=g++-4.9 ${DIR}/../nccl/install_nccl.sh
# install cuDNN v5 (can be done many times)
${DIR}/../cuda/install_cudnn_v5.sh
# enable cuDNN v5 in the directory
. ${DIR}/../../env_scripts/add_cudnn_v5.sh
# try fixing dynamic linking for opencv's shared libraries (libpng, libjpeg, etc.),
# since they are not available in standard locations.
# the fact that ldd those opencv files can find the libraries just mean that
# when using these programs as the main executable, they can be found?
# check <https://github.com/conda-forge/opencv-feedstock/issues/19> for details.
# add my blas stuff first, so that caffe will link to my blas in anyway.
export LD_LIBRARY_PATH="${HOME}/lib/OpenBLAS/lib:${CONDA_PREFIX}/lib"
sleep 5  # maybe it's good to do this for files to sync?
make all -j12
make test -j12
make pycaffe
