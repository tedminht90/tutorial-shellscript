#!/usr/bin/env bash

# Check if no arguments are passed  
if [[ $# -eq 0 ]]; then  
    echo  "Please provide names as arguments."
    exit 1 
fi  

# Loop through all arguments using special shell variable $@  
for name in  "$@"; do  
    echo  "Hello, ${name}!" 
done

# ./special-at.sh Feng Debbie Andy

# Hello, Feng!
# Hello, Debbie!
# Hello, Andy!