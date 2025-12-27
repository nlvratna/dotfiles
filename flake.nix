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
    overlays = [
      (final: prev: {
        brave = nixpkgs-unstable.legacyPackages.${prev.system}.brave;
      })
    ];

    mkPkgs = system:
      import nixpkgs {
        inherit system overlays;
        config.allowUnfree = true;
      };

    mkHome = import ./lib/mkHome.nix {
      inherit inputs mkPkgs nvim;
    };
  in {
    homeConfigurations = {
      leela = mkHome {
        system = "x86_64-linux";
        username = "leela";
      };

      leela-wsl = mkHome {
        system = "x86_64-linux";
        username = "leela";
        wsl = true;
      };
    };

    nixosConfigurations.leela = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-wsl.nixosModules.wsl
        ./nixos/default.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.users.leela = import ./home/leela.nix;
          home-manager.extraSpecialArgs = {
            inherit nvim;
            wsl = false;
          };
        }
      ];
    };
  };
}
