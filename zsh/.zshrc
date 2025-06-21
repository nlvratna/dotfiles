# export TERM=xterm-256color
# export COLORTERM=truecolor 

# export ZSH="$HOME/.oh-my-zsh"
# source $ZSH/oh-my-zsh.sh

# ZSH_THEME="robbyrussell"
# plugins=(zsh-syntax-highlighting)


autoload -U colors && colors
autoload -U vcs_info

zmodload zsh/complist
autoload -U compinit && compinit
autoload -U tetriscurses # this is the only one I need
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'
setopt prompt_subst

NEWLINE=$'\n'
PROMPT='${NEWLINE}%F{blue}%2~%f %F{8}${vcs_info_msg_0_}%f${NEWLINE}%(?.%F{green}❯%f.%F{red}❯%f) '


setopt no_case_glob no_case_match # make cmp case insensitive
setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd


#History setup
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
HISTCONTROL=ignoreboth


#❯
# may be not now
# bindkey -v
#fzf
source <(fzf --zsh)
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey "^H" backward-kill-word
bindkey "^j" backward-word
bindkey "^k" forward-word



# export STARSHIP_CONFIG="$HOME"/.config/starship/starship.toml

#zoxide command with cd and starship
# eval "$(zoxide init --cmd cd zsh)"
# eval "$(starship init zsh)"

# [ -f "$HOME"/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source "$HOME"/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 

#node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export MANPAGER="nvim +Man!"

# aliases
alias tn="$HOME/.local/bin/tmux-sessionizer"
alias ds="$HOME/.local/bin/docker-start"
alias tetris="tetriscurses"
alias v="nvim"
alias c="clear"
