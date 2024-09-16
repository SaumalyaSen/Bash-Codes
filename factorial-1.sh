#!/bin/bash

################
# Saumalya Sen #
################

# Write a Bash script that iterates through a list of numbers and calculates the factorial of each number. Print the factorial of each number along with the corresponding number.

# Initialised an Array
array=()

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


# Taking input from user, howmnay numbers are in the array
read -p "Enter the number of elements in list: " num_elements

# Inserting the elemnts into the array
for ((i=1; i<=num_elements; i++));
do
	read -p "Enter array element-$((i)): " element
	array+=($element)
done

# Iterating the array elements
for element in ${array[@]};
do
	# Executing the factorial of each number
	fact=$(factorial $element)

	# Printing the value of the factorial
        echo "Factorial of $element is: $fact"
	
done

# Input:

# Enter the number of elements in list: 4
# Enter array element-1: 2
# Enter array element-2: 5
# Enter array element-3: 8
# Enter array element-4: 11

# Output:

# Factorial of 2 is: 2
# Factorial of 5 is: 120
# Factorial of 8 is: 40320
# Factorial of 11 is: 39916800
