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
plugins=(git tmux ssh-agent fabric symfony2 taskwarrior ripgrep)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# Disable autocorrect
unsetopt correct_all

# Customize to your needs...
export PATH=~/.bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=vim

# FZF will use this command to list files. This leads to ignored temporary
# files, following .gitignore and other optimizations.
export FZF_DEFAULT_COMMAND='rg --files'

# Load custom scripts file.
if [ -f $HOME/.zshrc.custom ]; then
    source $HOME/.zshrc.custom
fi

#Aliases
alias diff="colordiff"
alias weather="curl http://wttr.in/Vilnius"
alias sl="ls"

alias -s log="tail -f"
alias -s html="gnome-open"

zstyle :omz:plugins:ssh-agent agent-forwarding on

# stty -ixon #-ixoff
# Fix backspace key behaviour (remove ^H symbol)
# stty erase ^H 
# stty erase '^?'

# Load autojump config
[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh

autoload -U compinit && compinit -u

# GOPATH
export GOPATH="$HOME/gocode"
export PATH="$PATH:$GOPATH/bin"

# Export locale
export LC_ALL="en_US.UTF-8"

# Colorful man pages
# http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
man() {
    env \
        LESS_TERMCAP_md=$(printf "\e[1;36m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;40;92m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
