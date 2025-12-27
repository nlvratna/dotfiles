# nixos/default.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  # ------------------------------------------------------------
  # NixOS basics
  # ------------------------------------------------------------

  system.stateVersion = "25.11";

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
  };

  # ------------------------------------------------------------
  # Users
  # ------------------------------------------------------------

  users.users.leela = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  # ------------------------------------------------------------
  # Networking
  # ------------------------------------------------------------

  networking.networkmanager.enable = true;
  networking.hostName = "leela";

  # ------------------------------------------------------------
  # Time & locale
  # ------------------------------------------------------------

  time.timeZone = "UTC";

  i18n.defaultLocale = "en_US.UTF-8";

  # ------------------------------------------------------------
  # System packages
  # ------------------------------------------------------------

  environment.systemPackages = with pkgs; [
    vim
    waybar
    git
    wl-clipboard
    brave
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  programs.hyprland.enable = true;
  # ------------------------------------------------------------
  # WSL-specific bits
  # ------------------------------------------------------------

  # wsl.enable = true;
  # wsl.defaultUser = "leela";

  # ------------------------------------------------------------
  # Security
  # ------------------------------------------------------------

  security.sudo.wheelNeedsPassword = false;
}
