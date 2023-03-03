#!/bin/bash

if [ $# -ne 2 ] ; then
    echo "Usage: $0 <pattern> <filename>"
    exit 1
fi
pattern=$1
filename=$2

grep $pattern $filename > /dev/null 2>&1

if [ $? -eq 0 ] ; then
    echo "[ OK! ] 찾음"
else
    echo "[ FAIL! ] 못찾음"
fi