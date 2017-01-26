#!/usr/bin/env bash
# Install NCCL for Linux in home directory. Only works for CUDA 8.0 now.
# this is required for newer Caffe.
INSTALL_PATH="${HOME}/lib/nccl"
rm -rf "${INSTALL_PATH}"
COMPILE_PATH="${HOME}/lib/nccl-src"
rm -rf "${COMPILE_PATH}"
mkdir -p "${COMPILE_PATH}"
mkdir -p "${INSTALL_PATH}"
TEMP_PATH="${HOME}/nccl-latest.tar.gz"
# latest one tested against Caffe
NCCL_LATEST_COMMIT="v1.2.3-1+cuda8.0"
curl -k -L -o "${TEMP_PATH}" \
    "https://github.com/NVIDIA/nccl/archive/${NCCL_LATEST_COMMIT}.tar.gz"
# so we don't end up with caffe-rc3/caffe-rc3
tar -xvzf "${TEMP_PATH}" --strip-components=1 -C "${COMPILE_PATH}"
rm -rf "${TEMP_PATH}"
# then let's make it
cd "${COMPILE_PATH}"

# actually I don't understand why I need to set this LIBRARY_PATH.
# but whatever.
# don't use ~ inside double quote. use ${HOME}!!!!
# see <http://unix.stackexchange.com/questions/151850/why-doesnt-the-tilde-expand-inside-double-quotes>
make CUDA_HOME="${HOME}/cuda-8.0" test -j12
make PREFIX="${INSTALL_PATH}" install -j12
rm -rf "${COMPILE_PATH}"
