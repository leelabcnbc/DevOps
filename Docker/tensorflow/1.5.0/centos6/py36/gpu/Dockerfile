# Dockerfile for a GPU-enabled TensorFlow 1.5.0, with Python 3.6
# tag name: leelabcnbc/tensorflow:1.5.0-centos6-py36-gpu

# pull base image
FROM leelabcnbc/bazel:0.8.1-cuda9.0-cudnn7-centos6
MAINTAINER Yimeng Zhang <zym1010@gmail.com>
COPY CROSSTOOL_nvcc.tpl /tmp/

# check <https://github.com/tensorflow/tensorflow/issues/5374#issuecomment-258500983> to see how to properly to no user interaction
# TF_NEED_JEMALLOC=0. see <http://biophysics.med.jhmi.edu/~yliu120/tensorflow.html>
# I also disabled some cloud stuff.
# check https://blog.abysm.org/2016/06/building-tensorflow-centos-6/
#
# workspace.bzl is for bazel version.
# check https://github.com/tensorflow/tensorflow/issues/16654#issuecomment-362517428
# I did a hack, as other ways seems to not work for 1.5.0
# add --incompatible_load_argument_is_label=false for bazel >= 0.9
# https://github.com/tensorflow/tensorflow/issues/15492
# add --action_env=LD_LIBRARY_PATH=/usr/local/cuda/lib64 for bazel
# https://github.com/tensorflow/tensorflow/issues/13243
# https://stackoverflow.com/questions/47080760/tensorflow-fails-to-compile/47295278#47295278
# https://github.com/tensorflow/tensorflow/issues/15142

# build with SSE/SSE2/AVX/AVX2/FMA
# https://stackoverflow.com/questions/43350224/building-tensorflow-v1-x-with-sse4-1-sse4-2-and-avx-instructions
# https://github.com/yaroslavvb/tensorflow-community-wheels/issues/15
# copt just means adding flags to gcc, cxxopt means adding flags to g++

RUN echo "===> install everything"  && \
    cd ~ && curl -k -L -O https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
    bash ./Miniconda2-latest-Linux-x86_64.sh -b -f -p ~/conda && rm -rf Miniconda2-latest-Linux-x86_64.sh && \
    ~/conda/bin/conda create --yes -n tf -c conda-forge python=3.6 numpy=1.13 swig=3.0.12 && \
    curl -k -L -O https://github.com/tensorflow/tensorflow/archive/v1.5.0.tar.gz && \
    tar -zxf v1.5.0.tar.gz && rm -rf v1.5.0.tar.gz && cd tensorflow-1.5.0 && \
    cp /tmp/CROSSTOOL_nvcc.tpl third_party/gpus/crosstool/CROSSTOOL_nvcc.tpl && ls -la third_party/gpus/crosstool && \
    cp /usr/local/cuda/lib64/stubs/libcuda.so /usr/local/cuda/lib64/stubs/libcuda.so.1 && \
    scl enable devtoolset-3 'export PYTHON_BIN_PATH=~/conda/envs/tf/bin/python PATH=~/conda/envs/tf/bin:~/bin:$PATH LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/cuda/lib64/stubs" TF_NEED_CUDA=1 TF_CUDA_COMPUTE_CAPABILITIES="5.2,6.1" TF_NEED_JEMALLOC=0 TF_NEED_GCP=0 TF_NEED_HDFS=0 TF_NEED_S3=0 && yes "" | ./configure && ~/bin/bazel build -c opt --config=cuda --copt=-mavx --copt=-mavx2 --copt=-mfma --copt=-msse4.1 --copt=-msse4.2 --spawn_strategy=standalone --genrule_strategy=standalone --verbose_failures //tensorflow/tools/pip_package:build_pip_package' && \
    scl enable devtoolset-3 'PATH=~/conda/envs/tf/bin:$PATH bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg' && \
    cd .. && rm -rf tensorflow-1.5.0 && ~/conda/bin/conda clean --yes --all && rm -rf ~/conda && rm -rf .cache

# default command: show the package name
CMD ["ls", "/tmp/tensorflow_pkg/"]
