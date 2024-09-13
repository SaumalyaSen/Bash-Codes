#!/bin/bash

################
# Saumalya Sen #
################

#Write a shell script that checks if a given number is positive, negative, or zero using an if-else ladder.

# Storing the input
read -p "Enter the number: " num

#Checking if it is greater than zero
if [ $num -gt 0 ]
then
	echo "$num is positive"

#Checking if it is lesser than zero	
elif [ $num -lt 0 ]
then
	echo "$num is negetive"

#Checking if it is equal to zero	
elif [ $num == 0 ]
then
	echo "Your number is zero"

#If the input is not a Number variable	
else
	echo "This is not a number"
fi
