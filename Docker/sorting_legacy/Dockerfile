# Dockerfile for a minimal environment running legacy programs for sorting.
# SpikeSort (http://www.smithlab.net/spikesort.html)
# (http://www.smithlab.net/software/spikesort.zip)
# by Ryan Kelly, Matt Smith, and Adam Snyder
# SAC (http://niel.net.technion.ac.il/software/)
# (http://niel.net.technion.ac.il/files/2013/09/SAC_ver_2_15.zip)
# by Shy Shoham's lab.


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


# install VNC server, using code from https://hub.docker.com/r/kaixhin/vnc/
# MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install LXDE, VNC server and Firefox
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  firefox \
  lxde-core \
  lxterminal \
  tightvncserver
# Set user for VNC server (USER is only for build)
ENV USER root
# Set default password
COPY password.txt .
RUN cat password.txt password.txt | vncpasswd && \
  rm password.txt
# Expose VNC port
EXPOSE 5901

# Copy VNC script that handles restarts
COPY vnc.sh /opt/
# CMD ["/opt/vnc.sh"]

# copy the git repo into /tmp.
COPY repo.tar.gz /tmp
# expand git repo and remove tar.
RUN mkdir /tmp/DevOps && tar -xvf /tmp/repo.tar.gz -C /tmp/DevOps && rm /tmp/repo.tar.gz
# copy MATLAB files
COPY files /tmp/DevOps/ansible/roles/matlab/files
# copy playbook
COPY sorting_legacy.yml /tmp/DevOps/ansible
# run Ansible playbook, clean up, and add MATLAB shortcut.
RUN ansible-playbook -c local /tmp/DevOps/ansible/sorting_legacy.yml && rm -rf /tmp/DevOps && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    ln -s /usr/local/MATLAB/R2012b/bin/matlab /root/Desktop/matlab_r2012b

# default command: run bash
CMD ["/bin/bash"]
