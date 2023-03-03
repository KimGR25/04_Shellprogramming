#!/bin/bash

alivelist=/root/bin/alive.txt
> /root/bin/alive.txt

cat /root/bin/server.txt | while read ip1 uname upass
do
    ping -c 1 -W 1 $ip1 > /dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo "[ OK ] $ip1 alive."
        echo "$ip1" >> $alivelist
    else
        echo "[ FAIL] $ip shutdown."
    fi  
done

CMD() {
    sleep 4 ; echo 'root'
    sleep 1 ; echo 'centos'
    sleep 0.5 ; echo 'poweroff'
    sleep 0.5 ; echo 'exit'
}
cat $alivelist | while read ip1
do
    CMD | telnet $ip1
done