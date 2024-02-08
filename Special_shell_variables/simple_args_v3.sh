#!/usr/bin/env bash

# Kiểm tra xem có đúng 2 tham số truyền vào hay không
if [[ ! $# -eq 2 ]]; then
    echo "Error: Please provide two args"
    exit 1
fi

echo "You provided: $1 and $2"