#!/bin/sh

log()
{
    echo " > $@"
}

require()
{
    TMP=`which $1`
    if [ $? -eq 1 ]; then
        log "$1 not found"
        exit 1
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


require git
require vim
git submodule update --init

install exuberant-ctags 
geminstall guard
geminstall guard-ctags-composer
geminstall guard-phpunit
