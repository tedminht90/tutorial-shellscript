#!/usr/bin/env bash
set -e

CL_ARGS_ERROR=155
calories_per_step=0.04

terminate() {
    msg="${1}"
    code="${2:-160}"
    echo "Error: ${msg}" >&2
    exit "${code}"
}

#echo $# = 1

if [[ $# != 1 ]]; then
    terminate "Please pass one argument" "${CL_ARGS_ERROR}"
fi

steps=${1}

calories_burned=$(echo "${steps}*${calories_per_step=0.04}" | bc )

echo "Calories burned for ${steps}" steps: ${calories_burned}

exit 0