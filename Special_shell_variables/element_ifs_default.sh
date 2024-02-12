#!/usr/bin/env bash

# Default IFS
# IFS=$' \t\n'
# space (\ ), a tab (\t) and a newline (\n)

# elements_ifs_default="element0 element1  element2
# element3"

IFS=":"
element_ifs="element0:element1:element2:element3"

# for element_if_default in ${elements_ifs_default}; do
#     echo "${element_if_default} is now separate the elements list default IFS"
# done

for element_if in ${element_ifs}; do
    echo "${element_if} is now separate the elements list"
done