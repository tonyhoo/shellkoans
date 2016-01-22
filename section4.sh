EXERCISE_NUMBER=0
TOTAL_ALLOWED_EXERCISE=2

# Exercise 1:
# Write a shell script that consists of a function that display the number of files in the present
# working directory. Name this function "file_count" and call it in your script. If you use a variable
# in your function, remember to make it a local variable.
# Hint: The wc​utility is used to count the number of lines, words, and bytes.
function e1() {
	local count=$(ls | wc -l)
	echo "Total file count under current directory is: ${count}" 
}

# Exercise 2:
# Modify the script from the previous exercise. Make the "file_count" function accept a directory
# as an argument. Next have the function display the name of the directory followed by a colon.
# Finally, display the number of files to the screen on the next line. Call the function three times.
# First, on the "/etc" directory, next on the "/var" directory and finally on the "/usr/bin" directory.
# Example output:
# /etc:
# 85
function e2(){
	local directory
	read -p "Pass in a directory name: " directory
	if [ -d $directory ]; then
		echo "$directory: "
		local count=$(ls $directory| wc -l)
		echo $count
	else
		echo "Not a directory: $directory. Exit"
		return 1
	fi
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
