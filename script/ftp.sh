#!/bin/bash

HELP () {
    cat << EOF
Commands may be abbreviated.  Commands are:

!               debug           mdir            sendport        site
$               dir             mget            put             size
account         disconnect      mkdir           pwd             status
append          exit            mls             quit            struct
ascii           form            mode            quote           system
bell            get             modtime         recv            sunique
EOF
}

error () {
[ "$CMD" ] && echo "Invalid comand"
}

while true 
do
    echo -n "ftp> "
    read CMD
    case $CMD in
        'quit'|'bye') break ;;
        'help') HELP ;;
        *) error ;;
    esac   
done
