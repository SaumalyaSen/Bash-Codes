#!/bin/bash

################
# Saumalya Sen #
################

# Write a shell script to print the sum of first N natural numbers.

# taking input from user
read -p "Enter the value of N: " N

# initialising the value of sum
sum=0

# iterating for loop N times
for (( i=1; i<=$N; i++ )); do

	# adding natural numbers one by one
	sum=`expr $sum + $i`

done

# printing the sum of first N natural numbers
echo "Sum of first $N numbers is $sum"

