04_Shellprogramming

배시 쉘 프로그래밍

1. 선수지식

	1) 명령어
		grep CMD
			# grep Options Patterns file1
				Options : -i, -v, -l, -n, -r, -w
				Patterns : *, ., ^root, root$, [abc] [a-c] [^a]
		sed CMD
			p CMD) # sed -n '1,3p' /etc/hosts
			d CMD) # sed '1,3d' /etc/hosts
			s CMD) # sed '/main/s/192.168.10.10/192.168.10.50/' hosts
		awk CMD
			# awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' /etc/passwd 
			# df -h / | tail -1 | awk '{print $6}' | awk -F% '{print $1}'
			# ifconfig eth0 | grep inet | grep -v inet6 | awk '{print $2}' | awk -F: '{print $2}'
			# ps -elf | awk '$2 == "Z" {print $0}'
		+
		CMD(sort CMD, cut CMD....)
	2) 쉘의 특성
		Redirection(<, 0<, >, 1>, >>, 1>>, 2>, 2>>)
		Pipe(|)
		Variable
		Metacharacter('', "", ``, ;)
		History
		Alias
		Function
			(선언) Fun() {CMD; CMD;}
			(실행) fun
			(확인) typeset -f
			(해제) unset -f fun
		Environment File(s) (/etc/profile, ~/.bashrc, ~/.bash_profile)
		
		cat CMD + <<
		Grouping
		&&, ||
			- A && B
			- A && B || C
			- A || B
		Dirname/Basename CMD
		eval CMD
		
		linux) vscode
		win) vscode

2. Shell Script/Shell Programming

	1) 프로그램 작성과 실행
		# bash -x script.sh
		# . ~/.bashrc
		# vi script.sh ; chmod +x script.sh ; ./script.sh
		[참고] 매직넘버(#!/bin/bash)
			# vi script.sh ; chmod +x script.sh ; ./script.sh
	
	2) 주석처리
		* 한줄 주석 : #....
		* 여러줄 주석 : <<EOF 
						....
						EOF
	
	3) 입력 & 출력
		출력 : echo CMD, printf CMD
		입력 : read CMD
	
	4) 산술 연산
		expr 1 + 2
		expr 1 \* 3 곱하기는 주의
		expr 10 / 2  
		expr 10 % 3 나머지
	
	5) 조건문 if , case
		if문
			if 조건; then
				statment1
			elif 조건; then
				statment2
			else
				statment3
			fi
		case문
			case VAR in
				pattern1 | pattern2 | ....) statement ;;
				pattern3 | pattern4 | ....) statement ;;
				.....
				*) statement ;;
			esac
	6) 반복문: for문, while문
		for 문: for문 + seq CMD
			for var in var_list
			do
				statement
			done
		while문: while문 + continue/break
			while 조건
			do
				statement
			done
	7) 함수
		선언) fun() {CMD; CMD;}
			 function fun { CMD; CMD; }
		실행) fun
		확인) typeset -f
		해제) unset -f fun
		
		함수 입력: 인자 ($1,$2,$3,...)
		함수 출력: echo $RET
	
	8) IO리다이렉션 자식 프로세스
		for LINE in $(cat file1)
		do
			echo $LINE
		done
		
		cat file1 | while read LINE
		do
			echo $LINE
		done
	
	9) 시그널 제어(Signal Trap)
		* 시그널 무시
		* 시그널 받으면 개발자가 원하는 동작
	
	10) 디버깅
		* bash -x script.sh
		* bash -xv script.sh

	11) 옵션 처리
		getopts CMD + while CMD + case CMD
		(예) # ssh.sh -p 80 192.168.10.20
		while getopts p: options
		do 
			case $options in
				p ) P_Action ;;
				\?) Usage ;;
				* ) Usage ;;
			esac
		done
		
		shift $(expr $OPTIND - 1)
		if [ $# -ne 1 ] ; then
			usage
		fi
