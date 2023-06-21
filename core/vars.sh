#!/usr/bin/env bash

section_header "Handling Variables"

# Given set -o nounset (line 5 in template.sh)
echo "The following var definitely exists"
echo "$HOME"
echo "But I'm unsure about this one"
echo "${MADE_UP_VAR-}"
# Use ${VAR-STRING} to use STRING ("" in this case) if VAR is unset
# Use ${VAR:-STRING} to use STRING if VAR is unset or empty

# Always double-quote vars
random_var="Hi there!"
echo "Safely quoted random var:"
echo "$random_var might work"
# echo "$random_varor it might not"
echo "To expand in a variable use${random_var}and you'll be safe"
# When in doubt, use ${} to ensure shell expansion

# Declare arrays like so
my_array=(1 "2" 4 "hey!" 8)
echo "Array element num 3 is: ${my_array[3]}"
echo "Each element separately: ${my_array[@]}"
echo "All elements as a single string: ${my_array[*]}"
# Add to array
my_array+=("stuff")
# Remove from array
unset "${my_array[-1]}" # On modern Bash, use -1 to get the last element
# Declare maps like so
my_map=(["one"]="foo" ["two"]="bar" ["three"]="baz")
# Same usage as an array, with key instead of index

# Store the output of a command in a variable with $()
cmd_output=$(whoami)
echo "My name is... ${cmd_output}"
