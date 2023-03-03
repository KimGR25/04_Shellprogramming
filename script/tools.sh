#!/bin/bash

cat << EOF
====================================================
  (1). who      (2). date     (3). pwd              
====================================================
EOF

echo -n "번호를 선택해 주세요 ( 1 | 2 | 3 ) ? "
read number

case $number in
    1) who ;;
    2) date ;;
    3) pwd ;;
    *) "[ FAIL ] 번호를 잘못 선택했습니다." ;;
esac