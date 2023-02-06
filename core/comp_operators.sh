#!/usr/bin/env bash

# Use = and != to compare STRING equality
if [[ "hi" = "hi" && "MOM" != "mom" ]]; then
	echo "hi mom!"
fi

# Use -eq and -ne to compare INTEGER equality
if [[ 1 -eq 1 && 2 -ne 3 ]]; then
	echo 123
fi

# Use -gt(>), -ge(>=), -lt(<) and -le(>=) to compare INTEGER value
if [[ 1 -ge 1 && 2 -gt 1 && 3 -le 3 && 2 -lt 3 ]]; then
	echo 123321
fi
