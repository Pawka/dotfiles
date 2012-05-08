#!/bin/bash
#
# List today's calendar events.
#
# Requirements:
#   GoogleCL - http://code.google.com/p/googlecl/
#
# TODO:
# - Check if googlecl exists.
# - Merge events from calendars to single list (grep).
# - Cache results for smooth startup.
# - Check if internet connection exists.
# - Calendars in global dotfiles config.
#

cals=(Pawka Darbai Projektai Pramogos)
for cal in ${cals[*]}
do
    google calendar today --cal=$cal
done
