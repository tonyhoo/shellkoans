#!/bin/sh

EXERCISE_NUMBER=0
TOTAL_ALLOWED_EXERCISE=2

# Exercise 1:
# Write a shell script that displays one random number to the screen and also generates a syslog
# message with that random number. Use the "user" facility and the "info" facility for your
# messages.
# Hint: Use $RANDOM
function e1() {
	local number=$RANDOM
	local message="Writing $number to the log"
	echo $message
	logger  -p user.notice $message
}

# Exercise 2:
# Modify the previous script so that it uses a logging function. Additionally tag each syslog
# message with "randomly" and include the process ID. Generate 3 random numbers.
function e2() {
	local number=$RANDOM
	local message="Writing $number to the log"
	echo $message
	logger  -p user.notice -t "randomly" -i $message
}

function run() {
	if [ $# -ne 1 ]
	then
		echo "No exercise selected!"
		read -p "Please pass in the exercise number[1-${TOTAL_ALLOWED_EXERCISE}]: "  EXERCISE_NUMBER
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