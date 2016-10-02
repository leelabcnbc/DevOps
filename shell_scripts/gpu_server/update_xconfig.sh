#!/usr/bin/env bash

# update xconfig, from pp. 16 of http://www.nvidia.com/content/pdf/remote-viz-tesla-gpus.pdf
# PCI:3:0:0 is location of Titan Black on yimengzh.cnbc.cmu.edu
sudo nvidia-xconfig --busid=PCI:3:0:0 --use-display-device=none
