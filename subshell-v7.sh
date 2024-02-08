#!/usr/bin/env bash

tmpfile="$$.tmp"
counter=1

echo "${counter}" > ${tmpfile}

(
counter="$($(cat $tmpfile) + 1)"
echo "${counter}" > ${tmpfile}
)

counter=$(cat ${tmpfile})

echo "${counter}"

unlink ${tmpfile}