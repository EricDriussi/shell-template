#!/usr/bin/env bash

section_header "Handling STDOUT and STDERR"

# Silence all errors of a command
ls -la 2>/dev/null
# Silence all output of a command (including errors)
ls -la >/dev/null 2>&1

# Send errors to stderr
echo '[[ERROR]] -> OMG AN ERROR!!!' >&2
