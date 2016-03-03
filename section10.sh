#!/bin/bash

EXERCISE_NUMBER=0
TOTAL_ALLOWED_EXERCISE=2

# Exercise 1:
# Write a shell script that exit on error and displays commands as they will execute, including all
# expansions and substitutions. Use 3 ls​commands in your script. Make the first one succeed,
# the second one fail, and the third one succeed. If you are using the proper options, the third ls
# command will not be executed.
function e1() {
	set -xe
	# This one will succeed
	ls *
	# This one will fail and -e option will exit immediately
	ls file
	# This line won't be reached
	ls section[1-2].sh
}

# Exercise 2:
# Modify the previous exercise so that script continues, even if an error occurs. This time all three
# ls ​commands will succeed.
function e2() {
	set -x
	ls *
	ls file
	ls section[2-4].sh
}

function run() {
	if [ $# -ne 1 ]
	then
		echo "No exercise selected!"
		read -p "Please pass in the exercise number[1-8]: " EXERCISE_NUMBER
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