#!/usr/bin/env bash

# Yimeng Zhang, 2016

# set -o nounset
# from <http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in?page=1&tab=votes#tab-top>
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -o errexit

if [ $# -le 1 ]; then
    if [ $# -eq 0 ]; then
    	# 3 means latest version, which is 3.5 as of 10/02/2016.
        ENV_NAME='default-3'
    else
        ENV_NAME=$1
    fi
else
    echo "Usage: $0 [ENV_NAME]"
    exit 1
fi

. ${DIR}/default-env-common.sh

install_default_env ${ENV_NAME} 3.5

echo "done"
