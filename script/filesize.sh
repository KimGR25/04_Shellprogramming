#!/bin/bash

if [ $# -ne 1 ] ; then
    echo "Usage: $0 <filename>"
    exit 1
fi

file1="$1"

filesize=$(wc -c < "$file1")
# echo $filesize

if [ $filesize -ge 5120 ] ; then
    echo "큰파일 ($filesize)bytes"
else
    echo "작은 파일 ($filesize)bytes "
fi