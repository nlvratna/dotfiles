{
  config,
  lib,
  pkgs,
  nvim,
  wsl ? false,
  ...
}: let
  isDarwin = pkgs.stdenv.isDarwin;
  isLinux = pkgs.stdenv.isLinux;
in {
  programs.home-manager.enable = true;

  home.username = "leela";
  home.homeDirectory = "/home/leela";
  home.stateVersion = "25.11";

  programs.info.enable = false;

  xdg.enable = true;

  # home.packages = with pkgs;
  #   [
  #     git
  #     ripgrep
  #     fd
  #     jq
  #     fzf
  #     tree
  #     curl
  #     btop
  #
  #     cmake
  #     python3
  #
  #     neovim
  #   ]
  #   ++ lib.optionals (isLinux && !wsl) [
  #     kitty
  #   ]
  #   ++ lib.optionals wsl [
  #     wezterm
  #   ];

  home.sessionVariables = {
    EDITOR = "nvim";
    PAGER = "less -FirSwX";
    LANG = "en_US.UTF-8";
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "nlvratna";
      user.email = "ratnachowdary56@gmail.com";
      color.ui = true;
      github.user = "nlvratna";
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = builtins.readFile ./zsh/zshrc;
    profileExtra = builtins.readFile ./zsh/zprofile;
  };

  programs.tmux.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      lua-language-server
      stylua
    ];
  };

  # ------------------------------------------------------------
  # Dotfiles
  # ------------------------------------------------------------

  xdg.configFile."nvim".source = nvim;
  xdg.configFile."tmux".source = ./tmux;

  xdg.configFile."gtk-3.0" = lib.mkIf (isLinux && !wsl) {
    source = ./gtk-3.0;
  };
  xdg.configFile."gtk-4.0" = lib.mkIf (isLinux && !wsl) {
    source = ./gtk-4.0;
  };

  xdg.configFile."hypr" = lib.mkIf (isLinux && !wsl) {
    source = ./hypr;
  };

  xdg.configFile."waybar" = lib.mkIf (isLinux && !wsl) {
    source = ./waybar;
  };

  home.file."bin" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };

  # ------------------------------------------------------------
  # Nix
  # ------------------------------------------------------------

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
}
