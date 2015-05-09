# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="fishy"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git symfony2 web-search tmux ssh-agent fabric)

source $ZSH/oh-my-zsh.sh

# Disable autocorrect
unsetopt correct_all

# Customize to your needs...
export PATH=~/.bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=vim

# Load custom scripts file.
if [ -f $HOME/.zshrc.custom ]; then
    source $HOME/.zshrc.custom
fi

#Aliases
alias diff="colordiff"
alias tmux="TERM=screen-256color-bce tmux"
alias st="st -e tmux"
alias ack="ack-grep"

alias -s log="tail -f"
alias -s html="gnome-open"

zstyle :omz:plugins:ssh-agent agent-forwarding on

stty -ixon #-ixoff
# Fix backspace key behaviour (remove ^H symbol)
stty erase ^H 
