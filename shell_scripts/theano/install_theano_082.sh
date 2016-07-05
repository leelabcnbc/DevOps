#!/usr/bin/env bash

# install cuDNN v5 (can be done many times)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
${DIR}/../cuda/install_cudnn_v5.sh
cp "${DIR}/theanorc" "${HOME}/.theanorc"
