# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="fishy"

# Set directory of custom plugins.
export ZSH_CUSTOM="$HOME/.zsh_custom"

# Load custom scripts file.
if [ -f $HOME/.zshrc.custom ]; then
    source $HOME/.zshrc.custom
fi

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    autojump
    git
    kube-ps1
    kubectl
    kubectx
    ssh-agent
    tmux
    terraform
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# Disable autocorrect
unsetopt correct_all

# Environment variables.
export PATH=~/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim

# FZF will use this command to list files. This leads to ignored temporary
# files, following .gitignore and other optimizations.
export FZF_DEFAULT_COMMAND='rg --files'

# Set configuration file for RipGrep.
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# GOPATH
export GOPATH="$HOME/gocode"
export PATH="$PATH:$GOPATH/bin"

# Cargo bin (Rust)
export PATH="$PATH:$HOME/.cargo/bin"

# Export locale
export LC_ALL="en_US.UTF-8"

# Bind keys for MacOS. If these bindings does not work - need to disable
# shortucts of Mission Control.
bindkey -e
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word
bindkey '\e[H'   beginning-of-line
bindkey '\e[F'   end-of-line

#Aliases
alias diff="colordiff"
alias imv="imv-x11"  # Since current Ubuntu install does not create imv binary.

# git: show list of local branches and allow to select those via fzf.
alias gb="git branch --sort=-committerdate --format='%(HEAD)%(color:yellow)%(refname:short)|%(color:bold green)%(committerdate:relative) %(color:magenta)%(color:reset)' --color=always | column -ts'|' | head -n 20 | fzf --ansi | sed 's/^*//g' | awk '{print \$1}' | xargs -n1 git checkout"

zstyle :omz:plugins:ssh-agent agent-forwarding on

# Load autojump config
[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh
# Load autojump installed via brew on MacOS.
[ -f /opt/homebrew/etc/profile.d/autojump.sh  ] && . /opt/homebrew/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

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
