unsetopt correct_all

source ~/.zsh/aliases.zsh
source ~/.zsh/exports.zsh

# number of lines kept in history
export HISTSIZE=1000
# number of lines saved in the history after logout
export SAVEHIST=1000
# location of history
export HISTFILE=~/.zhistory
# append command to history file once executed
setopt inc_append_history

autoload -U compinit
compinit -i

autoload -U promptinit
promptinit

# Emacs bindings on console.
bindkey -e

zstyle ':completion::complete:*' use-cache 1

autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi
setopt prompt_subst

source ~/.zsh/spectrum.zsh

git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "(${ref#refs/heads/})"
}

PROMPT='%{$FG[110]%}%n@%m %{$FG[170]%}%~%{$FG[192]%}%{$reset_color%} $(git_prompt_info)%{$reset_color%} %{$FG[113]%}%# %{$reset_color%}'
