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
plugins=(git mercurial composer symfony2 capistrano)

source $ZSH/oh-my-zsh.sh

#Disable autocorrect
unsetopt correct_all

# Customize to your needs...
export PATH=~/.bin/:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=vim

# Optimized version
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

#Aliases
alias diff="colordiff"
alias tmux="TERM=screen-256color-bce tmux"
alias st="st -e tmux"
alias mproc="mysql -u root -p -e 'SHOW PROCESSLIST;'"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
stty -ixon -ixoff
