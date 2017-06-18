function install_theano_tf {
    DIR_LOCAL="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	if [ $# -ne 1 ]; then
		echo "give python version"
		exit 1
	fi
    # check python version
    if [ "$1" != "2.7" -a "$1" != "3.6" ]; then
        "only 2.7 and 3.6 are supported"
        exit 1
    fi
    # see <https://conda.io/docs/spec.html#package-match-specifications>. Need double quote.
	conda install --yes -c conda-forge --no-update-dependencies "protobuf>=3.1.0" "mock>=2.0.0"
    pip install nose-parameterized Theano==0.9.0
    # then let's install tensorflow.
    if [ "$1" == "2.7" ]; then
        pip install /data2/leelab/software/tensorflow/gpu/py27/tensorflow-1.0.1-cp27-cp27mu-linux_x86_64.whl
    elif [ "$1" == "3.6" ]; then
        pip install /data2/leelab/software/tensorflow/gpu/py36/tensorflow-1.2.0-cp36-cp36m-linux_x86_64.whl
    fi
    # install cudnn v5
    ${DIR_LOCAL}/../../cuda/install_cudnn_v5.sh
    # post install for theano
    echo -e  "[cuda]\nroot = ${HOME}/cuda\n[global]\ndevice = gpu0\nfloatX = float32\nbase_compiledir = /tmp/.theano_${USER}"  >  "${HOME}/.theanorc"
}
