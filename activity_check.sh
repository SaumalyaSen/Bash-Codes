#!/bin/bash

################
# Saumalya Sen #
################

# You are given a file called user_activity.txt that contains details of user logins in the following format:

# user1 2024-09-01 08:45:12
# user2 2024-09-01 09:10:23
# user3 2024-09-01 09:45:33
# user1 2024-09-01 10:15:42
# user2 2024-09-02 07:50:55
# user1 2024-09-02 08:22:31
# user3 2024-09-02 08:30:10
# user2 2024-09-03 09:05:13
# user1 2024-09-03 09:35:55
# Your task is to write a Bash script that:

# Counts the number of logins for each user on each day using grep and awk.
# Uses nested loops to process users and their login counts.
# If a user logs in more than 2 times on the same day, print a special message using if-else.

# If a user logs in more than twice on a specific day, print:

# Special Message: user1 logged in more than 2 times (4 times) on 2024-09-01!

if [ "$#" -ne 1 ];
then
	echo "Error: $0 No_Argument_Passed"
	exit 1
fi

ACTIVITYFILE="$1"

# Checking-2 if the txt file exists
if [ ! -f "$ACTIVITYFILE" ];
then
	echo "Error: '$ACTIVITYFILE' Special File/Directory Found"
	exit 1
fi

# Checking-3 if the file has a .txt extension
if [[ ! "$ACTIVITYFILE" == *.txt ]];
then
	echo "Error: '$ACTIVITYFILE' is not a txt file, Please provide a .txt file."
	exit 1
fi

# Storing the name of all the users
user=$(awk '{print $1}' "$ACTIVITYFILE" | sort | uniq)

echo "Name of Users:
$user
"

# Iterating through each user
for i in $user;
do
	# Storing the unique dates
	date=$(grep "$i" "$ACTIVITYFILE" | awk '{print $2}' | sort | uniq)

	# Iterating through each date
	for j in $date;
	do
		# Counting howmany dates user is workig
		count=$(grep "$i $j" "$ACTIVITYFILE" | wc -l)
		
		# If count is greater than 2 a special message will be printed
		if [ $count -gt 2 ];
		then
			echo "$i logged in more than 2 times ($count times) on $j!"

		# If count <= 2 then prints the normal output
		else
			echo "$i logged in $count time(s) on $j"
		fi

	done
done

# Input:
# ./activity_check.sh /mnt/c/Storage/Linux/user_activity.txt

# Output:
# Name of Users:
# user1
# user2
# user3

# user1 logged in more than 2 times (3 times) on 2024-09-01!
# user1 logged in 2 time(s) on 2024-09-02
# user1 logged in 1 time(s) on 2024-09-03
# user2 logged in 1 time(s) on 2024-09-01
# user2 logged in more than 2 times (4 times) on 2024-09-02!
# user2 logged in 1 time(s) on 2024-09-03
# user3 logged in 1 time(s) on 2024-09-01
# user3 logged in 2 time(s) on 2024-09-02
# user3 logged in 1 time(s) on 2024-09-03
