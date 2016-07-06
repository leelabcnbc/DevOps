# for some binaries, such as protobuf
. activate cafferc3
# for libs, such as glogs
export LD_LIBRARY_PATH=${CONDA_ENV_PATH}/lib:$LD_LIBRARY_PATH
# so openblas is at first.
export LD_LIBRARY_PATH=${HOME}/lib/OpenBLAS/lib:$LD_LIBRARY_PATH
