#!/bin/bash

while read -p "Enter favorite movie names (or 'exit' to stop): " movie; do
  if [[ "${movie}" == "exit" ]]; then
    break
  fi
  declare -u movie_upper="${movie}"
  echo "${movie_upper}"
done


string="hello, world!"

# Using parameter expansion (entire string)
uppercase_text=${string^^}
echo "Entire string uppercase: $uppercase_text"

# Using parameter expansion (first letter)
uppercase_text=${string^}
echo "First letter uppercase: $uppercase_text"

# Using tr command
uppercase_text=$(tr '[:lower:]' '[:upper:]' <<< "$string")
echo "Uppercase with tr: $uppercase_text"

# Using awk command
uppercase_text=$(awk '{print toupper($0)}' <<< "$string")
echo "Uppercase with awk: $uppercase_text"