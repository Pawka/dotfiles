# source this file from your shell rc (~/.bashrc or ~/.zshrc)
# Usage: run "gopathmode on|off" to reset the monorepo direnv to the desired mode.

function gopathmode () {
	USAGE="$0 [ on | off ]\n\tshows or sets MONOREPO_GOPATH_MODE"
	[ $# -lt 1 ] && {
		[ -n "$MONOREPO_GOPATH_MODE" ] \
		&& echo "MONOREPO_GOPATH_MODE is on." \
		|| echo "MONOREPO_GOPATH_MODE is off."
		return
	}
	[ $# -gt 1 ] && echo "$USAGE" && return
	[ "$1" != "on" ] && [ "$1" != "off" ] && {
		echo "$USAGE"
		return
	}

	if [[ "$MONOREPO_GOPATH_MODE" != "1" && "$1" == "on" ]] ; then
		export MONOREPO_GOPATH_MODE=1
		repo=$(git config --get remote.origin.url || true)
		if [[ $repo =~ ":go-code" ]]; then
			direnv reload
		fi
	elif [[ -n "$MONOREPO_GOPATH_MODE" && "$1" == "off" ]] ; then
		unset MONOREPO_GOPATH_MODE
		repo=$(git config --get remote.origin.url || true)
		if [[ $repo =~ ":go-code" ]]; then
			direnv reload
		fi
	fi
}
