#!/usr/bin/env bash

# Option 1: Direct UTC time
echo "UTC time: $(date -u +'%Y-%m-%d %H:%M:%S')"

# Option 2: Using timelocal
log(){
    echo $(date +'%Y-%m-%d %H:%M:%S') "${@}"
}

log "This is a test log message"