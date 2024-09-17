#!/bin/bash

################
# Saumalya Sen #
################

# Qs: Write a Bash script that generates a multiplication table from 1 to a user-specified number, but with a twist:
#     > If the product of i * j is a prime number, print "Prime".
#     > Otherwise, print the product.

# Function to check if the number is prime
prime_check() {
    local num=$1

    # Checking if the number is 0 or 1
    if [ "$num" -le 1 ]
    then
        echo "1"      # Not a Prime Number
	return
    fi

    # Checking the number if it is divisible
    for (( i = 2; i <= $((num / 2)); i++ ));
    do
        if [ $((num % i)) -eq 0 ]
	then
            echo "1"  # Not a Prime Number
	    return
	fi
    done
    echo "0"  # Prime Number
}

# Taking input from user
read -p "Enter a number up to which you would like to generate the Multiplication Table: " num

# Nested for loop to print multiplication table
for (( i = 1; i <= num; i++ )); 
do
    for (( j = 1; j <= num; j++ )); 
    do
	
	# If the number is prime printing Prime instead of product
	if [ "$(prime_check "$((i * j))")" -eq 1 ]
	then
		echo -n "$((i * j)) "  # Not a Prime Number
        else
            echo -n "Prime "  # Prime Number
        fi
    done
    echo  # Prints New line
done


# Input:
# Enter a number up to which you would like to generate the Multiplication Table: 10

# Output:
# 1 Prime Prime 4 Prime 6 Prime 8 9 10
# Prime 4 6 8 10 12 14 16 18 20
# Prime 6 9 12 15 18 21 24 27 30
# 4 8 12 16 20 24 28 32 36 40
# Prime 10 15 20 25 30 35 40 45 50
# 6 12 18 24 30 36 42 48 54 60
# Prime 14 21 28 35 42 49 56 63 70
# 8 16 24 32 40 48 56 64 72 80
# 9 18 27 36 45 54 63 72 81 90
# 10 20 30 40 50 60 70 80 90 100
