#!/usr/bin/env bash

declare -A email_addresses=(
    ["Test01"]="test01@gmail.com"
    ["Test02"]="test02@gmail.com"
    ["Test03"]="test03@gmail.com"
    ["Test04"]="test04@gmail.com"
    ["Test05"]="test05@gmail.com" )

for key1 in "${!email_addresses[@]}"; do
    echo "${key1}'s email is ${email_addresses[${key1}]}"
done

echo "${email_addresses[@]}"