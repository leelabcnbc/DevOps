#!/usr/bin/env bash
# should be changed to /data2/leelab in the future, for all common, but not public files.
#set -o nounset
#set -o errexit

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $# -le 1 ]; then
    if [ $# -eq 0 ]; then
        ENV_SETTING="2"
    else
        if [ "$1" != "2" -a "$1" != "3" ]; then
            "only 2 and 3 are supported"
            exit 1
        fi
        ENV_SETTING="$1"
    fi
else
    echo "Usage: $0 [ENV_SETTING] (2 or 3)"
    exit 1
fi


if [ "$ENV_SETTING" == "2" ]; then
    INSTALL_PATH="${HOME}/software/caffe-latest"
    ENV_NAME="caffe"
    CONFIG_FILE="${DIR}/Makefile.config.py2"
elif [ "$ENV_SETTING" == "3" ]; then
    INSTALL_PATH="${HOME}/software/caffe-3-latest"
    ENV_NAME="caffe-3"
    CONFIG_FILE="${DIR}/Makefile.config.py3"
fi

rm -rf "${INSTALL_PATH}"
mkdir -p "${INSTALL_PATH}"
TEMP_PATH="${HOME}/caffe-latest.tar.gz"
# latest as of 01/26/2017
CAFFE_LATEST_COMMIT="91b09280f5233cafc62954c98ce8bc4c204e7475"
curl -k -L -o "${TEMP_PATH}" \
    "https://github.com/BVLC/caffe/archive/${CAFFE_LATEST_COMMIT}.tar.gz"
# so we don't end up with caffe-rc3/caffe-rc3
tar -xvzf "${TEMP_PATH}" --strip-components=1 -C "${INSTALL_PATH}"
rm -rf "${TEMP_PATH}"

cp "${CONFIG_FILE}" "${INSTALL_PATH}/Makefile.config"

cd "${INSTALL_PATH}"

# install caffe env
# this will still work even if it exists.
${DIR}/../conda/envs/caffe.sh "${ENV_NAME}" "${ENV_SETTING}"
# activate cafferc3 env
. activate "${ENV_NAME}"
# install NCCL (can be done many times)
CC=gcc-4.9 CXX=g++-4.9 ${DIR}/../nccl/install_nccl.sh
# install cuDNN v6 (can be done many times)
${DIR}/../cuda/install_cudnn_v6.sh
# enable cuDNN v6 in the directory
. ${DIR}/../../env_scripts/add_cudnn_v6.sh
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
