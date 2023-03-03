#!/bin/bash

file1=/root/bin/user.list

cat $file1 | while read uname upass
do
    userdel -r $uname
    echo "[OK] $uname"
done