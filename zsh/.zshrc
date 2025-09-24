# export TERM=xterm-256color
# export COLORTERM=truecolor 

autoload -U colors && colors
autoload -U vcs_info
zmodload zsh/zprof

autoload -U compinit && compinit

precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b'
setopt prompt_subst

# NEWLINE=$'\n'
# PROMPT='${NEWLINE}%F{blue}%2~%f %F{8}${vcs_info_msg_0_}%f${NEWLINE}%(?.%F{green}❯%f.%F{red}❯%f) '
PROMPT='%F{blue}%2~%f %F{8}${vcs_info_msg_0_} %f%(?.%F{green}❯%f.%F{red}❯%f) '


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


bindkey -v

#fzf
source <(fzf --zsh)
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey "^j" backward-word
bindkey "^k" forward-word
bindkey -s ^g "tmux-sessionizer\n"




export MANPAGER="nvim +Man!"



