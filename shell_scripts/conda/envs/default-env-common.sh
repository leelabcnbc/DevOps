function install_default_env {
	if [ $# -ne 2 ]; then
		echo "two args, first env name, second python version"
		exit 1
	fi
    # here, the openblas 0.2.20 is a custom one on conda-forge
    # without a bug in the official one.
    # https://github.com/conda-forge/openblas-feedstock/pull/35
    conda create --yes --channel conda-forge --show-channel-urls -n $1 \
        python=$2 numpy=1.13.3 scipy=1.0.0 matplotlib=2.1.2 \
        pandas=0.22.0 nose=1.3.7 pytest=3.4.0 notebook=5.4.0 h5py=2.7.1 openblas=0.2.20 git=2.14.2
}
