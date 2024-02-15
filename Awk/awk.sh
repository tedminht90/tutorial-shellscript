#!/usr/bin/env bash

top | awk ' {print $2 }' | head -n 5

# abc.txt
# $1 $2 $3
# a  b  c
# d  e  f
# g  h  i

awk '{print $3 }' abc.txt # -> c f i

awk '{print "Hello" }' abc.txt # -> Hello Hello Hello (abc.txt have 3 lines, so it will print Hello 3 times)

awk '{print "Hello", "World"}' < abc.txt # -> Hello World Hello World Hello World (abc.txt have 3 lines, so it will print Hello World 3 times)

# NR is the number of records (lines) that have been read so far (row number)
# NF is the number of fields in the current record
df -h > size.txt

# NR
awk '{print NR, $1, $4 }' size.txt
# NR $1             $4
# 1  Filesystem     Avail
# 2  /dev/disk3s1s1 279Gi
# 3  devfs          0Bi
# 4  /dev/disk3s6   279Gi
# 5  /dev/disk3s2   279Gi
# 6  /dev/disk3s4   279Gi
# 7  /dev/disk1s2   481Mi
# 8  /dev/disk1s1   481Mi
# 9  /dev/disk1s3   481Mi
# 10 /dev/disk3s5   279Gi
# 11 map            0Bi

awk 'NR == 4 {print NR, $1, $4 }' size.txt
# NR $1            $4
# 4  /dev/disk3s6  279Gi

awk '{print NF}' size.txt
# 10 -> Filesystem  Size    Used    Avail   Capacity    iused   ifree   %iused  Mounted on  (10 fields)
# 9 -> /dev/disk3s1s1   460Gi   9.4Gi   279Gi     4%    394k  2.9G    0%   /  (9 fields)
# 9
# 9
# 9
# 9
# 9
# 9
# 9
# 9
# 10

awk '{ print "Number of columns in line: " NR, "is " NF }' size.txt
# Number of columns in line: 1 is 10
# Number of columns in line: 2 is 9
# Number of columns in line: 3 is 9
# Number of columns in line: 4 is 9
# Number of columns in line: 5 is 9
# Number of columns in line: 6 is 9
# Number of columns in line: 7 is 9
# Number of columns in line: 8 is 9
# Number of columns in line: 9 is 9
# Number of columns in line: 10 is 9
# Number of columns in line: 11 is 10

awk '{print $NF }' size.txt
# print the last column of each line
# on
# /
# /dev
# /System/Volumes/VM
# /System/Volumes/Preboot
# /System/Volumes/Update
# /System/Volumes/xarts
# /System/Volumes/iSCPreboot
# /System/Volumes/Hardware
# /System/Volumes/Data
# /System/Volumes/Data/home

awk '{ print FILENAME }' size.txt
# size.txt -> print the file name of each line have size.txt
# size.txt
# size.txt
# size.txt
# size.txt
# size.txt
# size.txt
# size.txt
# size.txt
# size.txt
# size.txt

awk '{ print 1 }' size.txt
# 1
# 1
# 1
# 1
# 1
# 1
# 1
# 1
# 1
# 1
# 1

awk '{ print $1 }' size.txt
# Filesystem
# /dev/disk3s1s1
# devfs
# /dev/disk3s6
# /dev/disk3s2
# /dev/disk3s4
# /dev/disk1s2
# /dev/disk1s1
# /dev/disk1s3
# /dev/disk3s5
# map

usage: awk [-F fs] [-v var=value] [-f progfile | 'prog'] [file ...]

awk -F "|" '{print $2 }' employees.txt
# Các dấu | được sử dụng để phân tách các cột trong file employees.txt
# Kriti
# Rajasekar
# Debbie
# Enrique
# Feng
# Andy
# Mark
# Jing

awk -F "|" -v var=value '{}'

awk -F "|" -v var="Employee's First Name: " '{print var, $2}' employees.txt
# Employee's First Name:  Kriti
# Employee's First Name:  Rajasekar
# Employee's First Name:  Debbie
# Employee's First Name:  Enrique
# Employee's First Name:  Feng
# Employee's First Name:  Andy
# Employee's First Name:  Mark
# Employee's First Name:  Jing

awk -F "|" -v high_salary="90000" '$7 >= high_salary {print $2,$7 }' employees.txt
# Feng 90000
# Andy 95000
# Jing 100000

awk -F "|" -v high_salary="90000"  -v low_salary="65000" '$7 >= high_salary || $7 <= low_salary {print $2,$7 }' employees.txt
# Kriti 60000
# Enrique 65000
# Feng 90000
# Andy 95000
# Jing 100000
