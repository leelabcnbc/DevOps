# DevOps
A bunch of DevOps files.

## TODOS

- [ ] create a CI environment to check that those environments work correctly, by testing against `numpy`, `scipy`, `pandas`, and `h5py`. (seems that I can't test `matplotlib` due to lack of test data; and I believe testing that could be very fragile since it's a display issue).

## Things to remember for Docker images.
if possible, specify versions of numpy and scipy (I think specifying numpy is enough) for Docker containers. I found that tests on them are pretty fragile and I simply want the container to run some really stable verisons which won't fail when running the following lines.

* `python -c 'import numpy as np;np.test()'`
* `python -c 'import scipy as sp;sp.test()'`

Note that it seems it's required to install `build-essential` before you can pass all `scipy` tests.

## MATLAB related ansible scripts

In `ansible/roles/matlab/files`, you should have `R2012b_UNIX.tar.gz` and `R2014a_UNIX_original.tar.gz` to make the `matlab` Ansible role really work. They can be generated from the corresponding ISO files I obtained from somewhere like tpb... These ISO file are available in Yimeng's 128G Flash Drive (TODO: move them to somewhere permanent in lab server)

## How to build Bazel and TensorFlow

for bazel, `cd` to relevant directory containing `Dockerfile`, and then run command like

~~~
sudo docker build -t leelabcnbc/bazel:0.4.4-cuda8.0-cudnn5-centos6 .
~~~

for TF, run command like 

~~~
sudo docker build -t leelabcnbc/tensorflow:0.12.1-centos6-py27-gpu .
~~~

then run command like 

~~~
sudo docker run leelabcnbc/tensorflow:0.12.1-centos6-py27-gpu
~~~

to know the path of the wheel file, and then `sudo docker ps -a` to get the name of container.

finally run command like

~~~
sudo docker cp musing_hawking:/tmp/tensorflow_pkg/tensorflow-0.12.1-cp27-cp27mu-linux_x86_64.whl ~
~~~

to get the wheel file.
