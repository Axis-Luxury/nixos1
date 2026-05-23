{ ... }:

{
  imports = [
    ./desktop
    ./theme.nix
  ];

  programs.home-manager.enable = true;
  home.username = "alexis";
  home.homeDirectory = "/home/alexis";

  home.stateVersion = "25.05";
}