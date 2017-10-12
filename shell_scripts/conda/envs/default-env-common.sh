function install_default_env {
	if [ $# -ne 2 ]; then
		echo "two args, first env name, second python version"
		exit 1
	fi
    # openblas 0.2.20 not ready for scipy yet. (20170808)
    # dateutil 2.6.0 is for running test for pandas. see <https://github.com/pandas-dev/pandas/pull/16880>
	conda create --yes --channel conda-forge --show-channel-urls -n $1 \
        python=$2 numpy=1.13.3 scipy=0.19.1 matplotlib=2.1.0 \
        pandas=0.20.3 nose=1.3.7 pytest=3.2.0 notebook=5.1.0 h5py=2.7.1 openblas=0.2.19 git=2.14.2 \
        python-dateutil=2.6.0
}
