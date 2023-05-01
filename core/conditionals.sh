#!/usr/bin/env bash

section_header "Conditionals"
# Prefer [[ ]] over [ ], ( ), or 'test' for if/while statements
# Check man test for other useful comparison flags

# Use if statements to test for things:
# If string has non-zero length
empty_string=""
if [[ -n $empty_string ]]; then
	echo "This won't run!"
fi

# Check if string B is contained in string A
a_string="Hi mom!"
if [[ $a_string == *mom* ]]; then
	echo "mom is in a_string."
fi

# Works for arrays too!
lorem=(ipsum dolor sit amet)
if [[ "${lorem[*]}" == *dolor* ]]; then
	echo "dolor is in lorem."
fi

# If file exists
if [[ -f /etc/hosts ]]; then
	echo "That's a file!"
fi

# If dir exists
if [[ -d /etc ]]; then
	echo "That's a dir!"
fi
