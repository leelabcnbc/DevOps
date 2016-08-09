#!/usr/bin/env bash

# Yimeng Zhang, 2016

# Should work under Linux.
set -o nounset
set -o errexit
# check number of arguments and determine where to install Miniconda.
if [ $# -le 1 ]; then
    if [ $# -eq 0 ]; then
        INSTALL_PATH=${HOME}/miniconda2
    else
        INSTALL_PATH=$1
    fi
else
    echo "Usage: $0 [INSTALL_PATH]"
    exit 1
fi

# check if Miniconda is already installed.
if [ -e "${INSTALL_PATH}" ]; then
    echo 'Miniconda already installed under '"${INSTALL_PATH}"'!'
    exit 1
fi

# download a stable one, not latest, to prevent surprises.
# follow <https://github.com/ReactionMechanismGenerator/RMG-tests/issues/18>
INSTALLER='Miniconda2-4.0.5-Linux-x86_64.sh'
cd ~
rm -rf ~/${INSTALLER}
wget http://repo.continuum.io/miniconda/${INSTALLER}
# do silent installation. However, no PATH is changed.
bash ${INSTALLER} -b -p ${INSTALL_PATH}
# this version doesn't have problem of cloning stuff from other channels.
${INSTALL_PATH}/bin/conda install -y conda=4.0.11

echo "for convenience, add 'export PATH=${INSTALL_PATH}/bin:\$PATH' under appropriate file, such as .bashrc or .profile"
echo "do this by yourself, as this varies from system to system, and may break the existing system."
