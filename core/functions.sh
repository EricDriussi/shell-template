#!/usr/bin/env bash

# Functions are declared in two ways:
a_func() {
	# Use local vars if inside a function
	local nice_var=1234
	echo "Use like any other var:"
	echo "${nice_var}"
}

# These are equivalent, althought this second one won't collide with aliases!
function another_func() {
	echo "himom"
}
