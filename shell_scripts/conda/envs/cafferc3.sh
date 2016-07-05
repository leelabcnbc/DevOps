#!/usr/bin/env bash

# Yimeng Zhang, 2016

# create a default Python 2 environment for Caffe rc3
# I really wanted to use clone, but somehow it's broken for packages from non-standard channels.
# from <http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in?page=1&tab=votes#tab-top>
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
"${DIR}/default.sh" cafferc3
. activate cafferc3
conda install --yes --channel conda-forge --show-channel-urls \
    cython=0.24 opencv=2.4.12 \
    snappy=1.1.3 leveldb=1.18 lmdb=0.9.18 glog=0.3.4 gflags=2.1.2 \
    libprotobuf=2.5.0 networkx=1.11 scikit-image=0.12.3 \
    pillow=3.2.0 pyyaml=3.11 boost=1.61.0 python-leveldb=0.193 \
    python-gflags=2.0
# install a matching protobuf version.
# YOU SHOULD NOT install protobuf 3, at least not for libprotobuf, whose protoc will break RC3.
# I think this is because somehow protobuf is not compatible with GCC 4.6,
# since after I changed to GCC 4.9, it worked...
pip install protobuf==2.5.0

# six is already installed, so skip.

# seems that dateutil already has a higher version when installing other things...
# so `python-dateutil>=1.4,<2` can't be honored. If pip tries uninstalling newer version,
# then it will still be overwritten by some new packages as well. I believe it doesn't matter.
