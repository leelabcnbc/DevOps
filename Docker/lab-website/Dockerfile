# Dockerfile for a minimal environment debugging the lab website (leelabcnbc.github.io)

# pull base image, with jekyll + github pages plugins.
FROM jekyll/jekyll:pages
MAINTAINER Yimeng Zhang <zym1010@gmail.com>

# add timezone with http://wiki.alpinelinux.org/wiki/Setting_the_timezone (retrieved 2016-01-27)
# setting (an arbitrary) timezone is important for the Jekyll's timezone setting to work (at least for 2.4 in my experience)
# forget about it... all you need is tzdata.
RUN apk --update add tzdata openssh rsync && \
    npm install -g grunt-cli && \
    rm -rf /tmp/* && rm -rf /var/cache/apk/*

# default command: run bash
CMD ["/bin/bash"]
