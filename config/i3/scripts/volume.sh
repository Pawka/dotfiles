#!/bin/bash
#
# Display current volume via notify-send.
#

function main {
    readonly volume=$(pactl list sinks \
        | grep '^[[:space:]]Volume:' \
        | awk '{ print $5  }')
    notify-send "Volume: $volume" \
        -t 200
}

main "$@"
