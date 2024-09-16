#!/bin/bash

################
# Saumalya Sen #
################

# Write a Bash script that simulates a guessing game. The script will generate a random number between 1 and 100, and the user has to guess it. After each guess, the script should tell the user whether the guess was too high, too low, slightly high, slightly low or correct. The loop should keep running until the user guesses the correct number. Once the correct number is guessed, the script should display how many attempts the user took.

# Target is taking a random value between 1 to 100
target=$(( RANDOM % 100 + 1 ))

# Taking input from user
read -p "Guess the Number: " num

# Initialised count as 1 to keep a count of attempts
count=1

# Checking if the number is same as target or not
while [ $num -ne $target ]
do
	
	# Checking if the number if greater than target
	if [ $num -gt $target ]
	then
		# Checking if the number is within a range of plus 10 of the actual number.
		if [ $num -le $((target+10)) ]
		then
			echo "CLUE: Slightly High! >_O"
		
		# If not then printing Too High!
		else
			echo "CLUE: Too High! O_O"
		fi
	
	else
	
		# Checking if the number is within a range of minus 10 of the actual number.
		if [ $num -ge $((target-10)) ]
		then
			echo "CLUE: Slightly Low! >_O"
		
		# If not then printing Too Low!
		else
			echo "CLUE: Too Low! O_O"
		fi
	fi
	
	# Taking input from user till user guess the correct number
	read -p "Guess the Number again: " num
	
	# Keeping track of number of attempts
	count=$((count+1))
done

echo "You have guessed the correct number $target in $count attempts"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⡆⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀
⠀⠀⠀⠠⢤⣦⠤⠀⠀⠉⢏⠀⠠⣤⣦⠄⠀⡸⠁⠀⠀⠀⣠⠹⠛⠏⠀⠀⠀⠀
⠀⣠⠀⠀⠉⠈⠐⢄⠀⠀⠈⢆⠀⠉⡏⠀⠰⠁⠀⠀⠠⠊⠀⠀⠠⢤⣦⡤⠀⠀
⠘⠛⠋⠒⠂⠤⢀⠀⠁⠀⣀⠀⠀⠀⠣⢤⣦⡤⠀⠁⠀⡀⠤⠒⠉⠈⠈⠁⠀⠀
⠀⠀⢠⣶⡄⠀⣀⣀⠀⠙⠛⢋⡀⠀⠀⡸⠉⠁⠀⠀⣁⡀⠠⠤⠄⠾⠷⠂⠀⠀
⣀⣤⣀⢀⣀⣀⠀⠀⠀⠀⠀⠀⠈⠀⠐⠀⠀⠀⠁⢤⣶⡄⠀⠀⣀⣀⡀⣀⣠⣀
⠘⠉⠁⠀⠀⠀⢀⡠⠄⠂⠀⡠⠀⠀⠀⠐⢄⠀⠀⠂⠠⠄⣀⠀⠀⠀⠀⠘⠛⠃
⠀⠀⠀⣶⣶⠉⠁⠀⢀⣄⠞⠀⠀⠀⡄⠀⠀⠑⠄⡀⠀⠀⠀⠉⢳⣾⡖⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠃⠀⠠⣴⣦⠄⠀⠈⠝⠛⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀"
