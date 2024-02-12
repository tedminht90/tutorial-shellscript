#!/usr/bin/env bash

IFS=','
args_at="$@"
args_star="$*"
print_section_header() {
    local section_name="$1"
    echo "=============================="
    echo "= Section $section_name ="
    echo "=============================="
}

print_section_header "1: Using \$@ Variable"
echo "--> Output of \$@: $@"
echo "--> Output of \$@ in a loop:"
for arg in ${args_at}; do
    echo "----> ${arg}"
done
print_section_header "2: Using \$* Variable"
echo "--> Output of \$@: $*"
echo "--> Output of \$* in a loop:"
for arg in ${args_star}; do
    echo "----> ${arg}"
done

# ./modified-ifs-v2.sh "1,2,3,4,5,6,7,8,9,10"
# ==============================
# = Section 1: Using $@ Variable =
# ==============================
# --> Output of $@: 1,2,3,4,5,6,7,8,9,10
# --> Output of $@ in a loop:
# ----> 1
# ----> 2
# ----> 3
# ----> 4
# ----> 5
# ----> 6
# ----> 7
# ----> 8
# ----> 9
# ----> 10
# ==============================
# = Section 2: Using $* Variable =
# ==============================
# --> Output of $@: 1,2,3,4,5,6,7,8,9,10
# --> Output of $* in a loop:
# ----> 1
# ----> 2
# ----> 3
# ----> 4
# ----> 5
# ----> 6
# ----> 7
# ----> 8
# ----> 9
# ----> 10