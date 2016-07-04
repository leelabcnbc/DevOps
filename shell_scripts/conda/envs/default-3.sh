#!/usr/bin/env bash

# Yimeng Zhang, 2016

# create a default Python 3 environment for the lab,
# with all important things.
# I need to fix versions, as well as specify channel, so that packages from
# conda-forge will be used.
conda create --yes --channel conda-forge --show-channel-urls -n default-3 \
    python=3 numpy=1.11.0 scipy=0.17.1 matplotlib=1.5.2\
    pandas=0.18.1 nose=1.3.7 notebook=4.2.1 h5py=2.6.0
