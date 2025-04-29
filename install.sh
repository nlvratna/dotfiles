#!/usr/bin/env bash
# Improved Arch Linux Setup Script with Error Handling

# Error handling
set -e
trap 'echo "Error occurred at line $LINENO. Command: $BASH_COMMAND"' ERR

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install yay if not already installed
if ! command_exists yay; then
    echo "==> Installing yay"
    sudo pacman -S --needed git base-devel --noconfirm
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
    echo "==> Installed yay"
else
    echo "==> yay is already installed"
fi

# Install essential applications
echo "==> Installing required applications"
yay -S --needed neovim vim hyprland zen-browser-bin brave-bin sway go waybar ghostty tmux stow

# Install system utilities
echo "==> Installing system utilities"
yay -S --needed pavucontrol bluez bluez-utils bluetoothctl brightnessctl wl-clipboard grim slurp swaylock wofi thunar

# Install zsh and oh-my-zsh
echo "==> Installing zsh"
yay -S --needed zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "==> Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo "==> Installed oh-my-zsh"
else
    echo "==> oh-my-zsh is already installed"
fi

# Install Node Version Manager (NVM) if needed
if [ ! -d "$HOME/.nvm" ]; then
    echo "==> Installing NVM"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    echo "==> Installed NVM"
else
    echo "==> NVM is already installed"
fi

# Install additional tools
echo "==> Installing tools"
yay -S --needed docker fzf ripgrep zsh-syntax-highlighting make unzip gcc fd

# Install fonts
echo "==> Installing fonts"
yay -S --needed ttf-firacode-nerd

# Backup existing Hyprland config if it exists
if [ -f "$HOME/.config/hypr/hyprland.conf" ]; then
    echo "==> Backing up existing Hyprland configuration"
    mkdir -p "$HOME/.config/hypr.bak"
    mv "$HOME/.config/hypr/hyprland.conf" "$HOME/.config/hypr.bak/hyprland.conf.bak"
fi

# Create dotfiles directories if they don't exist
echo "==> Creating dotfiles directories"
for dir in nvim hypr ghostty tmux; do
    if [ ! -d "$dir" ]; then
        echo "==> Creating $dir directory"
        mkdir -p "$dir"
    fi
done



# Stow configurations if directories exist
echo "==> Applying dotfiles with stow"
# Only stow directories that exist
for dir in nvim hypr ghostty tmux; do
    if [ -d "$dir" ]; then
        stow -v -t "$HOME" "$dir"
        echo "==> Stowed $dir configuration"
    fi
done

# Set zsh as default shell if it isn't already
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "==> Setting zsh as default shell"
    chsh -s "$(which zsh)"
fi

echo "==> Setup complete! You may need to log out and back in for all changes to take effect."
