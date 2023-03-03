#!/bin/bash

IP1=192.168.50.251
PORT1=21

ftp -n $IP1 $PORT1 << EOF
user user01 user01
lcd /test
bin
hash
prompt
mput server1.tar.gz
quit
EOF