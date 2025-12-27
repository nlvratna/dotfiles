# nixos/wsl.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  wsl.enable = true;
  wsl.defaultUser = "leela";

  system.stateVersion = "25.11";

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
    warn-dirty = false;
  };

  # ------------------------------------------------------------
  # User
  # ------------------------------------------------------------

  users.users.leela = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = ["wheel"];
  };

  programs.zsh.enable = true;

  # ------------------------------------------------------------
  # WSL-specific defaults
  # ------------------------------------------------------------

  # No bootloader in WSL
  boot.loader.grub.enable = false;

  # Networking is handled by Windows
  networking.networkmanager.enable = false;
  networking.useDHCP = false;

  # WSL provides its own DNS
  services.resolved.enable = false;

  # ------------------------------------------------------------
  # Security & convenience
  # ------------------------------------------------------------

  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
  ];
}
