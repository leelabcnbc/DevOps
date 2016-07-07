#!/usr/bin/env bash

# install cuDNN v5 (can be done many times)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
${DIR}/../cuda/install_cudnn_v5.sh
echo -e  "[cuda]\nroot = ${HOME}/cuda\n[global]\ndevice = gpu0\nfloatX = float32\nbase_compiledir = /tmp/.theano_${USER}"  >  "${HOME}/.theanorc"
