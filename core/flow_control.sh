#!/usr/bin/env bash
# Prefer [[ ]] over [ ] or test for if/while statements

# Use if statements to test for things:
# If var is set
unset_var=""
if [[ -n $unset_var ]]; then
	echo "This won't run!"
fi

# If file exists
if [[ -f /etc/hosts ]]; then
	echo "That's a file!"
fi

# If file is dir
if [[ -d /etc ]]; then
	echo "That's a dir!"
fi

# While loops keep things running
while [[ 1 -gt 2 ]]; do
	echo "This will never run"
done

# Classic for loop
for ((i = 0; i < 3; i++)); do
	echo "counting... $i"
done

# Classic for_in loop
for hi in $(seq 1 3); do
	echo "$hi mom"
done

# Loop over a list!
my_array=(1 "2" 4 "hey!" 8)
for element in "${my_array[@]}"; do
	# Print every element in the array
	echo "$element"
done
