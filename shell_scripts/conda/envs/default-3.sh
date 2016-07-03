#!/usr/bin/env bash

# Yimeng Zhang, 2016

# create a default Python 3 environment for the lab,
# with all important things.
# roughly following https://www.scipy.org/stackspec.html, without Sympy.
# also, no fxxking MKL, and openblas instead.
conda create -n default-3 -y python=3 nomkl numpy scipy matplotlib pandas nose ipython jupyter
