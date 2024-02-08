# In your home directory (/home/bob), you will find a directory named script which has a script called todo.sh. Running the script prompts the user to enter items, which get stored in an array.

# Modify the todo.sh script to print all items in the array once you’ve stopped inputting new ones.

# Test the script using these inputs:

# Meditate
# Hydrate
# Work
# Study
# Exercise
# Sleep

# Remember to type stop when you are done adding items to the array.

# Execute the script to ensure your changes work fine.




#!/bin/bash
declare -a todo_list
while read -p "Add items to your to do list (or type 'stop' to stop adding): " todo; do
  if [[ "${todo}" == "stop" ]]; then
    break
  fi
  todo_list+=("${todo}")
done
echo "Current todo list: ${todo_list[@]}"

#After the array is printed, add a line of code that deletes all of the elements except the last one, from the array, and then print the array again to demonstrate how the lines were deleted.
#option 1
todo_list=${todo_list[@]: -1}

#option 2
# length=${#todo_list[@]}
# for ((i=0; i < $length - 1; i++));do
#   unset todo_list[$i]
# done

echo "Remaining todo list: ${todo_list[@]}"

# Add a line of code to sort the elements from the script in alphabetical order.

sorted_array=$(printf "%s\n" "${todo_list[@]}" | sort )

printf "%s\n" "Sorted todo list:" ${sorted_array[@]}