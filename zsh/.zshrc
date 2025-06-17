# export TERM=xterm-256color
# export COLORTERM=truecolor 

autoload -Uz compinit && compinit 
autoload -Uz tetriscurses
# export ZSH="$HOME/.oh-my-zsh"
# source $ZSH/oh-my-zsh.sh

# ZSH_THEME="robbyrussell"
# plugins=(zsh-syntax-highlighting)


#History setup
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS


#case insestive setup and tetris
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

#❯
bindkey -v
#fzf
 source <(fzf --zsh)
 bindkey '^p' history-search-backward
 bindkey '^n' history-search-forward


autoload -Uz vcs_info
precmd() { vcs_info }

setopt prompt_subst

zstyle ':vcs_info:git:*' formats '%b'

NEWLINE=$'\n'
PROMPT='${NEWLINE}%F{152}%1~%f %F{8}${vcs_info_msg_0_}%f${NEWLINE}%(?.%F{green}❯%f.%F{red}❯%f) '
# [ -f "$HOME"/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh ] && source "$HOME"/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh 

export STARSHIP_CONFIG="$HOME"/.config/starship/starship.toml

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


# One day
