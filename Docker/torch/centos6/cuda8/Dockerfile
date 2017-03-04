# Dockerfile for Torch (as of 20170304, commit 497e8b98596eebc7d2b7852d3bdb3df3a43bbe9b) on CentOS 6 + CUDA 8.0 + cuDNN v5.
# tag name: leelabcnbc/torch:20170304-cuda8.0-cudnn5-centos6

FROM nvidia/cuda:8.0-cudnn5-devel-centos6
MAINTAINER Yimeng Zhang <zym1010@gmail.com>

# install relevant software to build torch
RUN echo "===> Add relevant software..."  && \
    yum -y install git && \
    yum clean all
# install conda
RUN echo "===> install conda env"  && \
    cd ~ && git clone -b torch https://github.com/leelabcnbc/DevOps && ~/DevOps/shell_scripts/conda/install_miniconda.sh && \
    PATH="${HOME}/miniconda2/bin:${PATH}" ~/DevOps/shell_scripts/envs/torch.sh
# clone torch
# I replaced clone --recursive with separate commands to specify commits. Check <https://git-scm.com/docs/git-clone>
RUN echo "===> check out Torch..."  && \
    cd ~ && git clone https://github.com/torch/distro.git ~/torch && cd ~/torch && git checkout 497e8b98596eebc7d2b7852d3bdb3df3a43bbe9b && \
    git submodule update --init --recursive

RUN echo "===> build Torch..." && \
    cd ~/torch && PATH="${HOME}/miniconda2/bin:${PATH}" . activate torch && export CC=gcc-4.9 CXX=g++-4.9 && \
    CPATH=~/miniconda2/envs/torch/include LIBRARY_PATH=~/miniconda2/envs/torch/lib  CMAKE_LIBRARY_PATH=~/miniconda2/envs/torch/lib CMAKE_INCLUDE_PATH=~/miniconda2/envs/torch/include  ./install.sh -b -s

CMD ["bash"]
