
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



# I might need to remove auto-suggestions
#zsh-autosuggestions
plugins=(git  zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion




if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
    exec Hyprland
fi

#I might change it to dotfiles/scipts/tmux-sessionizer
alias tn="$HOME/.local/bin/tmux-sessionizer"

# need to write a install script to setup basic stuff

