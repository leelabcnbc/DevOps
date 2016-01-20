#!/usr/bin/env bash

# you must specify a output dir, and that dir should not exist.

if [ $# -ne 1 ]; then
    echo "Usage: $0 [EXPORT_DIR]"
    exit 1
else
    EXPORT_DIR=$1
    if [ -e "${EXPORT_DIR}" ]; then
        echo "export dir already exists!"
        exit 1
    fi
    # create the dir.
    mkdir -p "${EXPORT_DIR}"  # I'm strongly against having space in the path, although I guess it should work.
fi

# copy the specific git repo into that folder.
echo "copy git repo".
git archive --format=tar.gz 8f1bc06c847571421c82e3b6c3e58f592e093e44 > "${EXPORT_DIR}/repo.tar.gz"

echo "copy Dockerfile"
cp Dockerfile "${EXPORT_DIR}"
echo "copy playbook"
cp playbook_vr2014.yml "${EXPORT_DIR}"

echo "copy matlab files."
# copy MATLAB 2014a files. I assume that you are in the same directory as this shell file.
mkdir "${EXPORT_DIR}/files"
cp ../../ansible/roles/matlab/files/R2014a_UNIX_original.tar.gz "${EXPORT_DIR}/files"
cp ../../ansible/roles/matlab/files/activate_R2014a.ini "${EXPORT_DIR}/files"
cp ../../ansible/roles/matlab/files/install_R2014a.jar "${EXPORT_DIR}/files"
cp ../../ansible/roles/matlab/files/installer_input_R2014a.txt "${EXPORT_DIR}/files"
cp ../../ansible/roles/matlab/files/license_standalone_R2014a.lic "${EXPORT_DIR}/files"
cp ../../ansible/roles/matlab/files/libmwservices_R2014a.so "${EXPORT_DIR}/files"

# done.
echo "done."

