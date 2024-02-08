#!/usr/bin/env bash

readonly CONF_FILE="./fpdn.properties"
readonly SERVER_NAMES="server1 server2 server3"
readonly DEFAULT_USER="TriTM"

fpdn=$(cat "${CONF_FILE}")

#echo ${fpdn}

for item in ${fpdn}; do
    #echo "hostname: ${item}"
    for server in ${SERVER_NAMES}; do
        #echo "Server: ${server}"
        echo "${DEFAULT_USER}@${server}.${item}"
    done
done