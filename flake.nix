{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl.url = "github:nix-community/NixOS-WSL";

    nvim.url = "git+file:./nvim";
    nvim.flake = false;
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nixos-wsl,
    nvim,
    ...
  }: let
    system = "x86_64-linux";

    overlays = [
      (final: prev: {
        brave = nixpkgs-unstable.legacyPackages.${prev.system}.brave;
      })
    ];

    pkgsFor = system:
      import nixpkgs {
        inherit system overlays;
        config.allowUnfree = true;
      };

    mkHome = {
      username,
      wsl ? false,
    }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsFor system;
        extraSpecialArgs = {inherit nvim wsl;};
        modules = [./home.nix];
      };
  in {
    homeConfigurations = {
      leela = mkHome {username = "leela";};
      leela-wsl = mkHome {
        username = "leela";
        wsl = true;
      };
    };

    nixosConfigurations.leela = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        nixos-wsl.nixosModules.wsl
        ./nixos/default.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.leela = import ./home.nix;
          home-manager.extraSpecialArgs = {
            inherit nvim;
            wsl = false;
          };
        }
      ];
    };
  };
}
