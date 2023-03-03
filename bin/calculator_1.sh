#!/bin/bash

echo -n "첫번째 숫자를 입력하세요 : "
read num1

echo -n "두번째 숫자를 입력하세요 : "
read num2

echo "========================================"
echo "    (1) + | (2) - | (3) * | (4) /       "
echo "========================================"

echo -n "번호를 선택 하세요 (1|2|3|4) : "
read oper

case $oper in
    1) echo "$num1 + $num2 = $(expr $num1 + $num2)" ;;
    2) echo "$num1 - $num2 = $(expr $num1 - $num2)" ;;
    3) echo "$num1 * $num2 = $(expr $num1 \* $num2)" ;;
    4) echo "$num1 / $num2 = $(expr $num1 / $num2)" ;;
    *) echo "[FAIL] 계산불가" ; exit 1  ;;
esac