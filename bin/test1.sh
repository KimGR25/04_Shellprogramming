#!/bin/bash

for i in $(seq 1 10)
do
    PERCENT=$(expr $i \* 10)
    echo -ne "$PERCENT%|"

    for j in $(seq $i)
    do
        echo -ne "="
    done

    if [ $i -ne 10 ] ; then
        echo -ne ">"
    else
        echo -ne "| complete\n"
    fi

    echo -ne "\r"
    sleep 1
done