#!/bin/bash

EXERCISE_NUMBER=0
TOTAL_ALLOWED_EXERCISE=3


# Exercise 1:
# Write a shell script that displays "This script will exit with a 0 exit status." Be sure that the script
# does indeed exit with a 0 exit status.
function e1(){
	echo "This script will exit with a 0 exit status."
	exit 0
}

# Exercise 2:
# Write a shell script that accepts a file or directory name as an argument. Have the script report
# if it is a regular file, a directory, or other type of file. If it is a regular file, exit with a 0 exit status.
# If it is a directory, exit with a 1 exit status. If it is some other type of file, exit with a 2 exit status.
function e2(){
	read -p "Please pass in the file/directory name: " NAME
	[ -f "$NAME" ] && echo "This is regular file. Exit successfully" &&exit 0
	[ -d "$NAME" ] && echo "This is directory file. Exit with error code 1" &&exit 1
	[ -e "$NAME" ] && echo "This is other file type. Exit with error code 2" &&exit 2
	echo "The file doesn't exist" && exit 3
}

# Exercise 3:
# Write a script that executes the command "cat /etc/shadow". If the command returns a 0 exit
# status report "Command succeeded" and exit with a 0 exit status. If the command returns a
# non­zero exit status report "Command failed" and exit with a 1 exit status.
function e3(){
	cat /etc/shadow
	RETURN_CODE="$?"
	[ ${RETURN_CODE} -eq 0 ] && echo "Command succeeded" && exit 0
	[ ${RETURN_CODE} -ne 0 ] && echo "Command failed" && exit 1
}

function run() {
	if [ $# -ne 1 ]
	then
		echo "No exercise selected!"
		read -p "Please pass in the exercise number[1-${TOTAL_ALLOWED_EXERCISE}]: " EXERCISE_NUMBER
	else
		EXERCISE_NUMBER=$1
    fi
	run_exercise $EXERCISE_NUMBER
}

function run_exercise() {
	if [ "$1" -le "$TOTAL_ALLOWED_EXERCISE" ]
		then 
			FUNCTION_NAME="e$1"
			$FUNCTION_NAME
    else
    	echo "Wrong exercise number passed: "$1
    fi
}
run $@
