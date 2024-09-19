#!/bin/bash

################
# Saumalya Sen #
################

# You are given a log file called server.log that contains entries of various server statuses. Each line in the log file is formatted as:

# [Timestamp] [ServerName] [Status]
# Example:
# 2024-09-19 12:45:32 server1 SUCCESS
# 2024-09-19 12:47:18 server2 FAILED
# 2024-09-19 12:50:44 server1 SUCCESS
# 2024-09-19 12:52:10 server2 FAILED

# Write a Bash script that does the following:

# Checking-1 if a log file was provided as a command-line argument
if [ "$#" -ne 1 ]; 
then
	echo "Error: $0 No_Argument_Passed"
	exit 1
fi

LOGFILE="$1"

# Checking-2 if the log file exists
if [ ! -f "$LOGFILE" ];
then
	echo "Error: '$LOGFILE' Special File/Directory Found"
	exit 1
fi

# Checking-3 if the file has a .log extension
if [[ ! "$LOGFILE" == *.log ]];
then
	echo "Error: '$LOGFILE' is not a log file, Please provide a .log file."
	exit 1
fi

# Extracting unique server names from the log file
server=$(awk '{print $3}' "$LOGFILE" | sort | uniq)

echo "Name of Servers:
$server
"

# Iterating through each server and count SUCCESS and FAILED statuses
for i in $server;
do
	# Counting the number of success and failure for each server
	success_count=$(grep "$i SUCCESS" "$LOGFILE" | wc -l)
	failure_count=$(grep "$i FAILED" "$LOGFILE" | wc -l)
	
	# Determining if the server is Healthy or Unhealthy
	if [ "$success_count" -gt "$failure_count" ];
	then
		status="Healthy"
	
	elif [ "$success_count" -eq "$failure_count" ];
	then
		status="Borderline"
	
	else
		status="Unhealthy"
	fi
	
	# Printing the results
	echo "Server: $i"
	echo "  SUCCESS count: $success_count"
	echo "  FAILURE count: $failure_count"
	echo "  Status: $status"
	echo
done

# Input:
# ./server_health.sh /mnt/c/Storage/Linux/server.log

# Output:

# Name of Servers:
# server1
# server2
# server3
# server4
# server5
# server6

# Server: server1
#   SUCCESS count: 12
#   FAILURE count: 6
#   Status: Healthy

# Server: server2
#   SUCCESS count: 3
#   FAILURE count: 6
#   Status: Unhealthy

# Server: server3
#   SUCCESS count: 8
#   FAILURE count: 8
#   Status: Borderline

# Server: server4
#   SUCCESS count: 1
#   FAILURE count: 4
#   Status: Unhealthy

# Server: server5
#   SUCCESS count: 3
#   FAILURE count: 4
#   Status: Unhealthy

# Server: server6
#   SUCCESS count: 1
#   FAILURE count: 0
#   Status: Healthy
