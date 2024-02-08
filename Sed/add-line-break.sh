# Okay, so, your first task at Calestone Book Publisher has been completed.
#You have saved the publication of the books Frankenstein and The Old Man and The Sea, which the company had been working on very diligently.

# Upon talking to an editor, he explained to you that a line jump was needed in the 12th line of both book's txt files.

# For this, a sed insert command can be used.
# Experiment by copying and pasting the following commands in the terminal to explore how this works.
# Don’t worry, this will not modify the books, as we’re not instructing sed to replace the files yet.

# export line_number=12
# sed "${line_number}i\\
# " /usr/local/books/frankenstein.txt

# export line_number=12
# sed "${line_number}i\\
# " /usr/local/books/old-man-and-the-sea.txt

# Now, edit the script /usr/bin/add-line-break.sh and add a sed insert command we just learned to insert a line break in the positional value passed as a command line argument.
# Once you are sure that the sed command works as expected, remember to edit the sed command to include the -i flag.

# Finally, execute the script as below:

# /usr/bin/add-line-break.sh "frankenstein.txt" 12
# /usr/bin/add-line-break.sh "old-man-and-the-sea.txt" 12

# Note: Make sure to execute the script only once for each txt file, otherwise it will keep on adding a line jump on the provided line number.


#!/usr/bin/env bash

fixed_book="/usr/local/books/$(basename "${1}")"

line_number="${2}"

add_linebreak() {
    local -r input="${1}"
    local -r line_number="${2}"
    # Add sed insert command in here
    sed -i "${line_number}i\\
    " "${input}"
}

add_linebreak "${fixed_book}" "${line_number}"