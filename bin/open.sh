#!/usr/bin/env bash

#
# OS agsnositc tool for opening files and URLs.
#

is_osx() {
	local platform
    platform=$(uname)
	[ "$platform" == "Darwin" ]
}

main() {
    local tool="xdg-open"
    if is_osx; then
        tool="open"
    fi

    $tool "$@"
}

main "$@"
