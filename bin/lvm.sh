#!/bin/bash

TMP1=/tmp/tmp1
TMP2=/tmp/tmp2
TMP3=/tmp/tmp3
TMP4=/tmp/tmp4

# pv 생성
while true
do
echo "================================== PV 생성 ======================================="
fdisk -l | grep LVM | awk '{print $1}' > $TMP1
pvs | tail -n +2 | awk '{print $1}' > $TMP2

cat << EOF
------------- PV View---------------------------
$(cat $TMP1 $TMP2 | sort | uniq -u)
------------------------------------------------
EOF
echo "=> 위 목록에서 PV로 만들 볼륨을 선택해 주세요 "
echo -n "볼륨 선택 (/dev/sdb1 /dev/sdc1...) : "
read selectPV

echo "-------------------------------------------------------"
echo "             작업을 정말 실행하시겠습니까?               "
echo " yes(실행) no(처음부터) skip(VG생성까지 스킵) exit(종료) "
echo "-------------------------------------------------------"
echo -n "명령어를 입력해 주세요 : "
read PCselect

case $PCselect in
    yes | y | YES | Y | Yes) : ;;
    no | n | NO | N | No) continue ;;
    skip) break ;;
    exit | quit | bye) exit 0 ;;
    *) continue ;;
esac

pvcreate $selectPV > /dev/null 2>&1
if [ $? -eq 0 ] ; then
    echo "[ OK ] Physical volume "$selectPV" successfully created."
    echo "===================================================="
    pvs
    echo "===================================================="
else
    echo "[ FAIL ] No device found for $selectPV"
    exit 1
fi
echo
break
done

# vg생성
while true
do
echo "================================== VG 생성 ======================================="
vgs | tail -n +2 | awk '{print $1}' > $TMP3
pvs > $TMP4
for i in $(cat $TMP3)
do
    sed -i "/$i/d" $TMP4
done

cat << EOF
------------------- PV List---------------------
$(cat $TMP4)
------------------------------------------------
EOF
echo -n "선택가능한 PV 목록을 적어 주세요(ex: /dev/sdb1 /dev/sdc1...) : "
read PVlist
echo -n "VG 이름은(ex: vg1...) : "
read VGname

echo "-------------------------------------------------------"
echo "             작업을 정말 실행하시겠습니까?               "
echo " yes(실행) no(처음부터) skip(LV생성까지 스킵) exit(종료) "
echo "-------------------------------------------------------"
echo -n "명령어를 입력해 주세요 : "
read PCselect

case $PCselect in
    yes | y | YES | Y | Yes) : ;;
    no | n | NO | N | No) continue ;;
    skip) break ;;
    exit | quit | bye) exit 0 ;;
    *) continue ;;
esac

vgcreate $VGname $PVlist
if [ $? -eq 0 ] ; then
    echo "[ OK ] Volume group "$VGname" successfully created "
    echo "===================================================="
    vgs
    echo "===================================================="
else
    echo "[ FAIL ] Volume group not create"
    exit 2
fi
echo
break
done

# lv 생성.
while true
do
echo "================================== LV 생성 ======================================="
cat << EOF
------------------- VG List---------------------
$(vgs | awk '$7 != '0' {print $0}')
------------------------------------------------
EOF

echo -n "LV를 생성 할 VG 이름(ex: vg1 ) : "
read selectVG
echo -n "생성할 LV 이름(ex: lv1 ) : "
read LVname
echo -n "LV 용량(ex: 500m) : "
read LVsize

echo "-------------------------------------------------------"
echo "             작업을 정말 실행하시겠습니까?               "
echo "           yes(실행) no(처음부터) exit(종료)            "
echo "-------------------------------------------------------"
echo -n "명령어를 입력해 주세요 : "
read PCselect

case $PCselect in
    yes | y | YES | Y | Yes) : ;;
    no | n | NO | N | No) continue ;;
    exit | quit | bye) exit 0 ;;
    *) continue ;;
esac

lvcreate $selectVG -n $LVname -L $LVsize
if [ $? -eq 0 ] ; then
    echo "[ OK ] Logical volume "$LVname" created."
    echo "===================================================="
    lvs
    echo "===================================================="
else
    echo "[ FAIL ] Volume group not create"
    exit 3
fi
echo
break
done