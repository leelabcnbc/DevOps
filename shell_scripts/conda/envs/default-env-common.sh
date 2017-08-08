function install_default_env {
	if [ $# -ne 2 ]; then
		echo "two args, first env name, second python version"
		exit 1
	fi
	conda create --yes --channel conda-forge --show-channel-urls -n $1 \
        python=$2 numpy=1.13.1 scipy=0.19.1 matplotlib=2.0.2 \
        pandas=0.20.3 nose=1.3.7 pytest=3.2.0 notebook=5.0.0 h5py=2.7.0 openblas=0.2.20 git=2.13.3
}
