#! /usr/bin/env bash

readonly WORK_DIR=$(dirname $(readlink -f ${0}))

readonly SCRIPT_NAME=${0##*/}

echo ${WORK_DIR}
# Result: /Users/tritaminh/Desktop script/Special_shell_variables

cd "${WORK_DIR}/.."