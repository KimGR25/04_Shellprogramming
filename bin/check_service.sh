#!/bin/bash

if [ $# -ne 2 ] ; then
    echo "uasge : $0 <IP1> <IP2>"
    exit 1
fi

export IP1=$1
export IP2=$2
export basedir=/root/bin

Fserver=$basedir/$IP1.txt
Sserver=$basedir/$IP2.txt

Serverlist(){
    server=$1
    ssh $server systemctl -t service \
        | sed -n '1,/^LOAD/p' \
        | sed '$d' \
        | awk '{print $1, $3}' > $basedir/$server.txt
}

Serverlist $IP1
Serverlist $IP2
diff $Fserver $Sserver > $basedir/diff.txt


cat << EOF
================== "$IP1" ===================
$(cat $basedir/diff.txt | fgrep '<' | cut -c2-)

================== "$IP2" ===================
$(cat $basedir/diff.txt | fgrep '>' | cut -c2-)

EOF


