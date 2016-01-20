# Dockerfile for a minimal environment running code for VR2014 paper
# 'Relating functional connectivity in V1 neural circuits and 3D natural scenes using Boltzmann machines'
# (doi: 10.1016/j.visres.2015.12.002)

# pull base image
FROM ubuntu:14.04
MAINTAINER Yimeng Zhang <zym1010@gmail.com>

# install Ansible, using code from https://hub.docker.com/r/williamyeh/ansible/
#MAINTAINER William Yeh <william.pjyeh@gmail.com>

RUN echo "===> Adding Ansible's PPA..."  && \
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | tee /etc/apt/sources.list.d/ansible.list           && \
    echo "deb-src http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/ansible.list    && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7BB9C367    && \
    DEBIAN_FRONTEND=noninteractive  apt-get update  && \
    \
    \
    echo "===> Installing Ansible..."  && \
    apt-get install -y ansible  && \
    \
    \
    echo "===> Removing Ansible PPA..."  && \
    rm -rf /var/lib/apt/lists/*  /etc/apt/sources.list.d/ansible.list  && \
    \
    \
    echo "===> Adding hosts for convenience..."  && \
    echo '[local]\nlocalhost\n' > /etc/ansible/hosts

# copy the git repo into /tmp.
COPY repo.tar.gz /tmp
# expand git repo and remove tar.
RUN mkdir /tmp/DevOps && tar -xvf /tmp/repo.tar.gz -C /tmp/DevOps && rm /tmp/repo.tar.gz
# copy MATLAB files
COPY files /tmp/DevOps/ansible/roles/matlab/files
# copy playbook
COPY playbook_vr2014.yml /tmp/DevOps/ansible
# run Ansible playbook and remove everything.
# plus, do some post patching of the container, since MATLAB requires many things.
RUN ansible-playbook -c local /tmp/DevOps/ansible/playbook_vr2014.yml && rm -rf /tmp/DevOps \
    apt-get update && apt-get install -y libxt6 libxmu6 \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# default command: run bash
CMD ["/bin/bash"]
