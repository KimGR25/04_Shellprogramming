#!/bin/bash

echo -n "파일 이름은? : "
read file1

if [ -f $file1 ] ; then
    echo "일반 파일 입니다." 
elif [ -d $file1 ] ; then
    echo "디렉토리 파일 입니다."
else
    echo "알수없는 파일입니다."
fi