#!/bin/bash

TMP1=/tmp/tmp1

DATE=$(date +'%Y.%m.%d %H:%M:%S')
# echo -n "enter your name : "
# read NAME
OS=$(cat /etc/centos-release)
KERNEL=$(uname -sr)
CPUS=$(lscpu | grep "^CPU(s)" | awk '{print $2}')
CPUType=$(echo$(lscpu | grep '^Model name' | awk -F: '{print $2}'))
MEM=$(free | grep Mem: | awk '{print $2}')k
DISKS=$(lsblk -S | awk '$3 == "disk" {print $0}' | wc -l)


cat << EOF
Server Vul. Checker version 1.0

DATE: $DATE
NAME: NAME

(1) Server Information
============================================
OS     : $OS
Kernel : $KERNEL
CPU    : $CPUS ($CPUType)
MEM    : $MEM
DISK   : $DISKS
EOF


nmcli connection | grep -vw ' -- ' | tail -n +2 | awk '{print $4}' > $TMP1
DNS=$(for i in $(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
do 
    echo -n "$i "
done
)

SEQ=$(nmcli connection | grep -vw ' -- ' | tail -n +2 | wc -l)
for i in $(seq $SEQ)
do
    NIC=$(sed -n "${i}p" $TMP1)
cat << EOF
Net work ${i} ($NIC) :
    IP           : $(ifconfig $NIC | grep 'inet ' | awk '{print $2}')
    Netmask      : $(ifconfig $NIC | grep 'inet ' | awk '{print $4}')
EOF
done
echo "  Defaultrouter : $(ip route | grep default | awk '{print $3}' | head -1)"
echo "  DNS          : $DNS"