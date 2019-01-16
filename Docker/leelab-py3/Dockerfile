#  $ docker build . -t leelabcnbc/leelab-py3:20190116
#  $ docker run --rm -it leelabcnbc/leelab-py3:20190116
#  $ docker push leelabcnbc/leelab-py3:20190116
FROM continuumio/miniconda3:4.5.12

# python 3.6.7 is the latest 3.6.x maintained by conda-forge
RUN conda create -n leelab -c conda-forge -y python==3.6.7 \
    # four big ones.
    # check <https://conda-forge.org/docs/blas.html#openblas-mkl-dance> if you run into blas issues.
    # the `py36_blas_openblash1522bff_1000` part is to make sure everything is built with gcc7.
    # otherwise, later on rpy2 will upgrade libgcc-ng by force, somehow even if
    # I specify --no-update-dependencies

    # MAYBE bug: when I only specify numpy with that long build string,
    # and using `=` not `==`, `conda install` breaks.
    # if everything is `==`, then it works.

    numpy==1.15.4=py36_blas_openblash1522bff_1000 scipy==1.2.0 matplotlib==3.0.2 pandas==0.23.4 \
    # other ones in my "default" scripts
    notebook==5.7.4 h5py==2.9.0 git==2.20.1 \
    && conda clean --all

# set shell stuff
# https://gitlab.com/gitlab-org/gitlab-runner/issues/82#note_76248350
# is fine, but I think it's easist to set PATH,
# as the conda in `leelab` environment actually doesn't need
# those CONDA related environment variables to work;
ENV PATH /opt/conda/envs/leelab/bin:$PATH
# set bashrc
# this part won't get executed if you don't run the container using
# `-it`, or if you run the container using Singularity.
# but it's useful for interactive sessions, where you may want to
# play with conda.
# also, if you don't do this, then when you do -it, things will get messed up.
RUN echo "conda activate leelab" >> ~/.bashrc
