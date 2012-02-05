#!/bin/bash
#
# Author: Povilas Balzaravičius <pavvka@gmail.com>
#
# Script used to look up when pending delete domain status will be changed.
# When status is changed, user is notified with osd notification.
#

DOMAIN=$1
NOTIFY=`which notify-send`
TIMEOUT=5

while :
do
    PENDING=`whois $DOMAIN | grep pendingDelete | wc -l`
    if [ $PENDING == '0' ]; then
        $NOTIFY 'Domain is awailable!'
    fi
    sleep $TIMEOUT
done
