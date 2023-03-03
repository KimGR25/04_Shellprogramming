#!/bin/bash

Useradd() {
    echo "(사용자 추가)"
    echo
    echo -n "사용자 이름 : "
    read uname
    echo -n "비밀번호 : "
    read upass

    useradd $uname
    echo $upass | passwd --stdin $uname > /dev/null 2>&1
    if [ $? = 0 ] ; then
        echo "[OK] 정상적으로 $uname 사용자가 생성되었습니다."
    else
        echo "[FAIL] $uname 사용자가 생성되지 않았습니다."
    fi
    echo
}

UserVerify() {
    echo
    echo "사용자 목록"
    awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' /etc/passwd
    echo 
}

Userdel() {
    echo
    echo "(사용자 목록)"
    awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' /etc/passwd
    echo -n "삭제할 사용자 : "
    read deluser
    userdel -r $deluser > /dev/null 2>&1
    if [ $? = 0 ] ; then
        echo "[OK] 정상적으로 $uname 사용자가 삭제되었습니다."
    else
        echo "[FAIL] $uname 사용자가 삭제되지 않았습니다."
    fi
    echo
}

Modexit() {
    echo
    echo "관리자 모드를 종료합니다."
    exit 0
}

menu() {
cat << Eof
(관리목록)
--------------------------------------------------
(1) 사용자 추가
(2) 사용자 확인
(3) 사용자 삭제
(4) 종료
--------------------------------------------------
Eof
echo -n "select num (1|2|3|4) : "
read oper
}

while true
do
    menu
    case $oper in
        1) Useradd ;;
        2) UserVerify ;;
        3) Userdel ;;
        4) Modexit ;;
        *) echo "비정상적인 입력"; exit 1 ;;
    esac

done


