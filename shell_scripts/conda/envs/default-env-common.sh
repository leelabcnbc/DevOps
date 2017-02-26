function install_default_env {
	if [ $# -ne 2 ]; then
		echo "two args, first env name, second python version"
		exit 1
	fi
    # as of 02/09/2017, I updated everything to latest, except for matplotlib, whose compatibility (2.0) is not certain.
    # numpy hasn't been updated, since a opencv 2 linked with numpy 1.12 is not out yet.
	conda create --yes --channel conda-forge --show-channel-urls -n $1 \
        python=$2 numpy=1.11.3 scipy=0.18.1 matplotlib=1.5.3 \
        pandas=0.19.2 nose=1.3.7 notebook=4.3.2 h5py=2.6.0 openblas=0.2.19 git=2.8.2
}
