#!/usr/bin/env bash

# Yimeng Zhang, 2016
#set -o nounset
#set -o errexit
# from <http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in?page=1&tab=votes#tab-top>
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
"${DIR}/default-3.sh" theano-tf-3
. activate theano-tf-3
pip install Theano==0.8.2
