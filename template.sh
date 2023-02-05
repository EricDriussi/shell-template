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

# Source files like so
source "core/flow_control.sh"
source "core/functions.sh"
source "core/redirect_output.sh"
source "core/vars.sh"

# Offer some help!
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then # Accept -h, --help, help, h and -help
	echo 'Usage: ./template.sh arg-one arg-two

Ideally, you should allow for long options (--stuff instead of -s).
This helps document the script.

This is a bash script template to make your life easier.

'
	exit
fi

main() {
	# Following set -o nounset
	echo "The following var definitely exists"
	echo "$HOME"
	echo "But I'm unsure about this one"
	echo "${MADEUPVAR-}"

	# Run custom func (sourced from functions.sh)
	a_func

}

main "$@"

# Shellcheck (https://www.shellcheck.net/) and Explainshell (https://explainshell.com/) are your friends!
