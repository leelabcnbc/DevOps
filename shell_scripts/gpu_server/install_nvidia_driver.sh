#!/usr/bin/env bash

# first get driver
curl -k -L -o /tmp/NVIDIA-driver.run \
    http://us.download.nvidia.com/XFree86/Linux-x86_64/367.44/NVIDIA-Linux-x86_64-367.44.run
chmod +x /tmp/NVIDIA-driver.run
# /tmp/NVIDIA-driver.run --help or --advanced-options can tell you optional flags. Some useful ones are listed below.
#   -s, --silent
#      Run silently; no questions are asked and no output is
#      printed, except for error messages to stderr.  This option
#      implies '--ui=none --no-questions --accept-license'.

#  --no-kernel-module
#      Install everything but the kernel module, and do not remove
#      any existing, possibly conflicting kernel modules.  This
#      can be useful in some DEBUG environments.  If you use this
#      option, you must be careful to ensure that a NVIDIA kernel
#      module matching this driver version is installed
#      seperately.

#  --no-opengl-files
#      Do not install any of the OpenGL-related driver files.
#  -X, --run-nvidia-xconfig
#      nvidia-installer can optionally invoke the nvidia-xconfig
#      utility.  This will update the system X configuration file
#      so that the NVIDIA X driver is used.  The pre-existing X
#      configuration file will be backed up.  At the end of
#      installation, nvidia-installer will ask the user if they
#      wish to run nvidia-xconfig; the default response is 'no'.
#      Use this option to make the default response 'yes'.  This
#      is useful with the '--no-questions' or '--silent' options,
#      which assume the default values for all questions.
sudo /tmp/NVIDIA-driver.run --silent
# then reboot your computer, and follow the next one.

