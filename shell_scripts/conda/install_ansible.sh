#!/usr/bin/env bash

# Yimeng Zhang, 2016

# check number of arguments and determine where to install Miniconda.
if [ $# -le 1 ]; then
    if [ $# -eq 0 ]; then
        CONDA_PATH=${HOME}/miniconda
    else
        CONDA_PATH=$1
    fi
else
    echo "Usage: $0 [CONDA_PATH]"
    exit 1
fi

# create an environment called ansible.
${CONDA_PATH}/bin/conda create -n ansible -y python pip
source ${CONDA_PATH}/bin/activate ansible
pip install ansible