#!/usr/bin/env bash

readonly CONF_FILE="./fpdn.properties"
readonly SERVER_NAMES="server1 server2 server3"
readonly DEFAULT_USER="TriTM"

# Check if the file is empty
if [[ ! -s "${CONF_FILE}" ]]; then
    echo "Error: ${CONF_FILE} is empty"
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