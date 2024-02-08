#!/bin/bash

# Check if a command line argument is provided
if [[ "$#" -ne 1 ]]; then
    echo "Usage: $0 filename"
    exit 1
fi

input_file="${1}"
salary_file="salary.txt"

# Check if the file exists and is not empty
if [[ ! -f "${input_file}" ]] || [[ ! -s "${input_file}" ]]; then
    echo "Error: File does not exist or is empty."
    exit 1
fi

# Your awk command goes here
awk -F "|" '{ print $7 }' "${input_file}" > "${salary_file}"

#./salary_extrator.sh database.txt