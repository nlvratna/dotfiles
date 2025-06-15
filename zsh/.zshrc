export MANPAGER="nvim +Man!"

export ZSH=$HOME/.zsh
export TERM=xterm-256color
export COLORTERM=truecolor 


# ZSH_THEME="robbyrussell"
# export ZSH="$HOME/.oh-my-zsh"
# plugins=(zsh-syntax-highlighting)
# source $ZSH/oh-my-zsh.sh


#History setup
export HISTFILE=$ZSH/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

#case insestive setup and tetris
autoload -Uz compinit && compinit 
autoload -Uz tetriscurses
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'




if [[ -z "$DISPLAY" && "$(tty)" == "/dev/tty1" ]]; then
    exec hyprland
    # exec sway
fi

#fzf
# source <(fzf --zsh)

[ -f "$HOME"/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source "$HOME"/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 



export STARSHIP_CONFIG="$HOME"/.config/starship/starship.toml

#zoxide command with cd and starship
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"


#node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion




bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# aliases
alias tn="$HOME/.local/bin/tmux-sessionizer"
alias ds="$HOME/.local/bin/docker-start"
alias tetris="tetriscurses"
alias v="nvim"
alias c="clear"


