[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
set -o vi

autoload -Uz compinit && compinit

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git
setopt prompt_subst
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B${vcs_info_msg_0_} %1~ %#%b '

export FZF_DEFAULT_COMMAND='fd --no-ignore-vcs --exclude node_modules'
