#!/bin/bash

## Please pass just numbers as command line arguments.
column="${1}"
row="${2}"

# Your awk code below
awk -v column="${column}" -v row="${row}" 'NR == row { print $column }' seat-grid.txt

# ./seat-checker.sh 9 5 -> you will get the 9th column of the 5th row, result: y
# ./seat-checker.sh 9 7 -> you will get the 9th column of the 5th row, result: n
# 