#!/usr/bin/env bash

declare -a lunch_options #Khai báo một mảng
work_dir=$(dirname "$(readlink -f "${0}")")
food_places="${work_dir}/food_places.txt"
readonly FILE_NOT_FOUND="150"
readonly NO_OPTIONS_LEFT="180"

terminate() {
    local -r msg="$1"
    local -r code="${2:-160}"
    echo "Error: ${msg}" >&2
    exit "${code}"
}

if [[ ! -f "${food_places}" ]]; then
    terminate "The file ${food_places} does not exist." "${FILE_NOT_FOUND}"
fi

fillout_array() {
    # mapfile -t là một lệnh trong Bash dùng để đọc từng dòng từ một tập tin và lưu trữ các giá trị vào một mảng.
    mapfile -t lunch_options < "${food_places}"

    if [[ "${#lunch_options[@]}" -eq 0 ]]; then
        terminate "The file ${food_places} is empty. Please add food options to food_places.txt" "${NO_OPTIONS_LEFT}"
    fi
}

# Cập nhật lại file food_places.txt
update_options() {
    if [[ "${#lunch_options[@]}" -eq 0 ]]; then
        : > "${food_places}"
    else
        printf "%s\n" "${lunch_options[@]}" > "${food_places}"
    fi
}

fillout_array

index=$((RANDOM % "${#lunch_options[@]}"))

echo "${lunch_options[${index}]}"

# Xoá các phần tử trong mảng tránh trùng lặp hiển thị
unset "lunch_options[${index}]"
# Gọi hàm cập nhật food_places.txt
update_options