#!/usr/bin/env bash
# Install OpenBLAS for Linux in home directory.
# check if the file exists.
# should be changed to /data2/leelab in the future, for all common, but not public files.
SOFTWARE_ROOT_PATH="${HOME}/software"
INSTALL_PATH="${HOME}/lib/OpenBLAS/install"
BINARY_PATH="${HOME}/lib/OpenBLAS/result"
rm -rf "${INSTALL_PATH}"
mkdir -p "${INSTALL_PATH}"
rm -rf "${BINARY_PATH}"
mkdir -p "${BINARY_PATH}"
tar -xzvf "${SOFTWARE_ROOT_PATH}/openblas/OpenBLAS-0.2.18.tar.gz" --strip-components=1  -C ${INSTALL_PATH}
cd "${INSTALL_PATH}"

# below is basically a copy of
# <https://github.com/conda-forge/openblas-feedstock/blob/master/recipe/build.sh>
CF="${CFLAGS}"
unset CFLAGS
make QUIET_MAKE=1 DYNAMIC_ARCH=1 BINARY=64 NO_LAPACK=0 NO_AFFINITY=1 USE_THREAD=1 CFLAGS="${CF}"
make PREFIX="${BINARY_PATH}" install
cd "${BINARY_PATH}"/..
# create result under ~/lib/OpenBLAS
tar -cjvf OpenBLAS-0.2.18-multithread.tar.bz2 -C "${BINARY_PATH}"  .
