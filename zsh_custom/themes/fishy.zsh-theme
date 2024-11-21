# ZSH Theme emulating the Fish shell's default prompt.

_fishy_collapsed_wd() {
  local i pwd
  pwd=("${(s:/:)PWD/#$HOME/~}")
  if (( $#pwd > 1 )); then
    for i in {1..$(($#pwd-1))}; do
      if [[ "$pwd[$i]" = .* ]]; then
        pwd[$i]="${${pwd[$i]}[1,2]}"
      else
        pwd[$i]="${${pwd[$i]}[1]}"
      fi
    done
  fi
  echo "${(j:/:)pwd}"
}

readonly KUBE_TOGGLE_FILE="/tmp/kube_toggle"
# Toggle Kubernetes info.
ktoggle() {
    if [ -f "$KUBE_TOGGLE_FILE" ]; then
        rm "$KUBE_TOGGLE_FILE"
    else
        touch "$KUBE_TOGGLE_FILE"
    fi
}

_kube_info() {
    if [ -f "$KUBE_TOGGLE_FILE" ]; then
        echo "$(kube_ps1)"
    fi
}

KUBE_PS1_SYMBOL_ENABLE="false"
KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=" "
KUBE_PS1_CTX_COLOR="green"
KUBE_PS1_NS_COLOR="green"

_git_info() {
    local res="$(git_prompt_info)$(git_prompt_status)"
    if [ -n "$res" ]; then
        echo "%{$fg[yellow]%}${res}%{$reset_color%} "
    fi
}

local user_color='green'; [ $UID -eq 0 ] && user_color='red'
local host_color='white'; [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] && host_color='yellow'
PROMPT='$(_kube_info)$(_git_info)%{$fg[$user_color]%}%n%{$reset_color%}@%{$fg[$host_color]%}%m${return_status}%{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%}%(!.#.>) '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"
RPROMPT="${RPROMPT}"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"
