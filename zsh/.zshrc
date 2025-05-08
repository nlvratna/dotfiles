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

#zsh-autosuggestions
plugins=(git  zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



# Set up fzf key bindings and fuzzy completion
# I don't know do I need it
source <(fzf --zsh)


alias tn="$HOME/scripts/tmux-sessionizer.sh"
alias ds="$HOME/scripts/docker.sh"


