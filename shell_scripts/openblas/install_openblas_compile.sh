#!/usr/bin/env bash
# Install OpenBLAS for Linux in home directory.
# check if the file exists.
# should be changed to /data2/leelab in the future, for all common, but not public files.
SOFTWARE_ROOT_PATH="${HOME}/software"
INSTALL_PATH="${HOME}/lib/OpenBLAS/install"
rm -rf "${INSTALL_PATH}"
mkdir -p "${INSTALL_PATH}"
tar -xzvf "${SOFTWARE_ROOT_PATH}/openblas/OpenBLAS-0.2.18.tar.gz" -C ${INSTALL_PATH}
cd "${INSTALL_PATH}"

# below is basically a copy of
# <https://github.com/conda-forge/openblas-feedstock/blob/master/recipe/build.sh>
CF="${CFLAGS}"
unset CFLAGS
make QUIET_MAKE=1 DYNAMIC_ARCH=1 BINARY=64 NO_LAPACK=0 NO_AFFINITY=1 USE_THREAD=1 CFLAGS="${CF}"
