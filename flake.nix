{
  description = "NixOS Alexis";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, unstable, home-manager, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem { # crear sistema 
      inherit system;

      specialArgs = {
        pkgsUnstable = import unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };

      modules = [
        ./configuration.nix
        
        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.alexis = import ./home { pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux; };
        }
      ];
    };
  };
}