#!/usr/bin/env bash

readonly MIN_ARGS=1
readonly MAX_ARGS=2

# Kiểm tra xem có đúng tham số truyền vào có nằm trong khoảng 1 và 2 hay không
if [[ $# -lt "${MIN_ARGS}" || $# -gt "${MAX_ARGS}" ]]; then
    echo "Expecting between ${MIN_ARGS} and ${MAX_ARGS} args"
    exit 1
fi

echo "Command line arguments within expected range"

exit 0