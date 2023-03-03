#!/bin/bash

log=/var/log/messages
tmp1=/tmp/tmp1
tmp2=/tmp/tmp2
tmp3=/tmp/tmp3

egrep -i 'warn|fail|error|crit|alert|emerg' $log > $tmp1

while true
 do
    sleep 30
    egrep -i 'warn|fail|error|crit|alert|emerg' $log > $tmp2
    diff $tmp1 $tmp2 > $tmp3
    if [ -s $tmp3 ]; then
        mailx -s '[ WARN ] LOG CHECK' root < $tmp3
        egrep -i 'warn|fail|error|crit|alert|emerg' $log > $tmp1
    fi
done