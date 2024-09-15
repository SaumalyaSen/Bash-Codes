#!/bin/bash

################
# Saumalya Sen #
################

# Write a Bash script that continuously prompts the user for a number until they enter a negative number. The script should then calculate and print the sum of all the positive numbers entered.

# Taking first input from user
read -p "Enter your Number: " num

# Initialised sum as 0 or null
sum=0

# Checking if the input is lesser than 0 or not
while [ $num -ge 0 ]
do
	# Adding the positive numbers
	sum=`expr $sum + $num`

	# Taking the next input from user
	read -p "Enter your Number: " num

done

# Printing the sum of all positive numbers
echo "Sum of Positive Numbers: $sum"
