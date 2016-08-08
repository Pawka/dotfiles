#!/bin/bash

source functions.sh

log "Installing dotfiles..."

# Create required directories
mkdir -p ~/bin 

require git
require vim
require ruby
git submodule update --init

install curl
install ruby-dev # Required for some gems
install exuberant-ctags 
install xclip
install colordiff
install irssi
install tig # Git cli GUI
install python-pip
install ack-grep

# Gems
geminstall guard
geminstall guard-ctags-composer
geminstall guard-phpunit2
geminstall libnotify
geminstall tmuxinator
geminstall rake

# Powerline
if confirm "Do you want install Powerline? [y/n]"; then
    pipinstall powerline-status

    # Fonts
    mkdir -p ~/.fonts ~/.config/fontconfig/conf.d
    wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf > /dev/null 2>&1
    wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf > /dev/null 2>&1
    mv PowerlineSymbols.otf ~/.fonts/
    fc-cache -vf ~/.fonts
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fi

if ! [ -d ~/.oh-my-zsh ]; then
    log "Installing oh-my-zsh"
    curl -L http://install.ohmyz.sh | sh
fi

# PHP tools
if ! [ -f ~/bin/phpunit ]; then
    log "Installing phpunit"
    wget https://phar.phpunit.de/phpunit.phar
    chmod +x phpunit.phar
    mv phpunit.phar ~/bin/phpunit
fi

if ! [ -f ~/bin/psysh ]; then
    log "Installing psysh"
    wget psysh.org/psysh
    chmod +x psysh
    mv psysh ~/bin/psysh
fi

# Build symlinks
confirm "Build symlinks [y/n]?" && rake install
