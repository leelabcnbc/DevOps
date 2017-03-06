#!/usr/bin/env bash
# should be changed to /data2/leelab in the future, for all common, but not public files.
#set -o nounset
#set -o errexit
INSTALL_PATH="${HOME}/software/caffe-deepvis-cpu-latest"
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
cp "${DIR}/Makefile.config.rc4.deepvis_cpu" "${INSTALL_PATH}/Makefile.config"

cd "${INSTALL_PATH}"
${DIR}/../conda/envs/caffe-deepvis.sh caffe-deepvis

. activate caffe-deepvis
# try fixing dynamic linking for opencv's shared libraries (libpng, libjpeg, etc.),
# since they are not available in standard locations.
# the fact that ldd those opencv files can find the libraries just mean that
# when using these programs as the main executable, they can be found?
# check <https://github.com/conda-forge/opencv-feedstock/issues/19> for details.
# add my blas stuff first, so that caffe will link to my blas in anyway.
export LD_LIBRARY_PATH="${HOME}/lib/OpenBLAS/lib:${CONDA_PREFIX}/lib"
sleep 5  # maybe it's good to do this for files to sync?
# don't use j; seems that on yimengzh.cnbc.cmu.edu, this can sometimes cause error in building
# <http://blog.csdn.net/ThomasCai001/article/details/53940430>
make all -j24
make pycaffe
