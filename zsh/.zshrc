
# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH=$PATH:/usr/local/go/bin
#export PATH= "$HOME/.local/bin:$PATH"
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOBIN
export PATH="$HOME/bin:$PATH"

export PATH=$(echo $PATH | sed -e 's|/mnt/c/Windows/System32:||g' -e 's|/mnt/c/Program Files/...:||g')
# Path to your Oh My Zsh installation.

export ZSH="$HOME/.oh-my-zsh"
export TERM=xterm-256color
export COLORTERM=truecolor 
# cd ~ #for  wezterm
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"


# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"


plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(~/.local/bin/zoxide init --cmd cd zsh)" 
#
# bindkey '^l' sesh connect $(sesh list|fzf)


# HISTFILE=~/.zsh_history
# HISTSIZE=10000          # Number of commands to keep in memory
# SAVEHIST=10000          # Number of commands to save in the history file
# setopt hist_ignore_dups # Ignore duplicate entries
# setopt hist_ignore_all_dups # Ignore duplicates across sessions
# setopt hist_reduce_blanks # Remove extra blanks from history entries
# setopt hist_verify       # Show command before running on reuse


function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list | fzf --height 40% --reverse --border-label  --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions
