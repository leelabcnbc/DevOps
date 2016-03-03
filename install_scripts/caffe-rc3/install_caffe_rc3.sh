#!/usr/bin/env bash

# the path has to be formalized later.
tar -xvzf caffe-rc3.tar.gz 
cp Makefile.config.rc3 caffe-rc3/Makefile.config

cd caffe-rc3
make all -j8
make test -j8
make pycaffe
cd ..
