#!/bin/bash

Server=/root/bin/server.txt

for i in $(cat $Server)
do
    ftp -n $i << EOF
    user root centos
    cd /tmp
    lcd /test
    bin
    hash
    prompt
    mput testfile.txt
    quit
EOF
done