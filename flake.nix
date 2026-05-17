{
  description = "NixOS Alexis";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, unstable, ... }:
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
      ];
    };
  };
}