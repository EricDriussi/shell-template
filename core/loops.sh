#!/usr/bin/env bash

section_header "Loops"

# Classic for loop
for ((i = 0; i < 3; i++)); do
	echo "counting... $i"
done

# Classic for_in loop
for foo in {1..3}; do
	echo "$foo bar"
done

# Loop over a list!
my_array=(1 "2" 4 "hey!" 8)
for element in "${my_array[@]}"; do
	# Print every element in the array
	echo "$element"
done

while [[ 1 -gt 2 ]]; do
	echo "This will never run"
done

# Loop over a file line by line
echo "Reading README.md line by line:"
while read -r line; do
	# Format and truncate output
	printf '\t| %.50s\n' "$line"
done <"README.md"
