#!/usr/bin/env bash
# Install CUDA 8.0.61 for Linux in home directory.
# check if the file exists.
cd ~
INSTALLER="${HOME}/cuda_8.0.61_375.26_linux.run"
TOOLKITPATH="${HOME}/cuda-8.0"
SAMPLEPATH="${HOME}/NVIDIA_CUDA-8.0_Samples"
if [ ! -f "${INSTALLER}" ]; then
    curl -k -L -o "${INSTALLER}" \
        https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
fi

sh "${INSTALLER}" --silent --toolkit --samples --toolkitpath="${TOOLKITPATH}" --samplespath="${SAMPLEPATH}"

echo "CUDA 8.0 has been installed under ${TOOLKITPATH}, sample at ${SAMPLEPATH}"
echo "create a symlink at ${HOME}/cuda for convenience, as we usually only need one single CUDA toolkit"


# check <https://devblogs.nvidia.com/parallelforall/cuda-pro-tip-understand-fat-binaries-jit-caching/>
echo "for performance (on cluster), add 'export CUDA_CACHE_PATH=\"/tmp/.nv_\${USER}/ComputeCache\"' under appropriate file, such as .bashrc or .profile"
