
 export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH=$PATH:/usr/local/go/bin
#export PATH= "$HOME/.local/bin:$PATH"
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOBIN
export PATH="$HOME/bin:$PATH"


# Path to your Oh My Zsh installation.

export ZSH="$HOME/.oh-my-zsh"
export TERM=xterm-256color
export COLORTERM=truecolor 
ZSH_THEME="robbyrussell"

#who deleted this
eval "$(zoxide init --cmd cd zsh)"

# I might need to remove auto-suggestions
#zsh-autosuggestions
plugins=(git  zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion




if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
    # exec Hyprland
    # will try out hyrpland for some time
    exec sway
fi

# Set up fzf key bindings and fuzzy completion
# I don't know do I need it
source <(fzf --zsh)


#I might change it to dotfiles/scipts/tmux-sessionizer
alias tn="$HOME/scripts/tmux-sessionizer.sh"
alias ds="$HOME/scripts/docker.sh"

# need to write a install script to setup basic stuff

