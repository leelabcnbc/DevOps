#!/usr/bin/env bash

# use sudo to run this!
# convert official r2012b zips into a tar.gz ready for ansible installation.
# mount them, and then tar.gz them, preserving permissions.
# tested on Ubuntu 14.04.5.
MOUNT_DIR="/tmp/matlab_iso"
FILE="R2012b_UNIX_CMU"
rm -rf ${MOUNT_DIR}
mkdir ${MOUNT_DIR}
cp MATLAB80_common.zip MATLAB80_glnxa64.zip matlab_R2012b_glnxa64_installer.zip ${MOUNT_DIR}
unzip ${MOUNT_DIR}/matlab_R2012b_glnxa64_installer.zip -d ${MOUNT_DIR}
rm ${MOUNT_DIR}/matlab_R2012b_glnxa64_installer.zip
ls ${MOUNT_DIR}
echo "tar.gz file ${FILE}..."
tar -czvf ${FILE}.tar.gz -C ${MOUNT_DIR} .
# when untar, use tar xvpf xxx.tar.gz -C destination to keep permissions (p flag)
rm -rf ${MOUNT_DIR}
echo "done."
