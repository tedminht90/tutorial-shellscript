# Modify the script /usr/bin/book-fixer.sh as below:

#!/usr/bin/env bash

usage() {
  cat <<USAGE
Usage: "${0##*/}" <book_to_process> <fixed_book>
    This script processes a book file and performs operations based on user input.

Arguments:
    book_to_process    Path to the book file to be processed.
    fixed_book         Path to the output fixed book file.
USAGE
}

terminate() {
  local -r msg="${1}"
  local -r code="${2:-150}"
  echo "${msg}" >&2
  exit "${code}"
}

if [[ $# -lt 2 ]]; then
  usage
  terminate "Two command-line arguments are required." 1
fi

if [[ ! -s "${1}" ]]; then
  terminate "Invalid file or empty file: ${1}" 1
fi

book_to_process="${1}"
fixed_book="/usr/local/books/$(basename "${2}")"

echo "Enter 1 if you want to process uneven lines, or 2 if you want to process even lines:"
read -r choice

process_even() {
  local -r result="${2}"
  local -r input="${1}"
  sed -n 'n;p' "${input}" >"${result}"
}

process_uneven() {
  local -r result="${2}"
  local -r input="${1}"
  sed -n 'p;n' "${input}" >"${result}"
}

case $choice in
1)
  process_uneven "${book_to_process}" "${fixed_book}"
  ;;
2)
  process_even "${book_to_process}" "${fixed_book}"
  ;;
*)
  terminate "Invalid choice. Exiting..." 1
  ;;
esac

# Execute the script:

# /usr/bin/book-fixer.sh "/usr/local/books/mixed-book.txt" "old-man-and-the-sea.txt"
# when prompted, type option 2


# Execute the script again:

# /usr/bin/book-fixer.sh "/usr/local/books/mixed-book.txt" "frankenstein.txt"
# when prompted, type option 1