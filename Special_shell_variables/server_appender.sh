#!/usr/bin/env bash

set -e

readonly CONF_FILE="./fpdn.properties"
readonly SERVER_NAMES="server1 server2 server3"
readonly DEFAULT_USER="TriTM"
readonly EMPTY_FILE=150
readonly FILE_NOT_EXIST=151

terminal() {
    local msg="$1"
    local code="${2:-160}"
    echo "Error: ${msg}" >&2
    exit "${code}"
}


# Check if the file is empty
if [[ ! -s "${CONF_FILE}"  ]]; then
    terminal "Error: ${CONF_FILE} is empty" "${EMPTY_FILE}"
    exit 1
fi

# Check if the file exists
if [[ ! -f "${CONF_FILE}" ]]; then
    terminal "Error: ${CONF_FILE} does not exist" "${FILE_NOT_EXIST}"
    exit 1
fi

fpdn=$(cat "${CONF_FILE}") 

#echo ${fpdn}

for host in ${fpdn}; do
    #echo "hostname: ${item}"
    for server in ${SERVER_NAMES}; do
        #echo "Server: ${server}"
        echo "${DEFAULT_USER}@${server}.${host}"
    done
done