function check_env_exists {
    if [ $# -ne 1 ]; then
        echo "one arg env name"
        exit 2
    fi
    COMMON_CONDA_BASE_DIR=$(dirname $(dirname "$(which conda)"))
    if [ -d "${COMMON_CONDA_BASE_DIR}/envs/$1" ]; then
        return 0
    else
        return 1
    fi
}
