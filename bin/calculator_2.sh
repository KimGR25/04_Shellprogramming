#!/bin/bash

echo -n "enter A : "
read A
echo -n "enter oper : "
read oper
echo -n "enter B : "
read B

if [ "$oper" = "+" ] ; then
    echo "$A + $B = $(expr $A + $B)"
elif [ "$oper" = "-" ] ; then
    echo "$A - $B = $(expr $A - $B)"
elif [ "$oper" = '*' ] ; then
    echo "$A * $B = $(expr $A \* $B)"
elif [ "$oper" = "/" ] ; then
    echo "$A / $B = $(expr $A / $B)"
else 
    echo "[FAIL] 계산을 할 수 없습니다."
fi