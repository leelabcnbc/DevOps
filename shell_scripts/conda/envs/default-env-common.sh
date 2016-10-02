function install_default_env {
	if [ $# -ne 2 ]; then
		echo "two args, first env name, second python version"
		exit 1
	fi
	conda create --yes --channel conda-forge --show-channel-urls -n $1 \
    	python=$2 numpy=1.11.1 scipy=0.18.1 matplotlib=1.5.2\
    	pandas=0.18.1 nose=1.3.7 notebook=4.2.1 h5py=2.6.0 openblas=0.2.18 git=2.8.2
}