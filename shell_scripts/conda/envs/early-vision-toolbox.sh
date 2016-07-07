#!/usr/bin/env bash
#set -o nounset
#set -o errexit

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $# -le 1 ]; then
    if [ $# -eq 0 ]; then
        ENV_NAME='early-vision-toolbox'
    else
        ENV_NAME=$1
    fi
else
    echo "Usage: $0 [ENV_NAME]"
    exit 1
fi

# install cafferc3 env
"${DIR}/cafferc3.sh" "${ENV_NAME}"
# activate cafferc3 env
. activate "${ENV_NAME}"
# nope, since I assume you must have installed Caffe before...
# ${DIR}/../cuda/install_cudnn_v4.sh
# install spams
conda install -c conda-forge python-spams=2.5
