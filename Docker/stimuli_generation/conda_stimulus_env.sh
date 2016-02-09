#!/usr/bin/env bash

conda create -y --name stimulus_env python numpy scipy matplotlib ipython nose pip enum34 ipython-notebook pillow scikit-image
. activate stimulus_env
pip install imagen==2.0.1
