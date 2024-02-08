#!/usr/bin/env bash
set -e

readonly ERROR_FILE=155

terminate() {
    local msg="$1"
    local code="${2:-160}"
    echo "Error: ${msg}" >&2
    exit "${code}"
}

usage() {

cat <<USAGE
Usage: special-shell.sh [arg]
   This script reads the contents from a file using a filereader binary
   Arguments: 
       filename: An existing non-empty file
USAGE
}

# Add your guard clause here

if [[ $# -ne 1 || ! -s "${1}" ]]; then
  usage
  terminate "Please pass just one command line argument as a file that exists and is non-empty" "${ERROR_FILE}"
fi

# Pass a command line argument ${1} to below command
/usr/local/bin/filereader "${1}"

echo "Shouldn't reach this line"

exit 0