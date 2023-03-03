#!/bin/bash

# for LINE in $(cat file1)
# 	do
# 		echo $LINE
# 	done
		
cat file1 | while read LINE
	do
		echo $LINE
	done