#!/bin/bash 

usage() {
    echo "Usage: $0 {httpd|nginx}"
    exit 1
}

[ $# -ne 1 ] && usage


web=$1

case $web in
    'httpd') systemctl stop nginx ; /root/bin/httpd.sh ;;
    'nginx') systemctl stop httpd ; /root/bin/nginx.sh ;;
    *) usage ;;
esac