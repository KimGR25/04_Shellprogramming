#!/bin/bash

echo -n "너의 선택은? ( yes | no )"
read choice

case $choice in
    yes | y | YES | Y | Yes) echo " yes ~~~" ;;
    no | n | NO | N | No) echo " no~~~~~" ;;
    *) echo "[FAIL!]"
       exit 1 ;;
esac