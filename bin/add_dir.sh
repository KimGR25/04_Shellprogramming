#!/bin/bash

workdir=/test
mkdir -p $workdir
rm -rf $workdir/*

for dir in $(seq 4)
do
    mkdir -p $workdir/$dir

    for dir2 in $(seq 4)
    do
        mkdir -p $workdir/$dir/$dir2
    done
done