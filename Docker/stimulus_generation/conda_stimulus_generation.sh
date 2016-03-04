#!/usr/bin/env bash
# scipy 0.17 would make test break... sucks conda.
conda create -y --name stimulus_generation nomkl python numpy=1.9 scipy=0.16 matplotlib ipython nose pip enum34 ipython-notebook pillow scikit-image
conda clean -y --tarballs --packages  # remove all cache.
. activate stimulus_generation
pip install imagen==2.0.1
