#!/usr/bin/env bash

echo -e '\n' ~~~~~~~~~~~~~~~~~~~ Handling Variables ~~~~~~~~~~~~~~~~~~~ '\n'

# Given set -o nounset (line 5 in template.sh)
echo "The following var definitely exists"
echo "$HOME"
echo "But I'm unsure about this one"
echo "${MADE_UP_VAR-}"
# Use ${VAR-} to safely source a possibly unsed variable

# Always double-quote vars
random_var="Hi there!"
echo "Safely quoted random var:"
echo "$random_var might work"
# echo "$random_varor it might not"
echo "To expand in a string use${random_var}and you'll be safe"
# When in doubt, use ${} to ensure shell expansion

# Declare arrays like so
my_array=(1 "2" 4 "hey!" 8)
echo "Array element num 3 is: ${my_array[3]}"

# Store the output of a command in a variable with $()
cmd_output=$(whoami)
echo "My name is... ${cmd_output}"
