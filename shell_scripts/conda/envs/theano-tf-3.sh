#!/usr/bin/env bash

# Yimeng Zhang, 2016
#set -o nounset
#set -o errexit
# from <http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in?page=1&tab=votes#tab-top>
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
"${DIR}/default-3.sh" theano-tf-3
. activate theano-tf-3
pip install Theano==0.8.2 nose-parameterized==0.5.0

# install tensorflow
# this will install GPU version, for Python 3.5 (only), 0.9
conda install --yes --channel conda-forge --no-update-dependencies protobuf=3.0.0b2.post2
export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.9.0-cp35-cp35m-linux_x86_64.whl
# don't upgrade dependencies as in the official doc.
pip install $TF_BINARY_URL
