#!/usr/bin/env bash

conda create -y --name stimulus_generation nomkl python numpy scipy matplotlib ipython nose pip enum34 ipython-notebook pillow scikit-image
conda clean -y --tarballs --packages  # remove all cache.
. activate stimulus_generation
pip install imagen==2.0.1
