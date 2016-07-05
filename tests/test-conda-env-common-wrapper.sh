#!/usr/bin/env bash
set -o nounset
set -o errexit
# check number of arguments and determine where to install Miniconda.
if [ $# -eq 1 ]; then
    ENV_NAME="$1"
else
    echo "Usage: $0 [ENV_NAME]"
    exit 1
fi

# run the script to create environment
../shell_scripts/conda/envs/${ENV_NAME}.sh
# switch to the environment
. activate ${ENV_NAME}
# run the aggregate test script using python.
NUMPY_TEST='import sys; import numpy; a=numpy.test(); sys.exit(not a.wasSuccessful())'
SCIPY_TEST='import sys; import scipy; a=scipy.test(); sys.exit(not a.wasSuccessful())'
PANDAS_TEST='import sys; import pandas; a=pandas.test(); sys.exit(not a.wasSuccessful())'
H5PY_TEST='import sys; import h5py; a=h5py.run_tests(); sys.exit(not a.wasSuccessful())'
# ugly but useful.
TEST_STRING_LIST=("${NUMPY_TEST}" "${SCIPY_TEST}" "${PANDAS_TEST}" "${H5PY_TEST}")
for TEST_STRING in "${TEST_STRING_LIST[@]}"; do
    # I don't use /dev/null since some test may take over 10 min and it will get killed.
    python -c "${TEST_STRING}"
    if [ $? -ne 0 ]; then
        echo "failed on string ${TEST_STRING}"
        exit 1
    fi
done
echo "all passed for environment ${ENV_NAME}"
exit 0
