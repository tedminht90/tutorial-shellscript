#!/usr/bin/env bash

readonly WORKING_DIR=$(dirname $(readlink -f ${0}))
readonly SCRIPT_NAME=${0##*/}
readonly CL_ARGS_ERROR=155

#echo "${WORKING_DIR}"
# /Users/tritaminh/Desktop
# script
#cd "${WORKING_DIR}/.."


usage() {
    cat <<USAGE
Usage: ${SCRIPT_NAME} <name>

This script greets the user with the provided name.
Arguments:
    name  The name of the person to greet.

Options:
    -h, --help    Show this help message and exit.
USAGE
}

terminate() {
    local msg="$1"
    code="${2:-160}"
    echo "Error: ${msg}" >&2
    exit "${code}"
}


#echo $#
if [[ $# -ne 1 ]]; then
    usage
    terminate "Command line argument missing." "${CL_ARGS_ERROR}"
fi

if [[ "${1}" == "-h" ]] || [[ "${1}" == "--help" ]]; then
    usage
    exit 0
fi

name="${1}"
echo "Hello, ${name}! Welcome to my script."
exit 0


# Usage: special-zero3.sh
# This is a usage message with instructions on how to use the script.