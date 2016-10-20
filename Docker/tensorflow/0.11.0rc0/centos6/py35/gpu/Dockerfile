# Dockerfile for a GPU-enabled TensorFlow 0.11.0rc0, with Python 3.5
# tag name: leelabcnbc/tensorflow:0.11.0rc0-centos6-py35-gpu

# pull base image
FROM leelabcnbc/bazel:0.3.1-cuda7.5-cudnn5-centos6
MAINTAINER Yimeng Zhang <zym1010@gmail.com>
COPY CROSSTOOL.tpl /tmp/
COPY crosstool_wrapper_driver_is_not_gcc.tpl /tmp/
# swig from centos 6 is probably too old.
RUN echo "===> install everything"  && \
    cd ~ && curl -k -L -O https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
    bash ./Miniconda2-latest-Linux-x86_64.sh -b -f -p ~/conda && rm -rf Miniconda2-latest-Linux-x86_64.sh && \
    ~/conda/bin/conda create --yes -n tf -c conda-forge python=3.5 numpy=1.11 swig=3.0.10 && \
    curl -k -L -O https://github.com/tensorflow/tensorflow/archive/v0.11.0rc0.tar.gz && \
    tar -zxf v0.11.0rc0.tar.gz && rm -rf v0.11.0rc0.tar.gz && cd tensorflow-0.11.0rc0 && \
    cp /tmp/CROSSTOOL.tpl third_party/gpus/crosstool/CROSSTOOL.tpl && ls -la third_party/gpus/crosstool && \
    cp /tmp/crosstool_wrapper_driver_is_not_gcc.tpl third_party/gpus/crosstool/clang/bin/crosstool_wrapper_driver_is_not_gcc.tpl && ls -la third_party/gpus/crosstool/clang/bin && \
    scl enable devtoolset-3 'PYTHON_BIN_PATH=~/conda/envs/tf/bin/python PATH=~/conda/envs/tf/bin:~/bin:$PATH TF_NEED_GCP=0 TF_NEED_CUDA=1 TF_CUDA_COMPUTE_CAPABILITIES="5.2" ./configure && ~/bin/bazel build -c opt --config=cuda --spawn_strategy=standalone --genrule_strategy=standalone --verbose_failures //tensorflow/tools/pip_package:build_pip_package' && \
    scl enable devtoolset-3 'PATH=~/conda/envs/tf/bin:$PATH bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg' && \
    cd .. && rm -rf tensorflow-0.11.0rc0 && ~/conda/bin/conda clean --yes --all && rm -rf ~/conda && rm -rf .cache

# default command: show the package name
CMD ["ls", "/tmp/tensorflow_pkg/"]
