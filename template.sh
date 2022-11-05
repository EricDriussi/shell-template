#!/usr/bin/env bash
# When in doubt, use bash (and set a file extension!)

# If any command fails, exit script
set -o errexit
# If accessing unset var, exit script (use ${VAR-} if not sure)
set -o nounset
# If any command in a pipe fails, the whole pipe is treated as failed
set -o pipefail
# Allow prepend TRACE=1 for debugging
if [[ "${TRACE-0}" == "1" ]]; then
	set -o xtrace
fi

# It's usually a good idea to ensure CWD is wherever the script lies
cd "$(dirname "$0")"
# You might have a legitimate need to avoid this

# Always double-quote vars
randomVar="Hi there!"
echo "Safely quoted random var:"
echo "${randomVar}"

# Prefer [[ ]] over [ ] or test for if/while statements
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then # Accept -h, --help, help, h and -help
	echo 'Usage: ./template.sh arg-one arg-two

Ideally, you should allow for long options (--stuff instead of -s).
This helps document the script.

This is a bash script template to make your life easier.

'
	exit
fi

# Send errors to stderr
echo '[[ERROR]] -> OMG AN ERROR!!!' >&2

main() {
	# Following set -o nounset
	echo "The following var definitely exists"
	echo "$HOME"
	echo "But I'm unsure about this one"
	echo "${MADEUPVAR-}"

	# Use local vars if inside a function
	local niceVar=1234
	echo "Do stuff with local var:"
	echo "${niceVar}"
}

main "$@"

# Shellcheck (https://www.shellcheck.net/) is your friend. Use it.
