#!/usr/bin/env bash

# Functions are declared in two ways:
a_func() {
	section_header "Functions"
	# Use local vars if inside a function
	local nice_var=1234
	echo "Use like any other var:"
	echo "${nice_var}"
}

# These are equivalent, althought this second one won't collide with aliases!
function another_func() {
	echo "himom"
}

# Ignore this: it's just a quick hack to pretty-print section headers
section_header() {
	header_len=60
	((pad_len = ("$header_len" - "${#1}") / 2))

	pad_chr="~"
	padding=$(printf "$pad_chr%.0s" $(seq 1 $pad_len))

	printf "\n %s %s %s\n\n" "$padding" "$1" "$padding"
}
