# Dockerfile for a minimal environment debugging the lab website (leelabcnbc.github.io)

# pull base image, with jekyll + github pages plugins.
FROM jekyll/jekyll:pages
MAINTAINER Yimeng Zhang <zym1010@gmail.com>

# add timezone with http://wiki.alpinelinux.org/wiki/Setting_the_timezone (retrieved 2016-01-27)
# setting (an arbitrary) timezone is important for the Jekyll's timezone setting to work (at least for 2.4 in my experience)
RUN apk --update add tzdata && \
    npm install -g grunt-cli && \
    cp /usr/share/zoneinfo/Europe/Brussels /etc/localtime && \
    echo "Europe/Brussels" >  /etc/timezone && \
    rm -rf /tmp/* && rm -rf /var/cache/apk/*

WORKDIR /srv/jekyll/
# default command: run bash
CMD ["/bin/bash"]
