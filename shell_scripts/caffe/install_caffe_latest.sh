#!/usr/bin/env bash
# should be changed to /data2/leelab in the future, for all common, but not public files.
#set -o nounset
#set -o errexit
INSTALL_PATH="${HOME}/software/caffe-latest"
rm -rf "${INSTALL_PATH}"
mkdir -p "${INSTALL_PATH}"
TEMP_PATH="${HOME}/caffe-latest.tar.gz"
# 4ba654f5c88c36ee8ba53964b7faf25c6d7010b4 is latest as of 10/06/2016
CAFFE_LATEST_COMMIT="4ba654f5c88c36ee8ba53964b7faf25c6d7010b4"
curl -k -L -o "${TEMP_PATH}" \
    "https://github.com/BVLC/caffe/archive/${CAFFE_LATEST_COMMIT}.tar.gz"
# so we don't end up with caffe-rc3/caffe-rc3
tar -xvzf "${TEMP_PATH}" --strip-components=1 -C "${INSTALL_PATH}"
rm -rf "${TEMP_PATH}"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# the one for rc3 should do.
cp "${DIR}/Makefile.config.rc3" "${INSTALL_PATH}/Makefile.config"

cd "${INSTALL_PATH}"

# install cafferc3 env
# check whether it exists
if [ ! -d "${HOME}/miniconda2/envs/caffe" ]; then
  ${DIR}/../conda/envs/cafferc3.sh caffe
fi
# activate cafferc3 env
. activate caffe
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
