#!/bin/ksh

# # cat /etc/hosts
# ::1		localhost
# 127.0.0.1	localhost
# 172.16.8.200  	solaris200  solaris200.example.com  loghost
# 172.16.8.201  	solaris201
# 172.16.8.202  	solaris202
# ......

START_IP=200
END_IP=229
# HOSTS=/etc/hosts
HOSTS=hosts
C_IP=`ifconfig pcn0 | grep inet | awk '{print $2}' | awk -F. '{print $4}'`   

echo "::1     localhost"    >  $HOSTS
echo "127.0.0.1  localhost" >> $HOSTS
echo "172.16.8.$C_IP  solaris$C_IP  solaris${C_IP}.example.com   loghost" >> $HOSTS

while [ $START_IP -le $END_IP ]
do
    if [ $C_IP -eq $START_IP ] ; then     
        START_IP=`expr $START_IP + 1`
    fi
    echo "172.16.8.$START_IP    solaris$START_IP" >> $HOSTS
    START_IP=`expr $START_IP + 1`
done