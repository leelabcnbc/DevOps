# DevOps
A bunch of DevOps files.

## Things to remember for Docker images.
if possible, specify versions of numpy and scipy (I think specifying numpy is enough) for Docker containers. I found that tests on them are pretty fragile and I simply want the container to run some really stable verisons which won't fail when running the following lines.

* `python -c 'import numpy as np;np.test()'`
* `python -c 'import scipy as sp;sp.test()'`

Note that it seems it's required to install `build-essential` before you can pass all `scipy` tests.

## MATLAB related ansible scripts

In `ansible/roles/matlab/files`, you should have `R2012b_UNIX.tar.gz` and `R2014a_UNIX_original.tar.gz` to make the `matlab` Ansible role really work. They can be generated from the corresponding ISO files I obtained from somewhere like tpb... These ISO file are available in Yimeng's 128G Flash Drive (TODO: move them to somewhere permanent in lab server)

