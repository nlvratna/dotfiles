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
  home.username = "leela";
  home.homeDirectory = "/home/leela";
  home.stateVersion = "25.05";

  xdg.enable = true;

  home.packages = with pkgs;
    [
      git
      ripgrep
      fd
      jq
      fzf
      tree
      curl
      btop
      brave

      cmake
      python3

      kitty
      neovim
    ]
    ++ lib.optionals (isLinux && !wsl) [
      hyprland
      xdg-desktop-portal-hyprland
      waybar
      grim
      slurp
      swaybg
      wl-clipboard
      firefox
      rofi
    ]
    ++ lib.optionals wsl [
      waybar
    ];

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

    initContent = ''
      source ${config.xdg.configHome}/zsh/zshrc
    '';

    profileExtra = ''
      source ${config.xdg.configHome}/zsh/zprofile
    '';
  };

  programs.tmux.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      lua-language-server
      stylua
    ];
  };

  # ------------------------------------------------------------
  # Dotfiles
  # ------------------------------------------------------------

  xdg.configFile."nvim".source = nvim;

  xdg.configFile."kitty" = lib.mkIf (isLinux && !wsl) {
    source = ./kitty;
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
