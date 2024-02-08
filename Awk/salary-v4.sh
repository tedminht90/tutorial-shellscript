#!/usr/bin/env bash

readonly UP_HEADER="======Need to be adjusted up======"
readonly DOWN_HEADER="======Need to be adjusted down======"


# 1: Tham số đầu tiên được truyền vào script khi chạy.
# -: Toán tử kiểm tra giá trị null.
# 90000: Giá trị mặc định được gán cho biến "high_salary" nếu tham số đầu tiên không được truyền hoặc có giá trị null.
high_salary="${1:-90000}"
low_salary="${2:-65000}"

awk -F "|" -v high_salary="${high_salary}" -v low_salary="${low_salary}" -v up_header="${UP_HEADER}" -v down_header="${DOWN_HEADER}" '
$7 >= high_salary {
    if (!printed_up_header) {
        print down_header
        printed_up_header = 1
    }
    print $2, $3 , $7
}
$7 <= low_salary {
    if (!printed_down_header) {
        print up_header
        printed_down_header = 1
    }
    print $2, $3 , $7
}'

#./salary-v4.sh <  employees.txt
#./salary-v4.sh 8000 70000 < employees.txt

