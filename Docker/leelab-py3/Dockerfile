#  $ docker build . -t leelabcnbc/leelab-py3:20180819
#  $ docker run --rm -it leelabcnbc/leelab-py3:20180819
#  $ docker push leelabcnbc/leelab-py3:20180819
FROM leelabcnbc/miniconda3:4.5.10
# I specify the version of numpy here, as they need to be installed
# with conda-forge's pyspark. later on may be conda and pip specs should be
# unified somehow.
RUN conda create -n leelab -c conda-forge -y python=3.6.6 \
    && conda install -n leelab -c conda-forge -y \
    # four big ones; openblas needs 0.2.20 for numpy
    # as of 20180816, numpy 1.15 is still new and buggy.
    numpy=1.14.5 scipy=1.1.0 matplotlib=2.2.3 pandas=0.23.4 openblas=0.2.20 \
    # other ones in my "default" scripts
    notebook=5.6.0 h5py=2.8.0  git=2.18.0 \
    && conda clean --all
