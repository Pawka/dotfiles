#!/bin/sh

log()
{
    echo " > $@"
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

# Create required directories
mkdir -p ~/bin

require git
require vim
require ruby
require ruby-dev # Required for some gems
git submodule update --init

install exuberant-ctags 
install xclip
install colordiff

# Gems
geminstall guard
geminstall guard-ctags-composer
geminstall guard-phpunit2
geminstall libnotify
geminstall tmuxinator
geminstall rake

# Build symlinks
rake install

# PHP tools
if ! [ -f ~/bin/phpunit ]; then
    log "Installing phpunit"
    wget https://phar.phpunit.de/phpunit.phar
    chmod +x phpunit.phar
    mv phpunit.phar ~/bin/phpunit
else
    log "Already installed phpunit"
fi

if ! [ -f ~/bin/psysh ]; then
    log "Installing psysh"
    wget psysh.org/psysh
    chmod +x psysh
    mv psysh ~/bin/psysh
else
    log "Already installed psysh"
fi
