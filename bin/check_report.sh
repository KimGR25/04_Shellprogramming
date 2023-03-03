#!/bin/bash

if [ $# -ne 1 ] ; then
    echo "[ FAIL ] usage: $0 <U-#>"
    exit 1
fi

pointname=$1
file1=/root/bin/report.txt

NUM1=$(echo $pointname | awk -F- '{print $2}')
NUM2=$(expr $NUM1 + 1)

sed -n "/U-$NUM1/,/U-$NUM2/p" $file1 | grep -v "U-$NUM2"