# There is a script called email.sh in /home/bob/script directory. Update this script as below:

# Create a for loop that iterates the array.

# The for loop should print the key and the value for each element in the array in the following format:

# Kriti's email is kriti@kodekloud.com
# Mark's email is mark@kodekloud.com
# Enrique's email is enrique@kodekloud.com
# Feng's email is feng@kodekloud.com

# Execute the script to ensure your changes work fine.



#!/bin/bash

declare -A email_address=(
 ["Mark"]="mark@kodekloud.com"
 ["Kriti"]="kriti@kodekloud.com"
 ["Enrique"]="enrique@kodekloud.com"
 ["Feng"]="feng@kodekloud.com"
)
# !email_address[@] trả về tất cả các key trong mảng
for key in "${!email_address[@]}"; do
  echo "${key}'s email is ${email_address[${key}]}"
done