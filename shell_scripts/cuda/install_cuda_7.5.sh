#!/usr/bin/env bash
# Install CUDA 7.5 for Linux in home directory.
# check if the file exists.
cd ~
INSTALLER="${HOME}/cuda_7.5.18_linux.run"
TOOLKITPATH="${HOME}/cuda-7.5"
SAMPLEPATH="${HOME}/NVIDIA_CUDA-7.5_Samples"
if [ ! -f "${INSTALLER}" ]; then
    wget http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run
fi

sh cuda_7.5.18_linux.run --silent --toolkit --samples --no-opengl-libs \
 --toolkitpath=${TOOLKITPATH} -samplespath=${SAMPLEPATH}

echo "CUDA 7.5 has been installed under ${TOOLKITPATH}, sample at ${SAMPLEPATH}"
