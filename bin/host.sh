#!/bin/bash

# # cat /etc/hosts
# 192.168.10.10 server10.example.com server10
# 192.168.10.11 server11.example.com server11
# 192.168.10.12 server12.example.com server12
# ....
# 192.168.10.30 server30.example.com server30

Hosts=/root/bin/hosts
> $Hosts
Net=192.168.10
echo -n "set Start_IP : "
read Start_IP
echo -n "set End_IP : "
read End_IP

while [ $Start_IP -le $End_IP ]
do
    echo "192.168.10.$Start_IP server$Start_IP.example.com server$Start_IP"
    Start_IP=`expr $Start_IP + 1`
done