#!/usr/bin/env bash

section_header "Misc"

# Read file into string
echo "Reading README.md into string:"
file_as_string="$(<"README.md")"
printf '\t| %.24s\n' "$file_as_string"

# Read file into array
echo "Reading README.md into array:"
mapfile -t file_as_arr <"README.md"
printf '\t| %s\n' "${file_as_arr[0]}"

# Run a script in the background, ignore all output
run_in_background() {
	(nohup "$@" &>/dev/null &)
}
# run_in_background ./some_script.sh
