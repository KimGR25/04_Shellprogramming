#!/bin/bash

. /root/bin/functions.sh

# 1) Local Network Connection
# 2) External Network Connection
# 3) DNS Client Connection

IP1=192.168.10.2
IP2=8.8.8.8
IP3=www.google.com

# 1) Local Network Connection
print_info "(1) ping $IP1"
ping -c 1 $IP1 -W 2 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good " [ OK ] Local Network Connection " 
else
    print_error " [ FAIL ] Local Network Connection "
    echo "      (a) 물리적인 연결 확인 "
    echo "           # ethtool <NIC> "
    echo "      (b) IP/NETMASK 확인 "
    echo "           # ip addr "
    echo "      (c) VMware VMnet8 설정 "
    echo "           # VMWare > Edit > Virtual Network Editor > VMnet8 > 192.168.10.0/255.255.255.0 "
    echo "      (d) VMware 서비스 확인 "
    echo "           # service.msc > VMware 확인 "
    exit 1
fi
# 2) External Network Connection
print_info "(2) ping $IP2"
ping -c 1 $IP2 -W 2 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good " [ OK ] External Network Connection " 
else
    print_error " [ FAIL ] External Network Connection "
    echo "      (a) ip route(netstat -nr)"
    exit 2
fi
# 3) DNS Client Connection
print_info "(3) ping $IP3"
ping -c 1 $IP3 -W 2 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good " [ OK ] DNS Client Connection " 
else
    print_error " [ FAIL ] DNS Client Connection "
    echo "      (a) cat /etc/resolv.conf"
    exit 3
fi