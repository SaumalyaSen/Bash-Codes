#!/bin/bash

################
# Saumalya Sen #
################

# Write a Bash script that accepts a number n and performs the following operations using nested loops and a nested if-else ladder:
# > For every number from 1 to n, check:
# > If the number is divisible by 3, print "Fizz".
# > If the number is divisible by 5, print "Buzz".
# > If the number is divisible by both 3 and 5, print "FizzBuzz".
# > Otherwise, print the number itself.

# Taking input from user
read -p "Enter a number till you want to check FizzBuzz: " num
# Initialised "i"
i=1
# Printing numbers till user gave the input
while [ $i -le $num ]; 
do
	# Checking if the number is divisible by both 3 & 5 or not
	if [ $((i % 3)) -eq 0 ] && [ $((i % 5)) -eq 0 ]; 
	then
		echo "Fizz-Buzz"
	# Checking if the number is divisible by 3
	elif [ $((i % 3)) -eq 0 ]; 
	then
		echo "Fizz"
	# Checking if the number is divisible by 5
	elif [ $((i % 5)) -eq 0 ];
	then
		echo "Buzz"
	# Printing the number itself if it is not divisible by 3 or 5
	else
		echo "$i"
	fi
	# i increment
	i=$((i + 1))
done

# Input:
# Enter a number till you want to check FizzBuzz: 20

# Output:
# 1
# 2
# Fizz
# 4
# Buzz
# Fizz
# 7
# 8
# Fizz
# Buzz
# 11
# Fizz
# 13
# 14
# Fizz-Buzz
# 16
# 17
# Fizz
# 19
# Buzz
