# Dockerfile for a minimal environment running code for VR2014 paper
# 'Relating functional connectivity in V1 neural circuits and 3D natural scenes using Boltzmann machines'
# (doi: 10.1016/j.visres.2015.12.002)

# pull base image
FROM ubuntu:14.04
MAINTAINER Yimeng Zhang <zym1010@gmail.com>

# install Ansible, using code from https://hub.docker.com/r/williamyeh/ansible/
#MAINTAINER William Yeh <william.pjyeh@gmail.com>
RUN echo "===> Adding Ansible's prerequisites..."   && \
    apt-get update -y            && \
    DEBIAN_FRONTEND=noninteractive  \
        apt-get install --no-install-recommends -y -q  \
                build-essential                        \
                python-pip python-dev python-yaml      \
                libxml2-dev libxslt1-dev zlib1g-dev    \
                git                                 && \
    pip install --upgrade pyyaml jinja2 pycrypto    && \
    \
    \
    echo "===> Downloading Ansible's source tree..."            && \
    git clone git://github.com/ansible/ansible.git --recursive  && \
    \
    \
    echo "===> Compiling Ansible..."      && \
    cd ansible                            && \
    bash -c 'source ./hacking/env-setup'  && \
    \
    \
    echo "===> Moving useful Ansible stuff to /opt/ansible ..."  && \
    mkdir -p /opt/ansible                && \
    mv /ansible/bin   /opt/ansible/bin   && \
    mv /ansible/lib   /opt/ansible/lib   && \
    mv /ansible/docs  /opt/ansible/docs  && \
    rm -rf /ansible                      && \
    \
    \
    echo "===> Clean up..."                                         && \
    apt-get remove -y --auto-remove \
            build-essential python-pip python-dev git               && \
    apt-get clean                                                   && \
    rm -rf /var/lib/apt/lists/*                                     && \
    \
    \
    echo "===> Adding hosts for convenience..."  && \
    mkdir -p /etc/ansible                        && \
    echo '[local]\nlocalhost\n' > /etc/ansible/hosts


ENV PATH        /opt/ansible/bin:$PATH
ENV PYTHONPATH  /opt/ansible/lib:$PYTHONPATH
ENV MANPATH     /opt/ansible/docs/man:$MANPATH

# copy the git repo into /tmp.


# default command: run bash
CMD ["/bin/bash"]