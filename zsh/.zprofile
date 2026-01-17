export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
# export TERM="xterm-256color"

# Base PATH
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Go
export GOBIN="$HOME/go/bin"
export PATH="$GOBIN:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/leela/.local/share/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/home/leela/.bun/_bun" ] && source "/home/leela/.bun/_bun"

if [[ -z "$DISPLAY" && "$(tty)" == "/dev/tty1" && -x "$(command -v hyprland)" ]]; then
    start-hyprland
fi
