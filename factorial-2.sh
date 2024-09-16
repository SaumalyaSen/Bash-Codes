#!/bin/bash

################
# Saumalya Sen #
################

# Write a Bash script that iterates through a list of numbers (e.g., 2, 5, 8, 11) and calculates the factorial of each number. Print the factorial of each number along with the corresponding number.

# Function to calculate factorial
factorial(){
	local i=$1
	local factorial=1
	while [ $i -gt 1 ]
	do
		factorial=`expr $factorial \* $i`
                i=`expr $i - 1`
	done
	echo $factorial
}

# Take input from user
read -p "Enter numbers separated by commas (e.g.(a,b,c,d)): " input

# Remove any parentheses and split by commas
input=${input//[()]/}  # Remove parentheses if present
IFS=',' read -r -a numbers <<< "$input"  # Split input into array by commas

# Iterate over each number in the input array
for num in "${numbers[@]}"; 
do
	# Executing factorial of each Number
	fact=$(factorial $num)
	echo "Factorial of $num is: $fact"
done

# Input:

# Enter numbers separated by commas (e.g.(a,b,c,d)):
# (2,5,8,11)

# Output:

# Factorial of 2 is: 2
# Factorial of 5 is: 120
# Factorial of 8 is: 40320
# Factorial of 11 is: 39916800
