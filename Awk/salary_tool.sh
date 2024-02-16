#!/bin/bash

salary_file="salary.txt"

# sum all salaries
awk '{ sum += $1 } END { printf("Total Salary: %d\n", sum) }' "${salary_file}"


# sum += $1 -> cộng dồn các giá trị cột 1
awk '{ sum += $1 } {printf ("Sum: %d\n", sum)}' "${salary_file}"

# Your awk command goes here
# Average salary sum/ column count
awk '{ sum += $1 } END { printf("Average Salary: %d\n", sum / NR) }' "${salary_file}"

# awk -v awk_var="Hello" 'END { print awk_var }' lines.txt

# awk -v awk_var="Hello" 'BEGIN { print awk_var }' lines.txt