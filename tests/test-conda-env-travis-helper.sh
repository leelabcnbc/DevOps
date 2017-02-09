#!/usr/bin/env bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 [PYVERSION]"
    exit 1
fi

if [ "$1" == "2.7" ]; then
	./test-conda-env-common-wrapper.sh default
elif [ "$1" == "3.5" ]; then
	./test-conda-env-common-wrapper.sh default-3
else
	echo "Unsupported version $1"
	exit 1
fi