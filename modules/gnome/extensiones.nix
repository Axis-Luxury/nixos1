{ pkgs, ... }:

{
  environment.systemPackages = with pkgs.gnomeExtensions; [
    appindicator
    blur-my-shell
    dash-to-dock
  ];
}