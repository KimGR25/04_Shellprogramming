#!/bin/bash

IP1=server2
UNAME=root
UPASS=centos

CMD() {
    sleep 4 ; echo "$UNAME"
    sleep 1 ; echo "$UPASS"
    sleep 1 ; echo "tar cvzf /tmp/$IP1.tar.gz /home"
    sleep 1 ; echo 'date'
    sleep 1 ; echo 'exit'
}
CMD | telnet $IP1

ftp -n $IP1 << EOF
    user $UNAME $UPASS
    cd /tmp
    lcd /test
    bin
    hash
    prompt
    mget $IP1.tar.gz
    quit
EOF