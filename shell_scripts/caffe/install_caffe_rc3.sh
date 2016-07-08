#!/usr/bin/env bash
# should be changed to /data2/leelab in the future, for all common, but not public files.
#set -o nounset
#set -o errexit
SOFTWARE_ROOT_PATH="/data2/leelab/software"  # this is for software source, not their destination.
INSTALL_PATH="${HOME}/software/caffe-rc3"
rm -rf "${INSTALL_PATH}"
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
# try fixing dynamic linking for opencv's shared libraries (libpng, libjpeg, etc.),
# since they are not available in standard locations.
# the fact that ldd those opencv files can find the libraries just mean that
# when using these programs as the main executable, they can be found?
# check <https://github.com/conda-forge/opencv-feedstock/issues/19> for details.
# add my blas stuff first, so that caffe will link to my blas in anyway.
export LD_LIBRARY_PATH="${HOME}/lib/OpenBLAS/lib:${CONDA_ENV_PATH}/lib"
sleep 5  # maybe it's good to do this for files to sync?
make all -j12
make test -j12
make pycaffe
