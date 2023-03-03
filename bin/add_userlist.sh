#!/bin/bash

# cat user.list

start=50
end=100
file1=/root/bin/user.list
> $file1

for i in $(seq $start $end)
do
    echo "user$i user$i" >> $file1
done