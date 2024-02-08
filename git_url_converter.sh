#!/usr/bin/env bash

git_url="https://github.com/jcroyoaun/kodekloud-lab-sample-nodejs/blob/master/app.js"
raw_url_step1="${git_url/github.com/raw.githubusercontent.com}"
#echo "${raw_url_step1}"

#echo ${git_url}

#echo "${raw_url_step1}"

prefix="${raw_url_step1%%blob*}"
suffix="${raw_url_step1#*blob/}"

echo "${prefix}"
echo "${suffix}"
raw_url=${prefix}${suffix}

#echo "Raw URL: ${raw_url}"
curl "${raw_url}"

exit 0