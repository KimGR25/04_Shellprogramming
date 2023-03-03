#!/bin/bash

if [ $# -ne 2 ] ; then
    echo "usage : $0 <start | stop> <service>"
    exit 1
fi

action=$1
svc=$2
scriptname=$0

svc_start() {
    systemctl enable $svc >/dev/null 2>&1
    if [ $? -eq 0 ] ; then
        systemctl restart $svc
        systemctl status $svc
    else
        echo "[FAIL] 알수없는 서비스 이름"
        exit 3
    fi
}

svc_stop() {
    systemctl disable $svc > /dev/null 2>&1
    if [ $? -eq 0 ] ; then
        systemctl stop $svc
        systemctl status $svc
    else
        echo "[FAIL] 알수없는 서비스 이름"
        exit 4
    fi
}

err_1() {
    echo "usage : $scriptname <start|stop> <service>"
    exit 5
}

case $action in
    start) svc_start ;;
    stop) svc_stop ;;
    *) err_1 ; exit 2 ;;
esac