# Dockerfile for a GPU-enabled TensorFlow 1.4.1, with Python 3.6
# tag name: leelabcnbc/tensorflow:1.4.1-centos6-py36-gpu

# pull base image
FROM leelabcnbc/bazel:0.8.1-cuda8.0-cudnn6-centos6
MAINTAINER Yimeng Zhang <zym1010@gmail.com>
COPY CROSSTOOL_nvcc.tpl /tmp/

# check <https://github.com/tensorflow/tensorflow/issues/5374#issuecomment-258500983> to see how to properly to no user interaction
# TF_NEED_JEMALLOC=0. see <http://biophysics.med.jhmi.edu/~yliu120/tensorflow.html>
# I also disabled some cloud stuff.
# check https://blog.abysm.org/2016/06/building-tensorflow-centos-6/
#
# workspace.bzl is for bazel version.
# check https://github.com/tensorflow/tensorflow/issues/16654#issuecomment-362517428
# I did a hack, as other ways seems to not work for 1.4.1
# add --incompatible_load_argument_is_label=false for bazel
# https://github.com/tensorflow/tensorflow/issues/15492
# add --action_env=LD_LIBRARY_PATH=/usr/local/cuda/lib64 for bazel
# https://github.com/tensorflow/tensorflow/issues/13243
# https://stackoverflow.com/questions/47080760/tensorflow-fails-to-compile/47295278#47295278

RUN echo "===> install everything"  && \
    cd ~ && curl -k -L -O https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
    bash ./Miniconda2-latest-Linux-x86_64.sh -b -f -p ~/conda && rm -rf Miniconda2-latest-Linux-x86_64.sh && \
    ~/conda/bin/conda create --yes -n tf -c conda-forge python=3.6 numpy=1.13 swig=3.0.12 && \
    curl -k -L -O https://github.com/tensorflow/tensorflow/archive/v1.4.1.tar.gz && \
    tar -zxf v1.4.1.tar.gz && rm -rf v1.4.1.tar.gz && cd tensorflow-1.4.1 && \
    cp /tmp/CROSSTOOL_nvcc.tpl third_party/gpus/crosstool/CROSSTOOL_nvcc.tpl && ls -la third_party/gpus/crosstool && \
    scl enable devtoolset-3 'export PYTHON_BIN_PATH=~/conda/envs/tf/bin/python PATH=~/conda/envs/tf/bin:~/bin:$PATH TF_NEED_CUDA=1 TF_CUDA_COMPUTE_CAPABILITIES="5.2,6.1" TF_NEED_JEMALLOC=0 TF_NEED_GCP=0 TF_NEED_HDFS=0 TF_NEED_S3=0 && yes "" | ./configure && ~/bin/bazel build -c opt --config=cuda --action_env=LD_LIBRARY_PATH=/usr/local/cuda/lib64 --spawn_strategy=standalone --genrule_strategy=standalone --verbose_failures //tensorflow/tools/pip_package:build_pip_package' && \
    scl enable devtoolset-3 'PATH=~/conda/envs/tf/bin:$PATH bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg' && \
    cd .. && rm -rf tensorflow-1.4.1 && ~/conda/bin/conda clean --yes --all && rm -rf ~/conda && rm -rf .cache

# default command: show the package name
CMD ["ls", "/tmp/tensorflow_pkg/"]
