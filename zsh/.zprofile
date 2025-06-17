
#xdg stuff
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export TERM="xterm-256color"

export PATH=$HOME/bin:$HOME/.local/bin:$HOME/go/bin:$PATH
export GOBIN=$HOME/go/bin
if [[ -z "$DISPLAY" && "$(tty)" == "/dev/tty1" && -x "$(command -v hyprland)" ]]; then
    exec hyprland
    #exec sway
fi

