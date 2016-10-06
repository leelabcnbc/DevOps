# for libs, such as glogs
# this one will work on current envrionment... so your current environment must have all libs required by Caffe.
# lib64 is useful if you use GCC in conda env to compile something.
export LD_LIBRARY_PATH=${CONDA_PREFIX}/lib:${CONDA_PREFIX}/lib64:$LD_LIBRARY_PATH
