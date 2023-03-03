#!/bin/bash

# # useradd $uname
# # echo $uname | useradd --stdin $uname

file1=/root/bin/user.list

cat $file1 | while read uname upass
do
    # echo "$uname : $upass"
    useradd $uname
    echo $upass | passwd --stdin $uname > /dev/null 2>&1
    echo "[Ok] $uname"
done