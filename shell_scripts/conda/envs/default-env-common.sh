function install_default_env {
	if [ $# -ne 2 ]; then
		echo "two args, first env name, second python version"
		exit 1
	fi
	conda create --yes --channel conda-forge --show-channel-urls -n $1 \
        python=$2 numpy=1.12.0 scipy=0.19.0 matplotlib=2.0.0 \
        pandas=0.19.2 nose=1.3.7 notebook=4.3.2 h5py=2.6.0 openblas=0.2.19 git=2.8.2
}
