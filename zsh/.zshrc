
 export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH=$PATH:/usr/local/go/bin
#export PATH= "$HOME/.local/bin:$PATH"
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOBIN
export PATH="$HOME/bin:$PATH"

export PATH=$(echo $PATH | sed -e 's|/mnt/c/Windows/System32:||g')
# Path to your Oh My Zsh installation.

export ZSH="$HOME/.oh-my-zsh"
export TERM=xterm-256color
export COLORTERM=truecolor 
ZSH_THEME="robbyrussell"



# I might need to remove auto-suggestions
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


HISTFILE=~/.zsh_history
HISTSIZE=10000          # Number of commands to keep in memory
SAVEHIST=10000          # Number of commands to save in the history file
setopt hist_ignore_dups # Ignore duplicate entries
setopt hist_ignore_all_dups # Ignore duplicates across sessions
setopt hist_reduce_blanks # Remove extra blanks from history entries
setopt hist_verify       # Show command before running on reuse


if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
    exec Hyprland
fi


# need to write a install script to setup basic stuff

