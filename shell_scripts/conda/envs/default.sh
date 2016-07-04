#!/usr/bin/env bash

# Yimeng Zhang, 2016

# create a default Python 2 environment for the lab,
# with all important things.
# roughly following https://www.scipy.org/stackspec.html, without Sympy.
conda create --yes --channel conda-forge --show-channel-urls -n default \
    python=2 numpy=1.11.0 scipy=0.17.1 matplotlib=1.5.2\
    pandas=0.18.1 nose=1.3.7 notebook=4.2.1 h5py=2.6.0
