#!/usr/bin/env bash

# Yimeng Zhang, 2016

# Tested on Mac OS X 10.9.5 and Ubuntu Docker container 'ubuntu:trusty-20151218' as of 01/16/2016.

# check number of arguments and determine where to install Miniconda.
if [ $# -le 1 ]; then
    if [ $# -eq 0 ]; then
        INSTALL_PATH=${HOME}/miniconda
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

# determine which OS we are using.
OS_STRING=$(uname)
if [ "$OS_STRING" == "Darwin" ]; then
    # Do something under Mac OS X platform
    INSTALLER='./Miniconda-latest-MacOSX-x86_64.sh'
elif [ "$OS_STRING" == "Linux" ]; then
    # Do something under GNU/Linux platform
    INSTALLER='./Miniconda-latest-Linux-x86_64.sh'
else
    # Complain that there is no support, and quit
    echo 'Unsupported OS!'
    exit 1
fi


# do silent installation, under ~/miniconda. However, no PATH is changed.
bash ${INSTALLER} -b -p ${INSTALL_PATH}
# update conda silently with '-y'.
${INSTALL_PATH}/bin/conda update -y conda
