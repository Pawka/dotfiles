#!/bin/sh
#
# Various functions for install script.
#

log()
{
    echo " > $@"
}

confirm()
{
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case $response in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

require()
{
    TMP=`which $1`
    # Look for binary
    if [ $? -eq 1 ]; then
        # Look for package
        dpkg -s "$1" > /dev/null 2>&1 && {
            log "$1 package found"
        } || {
            log "$1 not found"
            exit 1
        }
    fi;
}

install()
{
    log "Installing $1"
    sudo apt-get install $1 > /dev/null
}

geminstall()
{
    require gem

    if [ `sudo gem list | grep $1 | wc -l` -eq 0 ]; then
        log "Installing $1"
        sudo gem install $1
    else
        log "Already installed $1"
    fi
}

pipinstall()
{
    require pip
    log "Installing $1"
    sudo pip install $1
}
