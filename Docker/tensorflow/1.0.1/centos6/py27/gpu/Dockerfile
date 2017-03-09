# Dockerfile for a GPU-enabled TensorFlow 1.0.1, with Python 2.7
# tag name: leelabcnbc/tensorflow:1.0.1-centos6-py27-gpu

# pull base image
FROM leelabcnbc/bazel:0.4.3-cuda8.0-cudnn5-centos6
MAINTAINER Yimeng Zhang <zym1010@gmail.com>
COPY CROSSTOOL.tpl /tmp/
COPY crosstool_wrapper_driver_is_not_gcc.tpl /tmp/
# this version has no `v` before version number... should be some problem from Google.
# check <https://github.com/tensorflow/tensorflow/issues/5374#issuecomment-258500983> to see how to properly to no user interaction
# TF_NEED_JEMALLOC=0. see <http://biophysics.med.jhmi.edu/~yliu120/tensorflow.html>
RUN echo "===> install everything"  && \
    cd ~ && curl -k -L -O https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
    bash ./Miniconda2-latest-Linux-x86_64.sh -b -f -p ~/conda && rm -rf Miniconda2-latest-Linux-x86_64.sh && \
    ~/conda/bin/conda create --yes -n tf -c conda-forge python=2.7 numpy=1.12 swig=3.0.10 && \
    curl -k -L -O https://github.com/tensorflow/tensorflow/archive/v1.0.1.tar.gz && \
    tar -zxf v1.0.1.tar.gz && rm -rf v1.0.1.tar.gz && cd tensorflow-1.0.1 && \
    cp /tmp/CROSSTOOL.tpl third_party/gpus/crosstool/CROSSTOOL.tpl && ls -la third_party/gpus/crosstool && \
    cp /tmp/crosstool_wrapper_driver_is_not_gcc.tpl third_party/gpus/crosstool/clang/bin/crosstool_wrapper_driver_is_not_gcc.tpl && ls -la third_party/gpus/crosstool/clang/bin && \
    scl enable devtoolset-3 'export PYTHON_BIN_PATH=~/conda/envs/tf/bin/python PATH=~/conda/envs/tf/bin:~/bin:$PATH TF_NEED_CUDA=1 TF_CUDA_COMPUTE_CAPABILITIES="5.2,6.1" TF_NEED_JEMALLOC=0 && yes "" | ./configure && ~/bin/bazel build -c opt --config=cuda --spawn_strategy=standalone --genrule_strategy=standalone --verbose_failures //tensorflow/tools/pip_package:build_pip_package' && \
    scl enable devtoolset-3 'PATH=~/conda/envs/tf/bin:$PATH bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg' && \
    cd .. && rm -rf tensorflow-1.0.1 && ~/conda/bin/conda clean --yes --all && rm -rf ~/conda && rm -rf .cache

# default command: show the package name
CMD ["ls", "/tmp/tensorflow_pkg/"]
