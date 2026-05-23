{
  description = "NixOS Alexis";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, unstable, home-manager, ... }:
  let
    system = "x86_64-linux";

    overlay-unstable = final: prev: {
      unstable = import unstable {
        inherit system;
        config.allowUnfree = true;
      };
    };

    pkgs = import nixpkgs {
      inherit system;
      overlays = [ overlay-unstable ];
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system pkgs;

      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.alexis = { 
            imports = [
              ./home
            ];
          };

          home-manager.extraSpecialArgs = { 
            theme = import ./modules/users/theme.nix { inherit (pkgs) lib;}; 
          };
        }
      ];
    };
  };
}