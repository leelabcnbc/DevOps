# Dockerfile for Torch (as of 20170304, commit 497e8b98596eebc7d2b7852d3bdb3df3a43bbe9b) on CentOS 6 + CUDA 8.0 + cuDNN v5.
# tag name: leelabcnbc/torch:20170304-cuda8.0-cudnn5-centos6

FROM nvidia/cuda:8.0-cudnn5-devel-centos6
MAINTAINER Yimeng Zhang <zym1010@gmail.com>

# install relevant software to build torch
RUN echo "===> Add relevant software..."  && \
    yum -y install git wget unzip && \
    yum clean all

# <http://askubuntu.com/questions/94060/run-adduser-non-interactively>
# change username yourself when compiling your own torch.
RUN adduser yimengzh
USER yimengzh
RUN cd ~ && pwd && id

# install conda
RUN echo "===> install conda env"  && \
    cd ~ && git clone https://github.com/leelabcnbc/DevOps && ~/DevOps/shell_scripts/conda/install_miniconda.sh && \
    PATH="${HOME}/miniconda2/bin:${PATH}" ~/DevOps/shell_scripts/conda/envs/torch.sh
# clone torch
# I replaced clone --recursive with separate commands to specify commits. Check <https://git-scm.com/docs/git-clone>
RUN echo "===> check out Torch..."  && \
    cd ~ && git clone https://github.com/torch/distro.git ~/torch && cd ~/torch && git checkout 497e8b98596eebc7d2b7852d3bdb3df3a43bbe9b && \
    git submodule update --init --recursive

# this works for this commit. may need change for other commits.
RUN echo "===> hack Torch install.sh ..." && \
    cd ~/torch && sed -i.bak '34,36 d' install.sh

# LD_LIBRARY_PATH change is needed, in order for OpenBLAS to be properly found.
# somehow, I need LIBRARY_PATH & CPATH, as well as those CMAKE ones. Otherwise, building will fail.
RUN echo "===> build Torch..." && \
    cd ~/torch && export TORCH_CUDA_ARCH_LIST="5.2 6.1" CC=gcc-4.9 CXX=g++-4.9 PATH="${HOME}/miniconda2/envs/torch/bin:${PATH}" LD_LIBRARY_PATH="${HOME}/miniconda2/envs/torch/lib:${HOME}/miniconda2/envs/torch/lib64:$LD_LIBRARY_PATH" && \
    CPATH=~/miniconda2/envs/torch/include LIBRARY_PATH=~/miniconda2/envs/torch/lib:~/miniconda2/envs/torch/lib64 CMAKE_LIBRARY_PATH=~/miniconda2/envs/torch/lib:~/miniconda2/envs/torch/lib64 CMAKE_INCLUDE_PATH=~/miniconda2/envs/torch/include  ./install.sh -b -s && \
    rm -rf .git

CMD ["bash"]
