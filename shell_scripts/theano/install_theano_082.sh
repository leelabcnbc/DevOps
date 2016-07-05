#!/usr/bin/env bash

# install cuDNN v5 (can be done many times)
${DIR}/../cuda/install_cudnn_v5.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp "${DIR}/theanorc" "${HOME}/.theanorc"
