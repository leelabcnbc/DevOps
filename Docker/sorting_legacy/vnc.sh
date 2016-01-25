#!/bin/bash

if [ $# -gt 1 ]; then
    echo "Usage: $0 [RESOLUTION]"
    exit 1
elif [ $# -eq 1 ]; then
    RESOLUTION="$1"
else
    RESOLUTION="1440x900"
fi

# add USER env variable. otherwise vncserver would fail.
export USER=root
# Remove VNC lock (if process already killed)
rm /tmp/.X1-lock /tmp/.X11-unix/X1
# Run VNC server with tail in the foreground
vncserver :1 -geometry ${RESOLUTION} -depth 24 && tail -F /root/.vnc/*.log
