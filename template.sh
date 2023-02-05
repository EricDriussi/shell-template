#!/usr/bin/env bash
# When in doubt, use bash (and set a file extension!)

# If accessing unset var, exit script
# (use ${VAR-} if not sure if a var is set -> more in var.sh)
set -o nounset
# If any command fails, exit script
set -o errexit
# If any command in a pipe fails, the whole pipe is treated as failed
set -o pipefail
# Allow prepend TRACE=1 for debugging
if [[ "${TRACE-0}" == "1" ]]; then
	set -o xtrace
fi

# It's usually a good idea to set CWD to wherever the script lies
cd "$(dirname "$0")" # You might have a legitimate need to avoid this

# Offer some help!
if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then # Accept -h, --help, help, h and -help
	echo 'Usage: ./template.sh arg-one arg-two

Ideally, you should allow for long options (--stuff instead of -s).
This helps document the script.

'
	exit
fi

# Source files like so
source "core/flow_control.sh"
source "core/functions.sh"
source "core/redirect_output.sh"
source "core/vars.sh"

main() {
	a_func # Run custom func (sourced from functions.sh)
}

main "$@"

# Shellcheck (https://www.shellcheck.net/) and Explainshell (https://explainshell.com/) are your friends!
