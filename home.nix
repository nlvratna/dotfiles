{
  config,
  pkgs,
  ...
}: {
  home.username = "leela";
  home.homeDirectory = "/home/leela";

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "nlvratna";
        email = "ratnachowdary56@gmail.com";
      };
      color.ui = true;
      alias = {
        prettyprint = ''          log --graph --abbrev-commit --decorate --format=format:'%C(bold
                      blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim
                      white)- %an%C(reset)%C(auto)%d%C(reset)' --all'';
      };
      github.user = "nlvratna";
    };
  };

  programs.zsh.enable = true;
  programs.tmux.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  xdg.configFile."nix/nix.conf".source = ./nix/nix.conf;
  xdg.configFile."nvim".source = ./nvim;
  xdg.configFile."hypr".source = ./hypr;
  xdg.configFile."sway".source = ./sway;
  xdg.configFile."waybar".source = ./waybar;

  xdg.configFile."kitty".source = ./kitty;
  xdg.configFile."wezterm".source = ./wezterm;
  xdg.configFile."ghostty".source = ./ghostty;

  xdg.configFile."zsh".source = ./zsh;
}
