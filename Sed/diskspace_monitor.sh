#!/usr/bin/env bash

avail_disk_space=$(df -h | sed -n '/\budev\b/p' | awk '{ print $4 }')

#remove G from the output
avail_disk_space=$(df -h | sed -n '/\budev\b/p' | awk '{ print $4 }' | sed 's/G//')
readonly DISK_THRESHOLD=10

if [[ ${DISK_THRESHOLD} > ${avail_disk_space} ]];then
  echo "Warning: available disk space is ${avail_disk_space}G. Please maintain a minimum 10G of available disk space"
fi

#echo "${avail_disk_space}"
exit 0