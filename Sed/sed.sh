#!/usr/bin/env bash

# Print with sed
sed 'p'
# Hello from sed command -> input to keyboard
# Hello from sed command -> Unprocessed output
# Hello from sed command -> Processed output
# cmd + d -> exit

echo "This line will print twice" | sed 'p'
# This line will print twice -> input file
# This line will print twice

echo "This line will print twice" > file_sample.txt
cat "This line will print twice" > file_sample.txt
# This line will print twice
sed 'p' file_sample.txt
# This line will print twice
# This line will print twice

sed '2p' test.txt # print the second line twice
# 111
# 22
# 22
# 333

sed -n 'p' # -n Automatic printing of the input lines

sed -n '2p' test.txt # print the second line
# 22 -n Automatic printing of unprocess input lines

df -h | sed -n '3p'
# devfs            347Ki   347Ki     0Bi   100%    1.2k     0  100%   /dev

sed -n '5p' employees.txt
# 5|Feng|Lin|Sales|Sales Manager|feng.lin@company.com|90000

sed d # delete text
sed s # substitute text
sed a # adding text

=============================================
# Delete lines with sed
sed '2d' employees.txt # delete the second line

sed '3,5d' employees.txt # delete the third to fifth line

sed -i '2,7d' employees.txt # delete the second to seventh line and save the changes

=============================================
# Search with sed
sed -n '/Manager/p' employees.txt # search for the word Manager and print the line

# 5|Feng|Lin|Sales|Sales Manager|feng.lin@company.com|90000
# 6|Andy|Luscomb|IT|IT Manager|andy.luscomb@company.com|95000
# 7|Mark|Crocler|HR|HR Manager|mark.crocker@company.com|85000
# 8|Jing|Ma|Engineering|Engineering Manager|jing.ma@company.com|100000

sed -n '/\bMa\b/p' employees.txt # search for the word Ma and print the line
#8|Jing|Ma|Engineering|Engineering Manager|jing.ma@company.com|100000

sed -n -e '/\bManager\b/p' -e '/\bIT\b/p' employees.txt # search for the word Manager Or IT and print the line

sed -e '/\Ma\b/d' employees.txt # search for the word Ma and delete the line

sed -i -e '/\bManager\b/d' -e '/\bIT\b/d' employees.txt # search for the word Manager Or IT and delete the line and save the changes

=============================================
# Substitute with sed

sed 's/65000/85000/' employees.txt # s -> substitute 65000 with 85000

# sed -e -> -e là một tùy chọn quan trọng của sed dùng để chỉ định các lệnh chỉnh sửa

sed -e 's/\bIT\b/Information Technology/' employees.txt # s -> substitute IT with Information Technology

sed -e 's/\bIT\b/Information Technology/g' employees.txt # s -> substitute IT with Information Technology globally

sed -e 's/\bIT\b/Information Technology/2' employees.txt # s -> substitute IT with Information Technology in the second scope

sed -e '7 s/\bHR\b/Human Resources/' employees.txt # s -> substitute HR with Human Resources in the seventh line

sed -e '1,3 s/Finance/Taxes/1' employees.txt # s -> substitute Finance with Taxes in the first to third line in the first scope

sed -i 's/\company\b/KodeKloud/g' employees.txt # s -> substitute company with KodeKloud and save the changes

sed '1iID|First Name|Last Name|Department|Position|Email|Salary' employees.txt # i -> insert text before the first line

=============================================

# Execute below command to print even numbers:

sed -n 'n;p' lines.txt

# Execute below command to print uneven numbers:

sed -n 'p;n' lines.txt

