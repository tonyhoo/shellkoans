#!/bin/bash

EXERCISE_NUMBER=0
TOTAL_ALLOWED_EXERCISE=8

# Exercise 1:
# Write a shell script that prints "Shell Scripting is Fun!" to the screen.
# Hint 1:
# Remember to make the shell script executable with the chmod command.
# Hint 2:
# Remember to start your script with a shebang!
function e1 () {
	echo "Shell Scripting is Fun!"
}

# Exercise 2:
# Modify the shell script from exercise 1 to include a variable. The variable will hold the contents
# of the message "Shell Scripting is Fun!".
function e2() {
	VARIABLE="Shell Scripting is Fun!"
	echo $VARIABLE is assigned
}

# Exercise 3:
# Store the output of the command "hostname" in a variable. Display "This script is running on
# _______." where "_______" is the output of the "hostname" command.
# Hint:
# It's a best practice to use the ${VARIABLE} syntax if there is text or characters that directly
# preceed or follow the variable.
function e3(){
	echo "This script is running on $(hostname)."
}

# Exercise 4:
# Write a shell script to check to see if the file "/etc/shadow" exists. If it does exist, display
# "Shadow passwords are enabled." Next, check to see if you can write to the file. If you can,
# display "You have permissions to edit /etc/shadow." If you cannot, display "You do NOT have
# permissions to edit /etc/shadow."
# LinuxTrainingAcademy.com
function e4() {
	FILE_NAME="/etc/shadow"
	[ -e $FILE_NAME ] && echo "Shadow passwords are enabled."
	[ -w $FILE_NAME ] && echo "You have permissions to edit ${FILE_NAME}." || echo "You do NOT have permissions to edit ${FILE_NAME}"
}

# Exercise 5:
# Write a shell script that displays "man", "bear", "pig", "dog", "cat", and sheep to the screen with
# each appearing on a separate line. Try to do this in as few lines as possible.
# Hint: Loops can be used to perform repetitive tasks.
function e5(){
	VARS="man bear pig dog cat sheep"
	for VAR in $VARS
	do echo $VAR
	done
}


# Exercise 6:
# Write a shell script that prompts the user for a name of a file or directory and reports if it is a
# regular file, a directory, or other type of file.
# Also perform an ls command against the file or directory with the long listing option.
function e6(){
	read -p "Please enter one file name: " FILE
	[ -f $FILE ] && echo "File is a regular file" && ls -l $FILE && return
	[ -d $FILE ] && echo "File is a directory" && ls -ld $FILE && return
	[ -e $FILE ] && echo "File is of other type" && ls -l $FILE ] || echo "File doesnt exist"
 

}

# Exercise 7:
# Modify the previous script so that it accepts the file or directory name as an argument instead of
# prompting the user to enter it.
function e7(){
	if [ "$#" -eq 1 ]
		then
			FILE=$1
			[ -f $FILE ] && echo "File is a regular file" && ls -l $FILE && return
			[ -d $FILE ] && echo "File is a directory" && ls -ld $FILE && return
			[ -e $FILE ] && echo "File is of other type" && ls -l $FILE ] || echo "File doesnt exist"
		else
			e6
	fi
}


# Exercise 8:
# Modify the previous script to accept an unlimited number of files and directories as arguments.
# Hint: You'll want to use a special variable.
function e8(){
	read -p "Please enter file names cut by whitespace: " FILES
	if [ ${#FILES[@]} -gt 0 ]
		then
			for FILE in $FILES
			do 
				echo -n "${FILE}: "
				[ -f $FILE ] && echo "File is a regular file" && ls -l $FILE && continue
				[ -d $FILE ] && echo "File is a directory" && ls -ld $FILE && continue
				[ -e $FILE ] && echo "File is of other type" && ls -l $FILE ] || echo "File doesnt exist"
			done
		else
			e6
	fi
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




