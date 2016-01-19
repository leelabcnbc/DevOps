#!/usr/bin/env bash

# use sudo to run this!
# convert R2012b_UNIX.iso and R2014a_UNIX_original.iso
# mount them, and then tar.gz them, preserving permissions.
# tested on Ubuntu 14.04.3 in Parallels.
MOUNT_DIR="/tmp/matlab_iso"
rm -rf ${MOUNT_DIR}
mkdir ${MOUNT_DIR}
for FILE in R2012b_UNIX R2014a_UNIX_original; do
    echo "working on file ${FILE}..."
    mount -o loop ./${FILE}.iso ${MOUNT_DIR}
    ls ${MOUNT_DIR}
    echo "tar.gz file ${FILE}..."
    tar -czvf ${FILE}.tar.gz -C ${MOUNT_DIR} .
    # when untar, use tar xvpf xxx.tar.gz -C destination to keep permissions (p flag)
    echo "done."
    umount ${MOUNT_DIR}
done
rmdir ${MOUNT_DIR}
