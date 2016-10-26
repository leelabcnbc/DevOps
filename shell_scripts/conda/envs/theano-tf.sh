#!/usr/bin/env bash

# Yimeng Zhang, 2016

# from <http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in?page=1&tab=votes#tab-top>
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${DIR}/common.sh"
. "${DIR}/theano-tf-common.sh"

if [ $# -le 1 ]; then
    if [ $# -eq 0 ]; then
        ENV_NAME='theano-tf'
    else
        ENV_NAME=$1
    fi
else
    echo "Usage: $0 [ENV_NAME]"
    exit 1
fi

check_env_exists "${ENV_NAME}"
ENV_EXIST_RESULT=$? # '$?' is the return value of the previous command
if [ "${ENV_EXIST_RESULT}" -eq 1 ]; then
    "${DIR}/default.sh" "${ENV_NAME}"
fi

. activate "${ENV_NAME}"

install_theano_tf 2.7

echo 'done'
