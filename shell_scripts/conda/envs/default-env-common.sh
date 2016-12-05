function install_default_env {
	if [ $# -ne 2 ]; then
		echo "two args, first env name, second python version"
		exit 1
	fi
	conda create --yes --channel conda-forge --show-channel-urls -n $1 \
        python=$2 numpy=1.11.2 scipy=0.18.1 matplotlib=1.5.3 \
        pandas=0.19.1 nose=1.3.7 notebook=4.2.3 h5py=2.6.0 openblas=0.2.19 git=2.8.2 \
        python-dateutil=2.5.3

# dateutil version is for <https://github.com/pandas-dev/pandas/issues/14621>.
# essentially, pandas is wrong, and we will wait for 0.19.2.
}
